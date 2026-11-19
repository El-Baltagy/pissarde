import 'dart:convert';
import 'dart:io';
import '../utils_spinner.dart';

const String kFirebaseCustomPath = r'D:\programmes\firebase.exe';

class FirebaseAccountInfo {
  final List<String> accounts;
  final String? activeAccount;
  FirebaseAccountInfo({required this.accounts, this.activeAccount});
}

void main() async {
  print('\x1B[2J\x1B[0;0H'); // Clear console
  print('🔥 \x1B[31mFirebase Setup for Flutter Project\x1B[0m');
  print('===========================================');

  // 1. Check for Firebase CLI
  if (!await _checkCommand('firebase')) {
    print('❌ \x1B[31mFirebase CLI not found.\x1B[0m');
    stdout.write('Would you like to attempt automatic installation? [y/N]: ');
    final installChoice = stdin.readLineSync()?.trim().toLowerCase() ?? '';

    if (installChoice == 'y') {
      await _installFirebaseCLI();
      if (!await _checkCommand('firebase')) {
        print('❌ \x1B[31mInstallation failed or firebase is still not in PATH.\x1B[0m');
        print('Please restart your terminal or install manually: https://firebase.google.com/docs/cli');
        return;
      }
    } else {
      print('👉 Install it manually: https://firebase.google.com/docs/cli#install_the_firebase_cli');
      return;
    }
  }

  // 2. Account Login & Account Selection
  final String? activeEmail = await _handleFirebaseAccountSelection();
  if (activeEmail == null) {
    print('❌ No active Firebase account selected. Aborting.');
    return;
  }

  // 3. Project Selection (Enforces picking an existing project)
  final String? selectedProjectId = await _selectFirebaseProject(activeEmail: activeEmail);
  if (selectedProjectId == null) {
    print('❌ No Firebase project selected. Aborting.');
    return;
  }

  // 4. Check/Install FlutterFire CLI
  final flutterFireSpinner = Spinner('Checking FlutterFire CLI');
  flutterFireSpinner.start();
  if (!await _checkCommand('flutterfire')) {
    flutterFireSpinner.stop('Installing FlutterFire CLI...');
    final installSpinner = Spinner('Activating flutterfire_cli');
    installSpinner.start();
    await Process.run('dart', ['pub', 'global', 'activate', 'flutterfire_cli'], runInShell: true);
    installSpinner.stop('✅ FlutterFire CLI activated!');
  } else {
    flutterFireSpinner.stop('✅ FlutterFire CLI is ready.');
  }

  // 5. Add Firebase Core and optional plugins
  final pubspecFile = File('pubspec.yaml');
  final pubContent = pubspecFile.readAsStringSync();

  if (!pubContent.contains('firebase_core:')) {
    final pubspecSpinner = Spinner('Adding firebase_core');
    pubspecSpinner.start();
    await Process.run('flutter', ['pub', 'add', 'firebase_core'], runInShell: true);
    pubspecSpinner.stop('✅ firebase_core added.');
  }

  print('\n📦 Would you like to add common Firebase plugins?');
  final plugins = {
    'firebase_auth': 'Authentication',
    'cloud_firestore': 'Firestore Database',
    'firebase_messaging': 'Cloud Messaging (Push)',
    'firebase_analytics': 'Analytics',
    'firebase_crashlytics': 'Crashlytics',
    'firebase_storage': 'Storage',
  };

  for (var entry in plugins.entries) {
    if (!pubContent.contains('${entry.key}:')) {
      stdout.write('Add ${entry.value} (${entry.key})? [y/N]: ');
      final input = stdin.readLineSync()?.trim().toLowerCase() ?? '';
      if (input == 'y') {
        final spinner = Spinner('Adding ${entry.key}');
        spinner.start();
        await Process.run('flutter', ['pub', 'add', entry.key], runInShell: true);
        spinner.stop('✅ ${entry.key} added.');
      }
    }
  }

  // 6. Configuration Mode (Flavor vs Standard)
  final flavors = _getFlavorsFromGradle();

  if (flavors.isEmpty) {
    print('\nℹ️ \x1B[34mNo multi-flavor setup detected. Configuring standard project...\x1B[0m');
    await _configureStandard(projectId: selectedProjectId, account: activeEmail);
  } else {
    print('\n🎯 \x1B[34mMulti-Flavor setup detected: (${flavors.map((f) => f.name).join(', ')})\x1B[0m');
    await _configureFlavors(flavors, projectId: selectedProjectId, account: activeEmail);
  }

  // 7. Flavor Migration (Only run if flavors exist!)
  if (flavors.isNotEmpty) {
    print('\n📦 \x1B[34mMoving Firebase configuration into flavor_config.dart...\x1B[0m');
    final migrationFile = File('lib/core/tools/firebase/move_firebase_config_into_flavor.dart');
    if (migrationFile.existsSync()) {
      final migrationProcess = await Process.start(
        'dart',
        ['run', migrationFile.path],
        runInShell: true,
        mode: ProcessStartMode.inheritStdio,
      );
      await migrationProcess.exitCode;
    }

    final switchFlavorFile = File('lib/core/tools/flavors/switch_default_flavor.dart');
    if (switchFlavorFile.existsSync()) {
      final autoSwitch = await Process.start(
        'dart',
        ['run', switchFlavorFile.path, 'dev'],
        runInShell: true,
        mode: ProcessStartMode.inheritStdio,
      );
      await autoSwitch.exitCode;
    }
  }

  // 8. Update Native Files
  print('\n🛠️  Updating native build files...');
  _updateProjectBuildGradle();
  _updateAppBuildGradle();
  _updateIosAppDelegate();

  print('\n\x1B[32m🚀 Firebase setup successfully assigned to project "$selectedProjectId"!\x1B[0m');
  print('===========================================');
  if (flavors.isEmpty) {
    print('Next Steps:');
    print('1. Ensure you initialize Firebase in main.dart:');
    print("   import 'firebase_options.dart';");
    print('   ...');
    print('   WidgetsFlutterBinding.ensureInitialized();');
    print('   await Firebase.initializeApp(');
    print('     options: DefaultFirebaseOptions.currentPlatform,');
    print('   );');
  } else {
    print('Next Steps:');
    print('1. Ensure you initialize Firebase in main.dart:');
    print('   await Firebase.initializeApp(options: AppFlavorConfig.instance.firebaseOptions);');
  }
}

Future<String> _getFirebaseCommand() async {
  try {
    final result = await Process.run('firebase', ['--version'], runInShell: true);
    if (result.exitCode == 0) return 'firebase';
  } catch (_) {}

  if (Platform.isWindows && File(kFirebaseCustomPath).existsSync()) {
    return kFirebaseCustomPath;
  }

  return 'firebase';
}

Future<FirebaseAccountInfo> _getFirebaseAccounts() async {
  final command = await _getFirebaseCommand();
  try {
    final result = await Process.run(command, ['login:list'], runInShell: true);
    final output = result.stdout.toString();
    final lines = output.split('\n').map((l) => l.trim()).toList();
    final accounts = <String>[];
    String? active;

    final emailRegex = RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}');

    for (final line in lines) {
      final match = emailRegex.firstMatch(line);
      if (match != null) {
        final email = match.group(0)!;
        if (!accounts.contains(email)) {
          accounts.add(email);
        }
        if (line.contains('(current)') ||
            line.toLowerCase().contains('logged in as $email'.toLowerCase())) {
          active = email;
        }
      }
    }

    if (active == null && accounts.isNotEmpty) {
      active = accounts.first;
    }

    return FirebaseAccountInfo(accounts: accounts, activeAccount: active);
  } catch (_) {
    return FirebaseAccountInfo(accounts: [], activeAccount: null);
  }
}

Future<String?> _handleFirebaseAccountSelection() async {
  final command = await _getFirebaseCommand();
  while (true) {
    final info = await _getFirebaseAccounts();

    if (info.accounts.isEmpty) {
      print('\n👤 \x1B[33mYou are not logged into Firebase.\x1B[0m');
      stdout.write('Would you like to log in now? [Y/n]: ');
      final choice = stdin.readLineSync()?.trim().toLowerCase() ?? 'y';
      if (choice == '' || choice == 'y') {
        final proc = await Process.start(command, ['login'], runInShell: true, mode: ProcessStartMode.inheritStdio);
        await proc.exitCode;
        continue;
      } else {
        print('⚠️ Warning: Firebase operations require login.');
        return null;
      }
    }

    print('\n👤 \x1B[34mLogged-in Firebase Accounts:\x1B[0m');
    for (var i = 0; i < info.accounts.length; i++) {
      final email = info.accounts[i];
      final isCurrent = email == info.activeAccount;
      print('  ${i + 1}) $email ${isCurrent ? "\x1B[32m(Active)\x1B[0m" : ""}');
    }
    final addOptionIndex = info.accounts.length + 1;
    print('  $addOptionIndex) [+] Log in with another account');

    stdout.write('Select an account to use (1-${info.accounts.length}) [Default: 1]: ');
    final input = stdin.readLineSync()?.trim() ?? '';

    if (input.isEmpty || input == '1') {
      final selectedEmail = info.accounts[0];
      if (selectedEmail != info.activeAccount) {
        print('🔄 Switching active account to $selectedEmail...');
        await Process.run(command, ['login:use', selectedEmail], runInShell: true);
      }
      print('✅ Using account: $selectedEmail');
      return selectedEmail;
    }

    final choiceIndex = int.tryParse(input);
    if (choiceIndex == addOptionIndex) {
      print('🔑 Authorizing additional Firebase account...');
      final addProc = await Process.start(command, ['login:add'], runInShell: true, mode: ProcessStartMode.inheritStdio);
      await addProc.exitCode;
      continue;
    }

    if (choiceIndex != null && choiceIndex >= 1 && choiceIndex <= info.accounts.length) {
      final selectedEmail = info.accounts[choiceIndex - 1];
      if (selectedEmail != info.activeAccount) {
        print('🔄 Switching active account to $selectedEmail...');
        final switchRes = await Process.run(command, ['login:use', selectedEmail], runInShell: true);
        if (switchRes.exitCode != 0) {
          print('⚠️ Could not switch account: ${switchRes.stderr}');
        }
      }
      print('✅ Using account: $selectedEmail');
      return selectedEmail;
    }

    print('⚠️ Invalid selection. Please try again.');
  }
}

Future<String?> _selectFirebaseProject({required String activeEmail}) async {
  final command = await _getFirebaseCommand();
  try {
    final spinner = Spinner('Fetching Firebase projects');
    spinner.start();
    final result = await Process.run(
      command,
      ['projects:list', '--json'],
      runInShell: true,
    );
    spinner.stop('✅ Fetched Firebase projects.');

    if (result.exitCode != 0) {
      print('⚠️ Could not list Firebase projects: ${result.stderr}');
      return null;
    }

    final raw = result.stdout.toString().trim();
    final start = raw.indexOf('[');
    final end = raw.lastIndexOf(']');
    if (start == -1 || end <= start) {
      print('⚠️ Could not parse the Firebase projects list.');
      return null;
    }

    final decoded = jsonDecode(raw.substring(start, end + 1));
    if (decoded is! List) return null;

    final projects = decoded
        .whereType<Map>()
        .map((p) => (
              id: (p['projectId'] ?? '').toString(),
              name: (p['displayName'] ?? p['projectId'] ?? '').toString(),
            ))
        .where((p) => p.id.isNotEmpty)
        .toList();

    if (projects.isEmpty) {
      print('ℹ️ No Firebase projects found for account $activeEmail.');
      return null;
    }

    print('\n📁 \x1B[34mExisting Firebase projects for $activeEmail:\x1B[0m');
    for (var i = 0; i < projects.length; i++) {
      print('  ${i + 1}) ${projects[i].name} (${projects[i].id})');
    }

    while (true) {
      stdout.write('\x1B[33mSelect project number to assign (1-${projects.length}): \x1B[0m');
      final input = stdin.readLineSync()?.trim() ?? '';
      final index = int.tryParse(input);
      if (index != null && index >= 1 && index <= projects.length) {
        final selected = projects[index - 1];
        print('✅ \x1B[32mAssigned existing project: ${selected.name} (${selected.id})\x1B[0m');
        return selected.id;
      }
      print('⚠️ Please select an existing project from the list (do not create new).');
    }
  } catch (e) {
    print('⚠️ Could not read Firebase projects: $e');
    return null;
  }
}

List<FlavorData> _getFlavorsFromGradle() {
  final file = File('android/app/flavorizr.gradle.kts');
  if (!file.existsSync()) return [];

  final content = file.readAsStringSync();
  final flavors = <FlavorData>[];

  final regExp = RegExp(r'create\("(.+?)"\)\s*\{[\s\S]*?applicationId\s*=\s*"(.+?)"', multiLine: true);
  final matches = regExp.allMatches(content);

  for (final match in matches) {
    if (match.groupCount >= 2) {
      flavors.add(FlavorData(match.group(1)!, match.group(2)!));
    }
  }

  return flavors;
}

class FlavorData {
  final String name;
  final String applicationId;
  FlavorData(this.name, this.applicationId);
}

Future<bool> _checkCommand(String command) async {
  try {
    final result = await Process.run(command, ['--version'], runInShell: true);
    if (result.exitCode == 0) return true;

    if (command == 'firebase' && Platform.isWindows) {
      if (File(kFirebaseCustomPath).existsSync()) {
        final pResult = await Process.run(kFirebaseCustomPath, ['--version'], runInShell: true);
        if (pResult.exitCode == 0) return true;
      }
    }
    return false;
  } catch (_) {
    if (command == 'firebase' && Platform.isWindows) {
      try {
        if (File(kFirebaseCustomPath).existsSync()) {
          final pResult = await Process.run(kFirebaseCustomPath, ['--version'], runInShell: true);
          if (pResult.exitCode == 0) return true;
        }
      } catch (__) {
        return false;
      }
    }
    return false;
  }
}

Future<void> _configureStandard({required String projectId, String? account}) async {
  print('\n📝 \x1B[34mAssigning Firebase project "$projectId"...\x1B[0m');

  final command = await _getFlutterFireCommand();
  final executable = command.split(' ').first;
  final baseArgs = command.split(' ').skip(1).toList();

  final args = [
    ...baseArgs,
    'configure',
    '--project=$projectId',
    if (account != null && account.isNotEmpty) '--account=$account',
    '--platforms=android,ios',
    '--yes',
  ];

  final process = await Process.start(
    executable,
    args,
    runInShell: true,
    mode: ProcessStartMode.inheritStdio,
  );
  await process.exitCode;
}

Future<void> _configureFlavors(List<FlavorData> flavors, {required String projectId, String? account}) async {
  for (final flavor in flavors) {
    print('\n📝 \x1B[34mConfiguring ${flavor.name.toUpperCase()} flavor for project "$projectId"...\x1B[0m');
    await _runFlutterFireConfig(
      flavor: flavor.name,
      output: 'lib/firebase_options_${flavor.name}.dart',
      bundleId: flavor.applicationId,
      packageName: flavor.applicationId,
      projectId: projectId,
      account: account,
    );
  }
}

Future<void> _runFlutterFireConfig({
  required String flavor,
  required String output,
  required String bundleId,
  required String packageName,
  required String projectId,
  String? account,
}) async {
  print('--- Configuring for $flavor ---');
  final command = await _getFlutterFireCommand();
  final executable = command.split(' ').first;
  final baseArgs = command.split(' ').skip(1).toList();

  final process = await Process.start(
    executable,
    [
      ...baseArgs,
      'configure',
      '--project=$projectId',
      if (account != null && account.isNotEmpty) '--account=$account',
      '--out=$output',
      '--ios-bundle-id=$bundleId',
      '--android-package-name=$packageName',
      '--platforms=android,ios',
      '--yes',
    ],
    runInShell: true,
    mode: ProcessStartMode.inheritStdio,
  );
  await process.exitCode;

  // Move Native Files to Flavor Folders
  print('📦 Moving native config files for $flavor...');

  final androidSource = File('android/app/google-services.json');
  if (androidSource.existsSync()) {
    final androidTargetDir = Directory('android/app/src/$flavor');
    if (!androidTargetDir.existsSync()) androidTargetDir.createSync(recursive: true);
    androidSource.renameSync('${androidTargetDir.path}/google-services.json');
    print('✅ Moved google-services.json to android/app/src/$flavor/');
  }

  final iosSource = File('ios/Runner/GoogleService-Info.plist');
  if (iosSource.existsSync()) {
    final iosTargetDir = Directory('ios/Runner/Firebase/$flavor');
    if (!iosTargetDir.existsSync()) iosTargetDir.createSync(recursive: true);
    iosSource.renameSync('${iosTargetDir.path}/GoogleService-Info.plist');
    print('✅ Moved GoogleService-Info.plist to ios/Runner/Firebase/$flavor/');
  }
}

Future<String> _getFlutterFireCommand() async {
  if (await _checkCommand('flutterfire')) return 'flutterfire';
  return 'dart pub global run flutterfire_cli:flutterfire';
}

Future<void> _installFirebaseCLI() async {
  print('Attempting to install Firebase CLI automatically...');

  if (await _checkCommand('npm')) {
    final spinner = Spinner('Installing via npm');
    spinner.start();
    await Process.run('npm', ['install', '-g', 'firebase-tools'], runInShell: true);
    spinner.stop('✅ Firebase CLI installed via npm!');
    return;
  }

  if (Platform.isWindows) {
    final spinner = Spinner('Downloading firebase.exe');
    spinner.start();

    final targetDir = Directory(kFirebaseCustomPath).parent;
    if (!targetDir.existsSync()) targetDir.createSync(recursive: true);

    await Process.run('powershell', [
      '-Command',
      'Invoke-WebRequest -Uri "https://firebase.tools/bin/win/latest" -OutFile "$kFirebaseCustomPath"'
    ], runInShell: true);
    spinner.stop('✅ Downloaded firebase.exe to $kFirebaseCustomPath');
    return;
  }

  print('❌ \x1B[31mCould not install automatically.\x1B[0m');
  print('Please install manually: https://firebase.google.com/docs/cli');
}

void _updateProjectBuildGradle() {
  final settingsKtsFile = File('android/settings.gradle.kts');
  final ktsFile = File('android/build.gradle.kts');
  final groovyFile = File('android/build.gradle');

  if (settingsKtsFile.existsSync()) {
    var content = settingsKtsFile.readAsStringSync();
    if (!content.contains('com.google.gms.google-services')) {
      if (content.contains('plugins {')) {
        content = content.replaceFirst(
          'plugins {',
          'plugins {\n    id("com.google.gms.google-services") version "4.4.2" apply false',
        );
        settingsKtsFile.writeAsStringSync(content);
        print('✅ Added google-services plugin to android/settings.gradle.kts');
        return;
      }
    } else {
      print('ℹ️ google-services plugin already present in android/settings.gradle.kts');
      return;
    }
  }

  if (ktsFile.existsSync()) {
    var content = ktsFile.readAsStringSync();
    if (!content.contains('com.google.gms.google-services')) {
      final pluginBlock = 'plugins {\n    id("com.google.gms.google-services") version "4.4.2" apply false\n}\n\n';
      if (content.contains('plugins {')) {
        content = content.replaceFirst('plugins {', 'plugins {\n    id("com.google.gms.google-services") version "4.4.2" apply false');
      } else {
        content = pluginBlock + content;
      }
      ktsFile.writeAsStringSync(content);
      print('✅ Updated android/build.gradle.kts');
    }
  } else if (groovyFile.existsSync()) {
    var content = groovyFile.readAsStringSync();
    if (!content.contains('com.google.gms.google-services')) {
      final pluginBlock = 'plugins {\n    id \'com.google.gms.google-services\' version \'4.4.2\' apply false\n}\n\n';
      if (content.contains('plugins {')) {
        content = content.replaceFirst('plugins {', 'plugins {\n    id \'com.google.gms.google-services\' version \'4.4.2\' apply false');
      } else {
        content = pluginBlock + content;
      }
      groovyFile.writeAsStringSync(content);
      print('✅ Updated android/build.gradle');
    }
  }
}

void _updateAppBuildGradle() {
  final ktsFile = File('android/app/build.gradle.kts');
  final groovyFile = File('android/app/build.gradle');

  if (ktsFile.existsSync()) {
    var content = ktsFile.readAsStringSync();
    bool updated = false;

    if (!content.contains('id("com.google.gms.google-services")')) {
      content = content.replaceFirst('plugins {', 'plugins {\n    id("com.google.gms.google-services")');
      updated = true;
    }

    if (!content.contains('com.google.firebase:firebase-bom')) {
      final depBlock = '\ndependencies {\n    implementation(platform("com.google.firebase:firebase-bom:33.7.0"))\n    implementation("com.google.firebase:firebase-analytics")\n}\n';
      if (content.contains('dependencies {')) {
        content = content.replaceFirst('dependencies {', 'dependencies {\n    implementation(platform("com.google.firebase:firebase-bom:33.7.0"))\n    implementation("com.google.firebase:firebase-analytics")');
      } else {
        content += depBlock;
      }
      updated = true;
    }

    if (updated) {
      ktsFile.writeAsStringSync(content);
      print('✅ Updated android/app/build.gradle.kts');
    }
  } else if (groovyFile.existsSync()) {
    var content = groovyFile.readAsStringSync();
    bool updated = false;

    if (!content.contains('com.google.gms.google-services')) {
      content = content.replaceFirst('plugins {', 'plugins {\n    id \'com.google.gms.google-services\'');
      updated = true;
    }

    if (!content.contains('com.google.firebase:firebase-bom')) {
      final depBlock = '\ndependencies {\n    implementation platform(\'com.google.firebase:firebase-bom:33.7.0\')\n    implementation \'com.google.firebase:firebase-analytics\'\n}\n';
      if (content.contains('dependencies {')) {
        content = content.replaceFirst('dependencies {', 'dependencies {\n    implementation platform(\'com.google.firebase:firebase-bom:33.7.0\')\n    implementation \'com.google.firebase:firebase-analytics\'');
      } else {
        content += depBlock;
      }
      updated = true;
    }

    if (updated) {
      groovyFile.writeAsStringSync(content);
      print('✅ Updated android/app/build.gradle');
    }
  }
}

void _updateIosAppDelegate() {
  final file = File('ios/Runner/AppDelegate.swift');
  if (!file.existsSync()) return;

  var content = file.readAsStringSync();
  bool updated = false;

  if (!content.contains('import FirebaseCore')) {
    content = content.replaceFirst('import Flutter', 'import Flutter\nimport FirebaseCore');
    updated = true;
  }

  if (!content.contains('FirebaseApp.configure()')) {
    content = content.replaceFirst(
      'GeneratedPluginRegistrant.register(with: self)',
      'FirebaseApp.configure()\n    GeneratedPluginRegistrant.register(with: self)',
    );
    updated = true;
  }

  if (updated) {
    file.writeAsStringSync(content);
    print('✅ Updated ios/Runner/AppDelegate.swift');
  }
}
