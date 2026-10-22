// ignore_for_file: avoid_print

/// Test scaffold generator.
///
/// Produces the full test pyramid for a feature from its real source structure:
///
///   test/unit/<feature>/          bloc_test unit tests + mocktail mocks
///   test/widget/<feature>/        per-widget and per-screen widget tests using patrolWidgetTest
///   integration_test/             Patrol drivers that boot the app and test with native automation
///
/// Usage:
///   dart run lib/core/tools/testing/test_scaffold.dart <command> [options]
///
/// Commands:
///   unit        <feature>   mocks + bloc_test unit tests
///   widget      <feature>   per-widget and per-screen widget tests
///   patrol      <feature>   Patrol integration_test drivers
///   all         <feature>   everything above
///   all                    every feature
///   doctor                 check the project is ready to run tests
///
/// Options:
///   --dry-run    print what would be written, write nothing
///   --force      overwrite hand-edited files (a .bak is kept)
///
/// Examples:
///   dart run lib/core/tools/testing/test_scaffold.dart all --dry-run
///   dart run lib/core/tools/testing/test_scaffold.dart unit main_screen
library;

import 'dart:io';

import 'core/feature_extractor.dart';
import 'core/feature_model.dart';
import 'core/scaffold_writer.dart';
import 'generators/patrol_test_generator.dart';
import 'generators/mock_generator.dart';
import 'generators/unit_test_generator.dart';
import 'generators/widget_test_generator.dart';

const screensDir = 'lib/features/screens';

void main(List<String> argv) {
  if (argv.isEmpty || argv.first == '-h' || argv.first == '--help') {
    _usage();
    return;
  }

  final opts = _Options.parse(argv);
  final command = argv.first.toLowerCase();
  final root = Directory.current;

  // Locate the package name from pubspec rather than hardcoding it.
  final package = _packageName(root);
  if (package == null) {
    print('❌ Could not read `name:` from pubspec.yaml in ${root.path}');
    print('   Run this from the project root.');
    exit(1);
  }

  if (command == 'doctor') {
    _doctor(root, package, opts);
    return;
  }

  final features = opts.feature == null
      ? _allFeatures()
      : <String>[opts.feature!];

  if (features.isEmpty) {
    print('❌ No features found in $screensDir');
    exit(1);
  }

  if (features.length > 1 && !opts.all && command != 'all') {
    print('❌ `$command` takes a single feature. Use `all` for everything.');
    exit(1);
  }

  final extractor = FeatureExtractor(packageName: package);
  var totalFiles = 0;
  final failed = <String>[];

  for (final feature in features) {
    print('');
    print('═' * 62);
    print('🧪 $command  →  $feature');
    print('═' * 62);

    final featurePath = '$screensDir/$feature';
    if (!Directory(featurePath).existsSync()) {
      print('❌ Feature not found: $featurePath');
      failed.add(feature);
      continue;
    }

    final model = extractor.extract(feature, featurePath);
    _describe(model);

    final writer = ScaffoldWriter(dryRun: opts.dryRun, force: opts.force);

    try {
      switch (command) {
        case 'unit':
          totalFiles += _runUnit(model, writer);
        case 'widget':
          totalFiles += _runWidget(model, writer);
        case 'patrol':
          totalFiles += _runPatrol(model, writer, opts);
        case 'all':
          totalFiles += _runUnit(model, writer);
          totalFiles += _runWidget(model, writer);
          totalFiles += _runPatrol(model, writer, opts);
        default:
          print('❌ Unknown command: $command');
          _usage();
          exit(1);
      }
    } catch (e, st) {
      print('❌ Generation failed for $feature: $e');
      print(st);
      failed.add(feature);
      continue;
    }

    writer.printSummary();
  }

  print('');
  print('─' * 62);
  if (failed.isEmpty) {
    print('✅ Done. $totalFiles file(s) processed.');
  } else {
    print('⚠️  Finished with failures: ${failed.join(', ')}');
    exit(1);
  }
}

// ── command bodies ──────────────────────────────────────────────────────────

int _runUnit(FeatureModel model, ScaffoldWriter writer) {
  if (!model.hasCubit) {
    print('⚠️  No cubit found — skipping unit tests.');
    print('   Expected ${model.rootPath}/controller/${model.featureName}_cubit.dart');
    return 0;
  }
  var n = 0;
  if (MockGenerator().generate(model, writer) != null) n++;
  if (UnitTestGenerator().generate(model, writer) != null) n++;
  return n;
}

int _runWidget(FeatureModel model, ScaffoldWriter writer) {
  if (!model.hasScreens) {
    print('⚠️  No screens found — skipping widget tests.');
    return 0;
  }
  final gen = WidgetTestGenerator();
  final n = gen.generateWidgetTests(model, writer).length +
      gen.generateScreenTests(model, writer).length;
  print('   widgets: ${model.screens.fold<int>(0, (a, s) => a + s.widgets.length)} across '
      '${model.screens.length} screen(s)');
  return n;
}

int _runPatrol(FeatureModel model, ScaffoldWriter writer, _Options opts) {
  final n = PatrolTestGenerator().generate(model, writer).length;
  if (n == 0) print('⚠️  No screens with a Scaffold body — nothing to drive.');
  return n;
}

// ── reporting ───────────────────────────────────────────────────────────────

void _describe(FeatureModel m) {
  final cubit = m.cubit;
  print('   cubit    : ${cubit?.name ?? "— (${cubit == null ? "skipped" : "none"})"}');
  if (cubit != null) {
    print('   state    : ${cubit.stateFields.map((f) => f.name).join(", ")}');
    print('   service  : ${cubit.serviceType}');
  }
  print('   screens  : ${m.screens.map((s) => "${s.name}[${s.widgets.length}w]"
      "${s.scaffoldHasBody ? "" : " no-body"}").join(", ")}');
  for (final s in m.screens) {
    if (s.widgets.isEmpty) continue;
    for (final w in s.widgets) {
      print('     • ${w.className}  a11y="${w.accessibleName}"');
    }
  }
  print('   routes   : ${m.routes.map((r) => r.path).join(", ")}');
}

void _doctor(Directory root, String package, _Options opts) {
  print('🩺 Test-readiness check\n');
  var ok = 0;
  var warn = 0;

  void check(String label, bool pass, [String? fix]) {
    print('   ${pass ? "✅" : "⚠️ "} $label${pass || fix == null ? "" : "\n        → $fix"}');
    pass ? ok++ : warn++;
  }

  print('   project  : ${root.path}');
  print('   package  : $package');
  print('');

  final pubspec = File('pubspec.yaml').readAsStringSync();
  for (final dep in ['bloc_test', 'mocktail', 'patrol']) {
    check(
      'dev_dependency `$dep`',
      pubspec.contains('$dep:'),
      'add `$dep: ^<version>` under dev_dependencies and run `flutter pub get`',
    );
  }
  
  check(
    'dependency `patrol_finders`',
    pubspec.contains('patrol_finders:'),
    'add `patrol_finders: ^<version>` under dependencies or dev_dependencies and run `flutter pub get`',
  );

  check('test/ directory', Directory('test').existsSync(),
      'created automatically by `test_scaffold.dart unit|widget <feature>`');
  check('integration_test/ directory', Directory('integration_test').existsSync(),
      'created automatically by `test_scaffold.dart patrol <feature>`');

  final features = _allFeatures();
  check('features found', features.isNotEmpty, 'expected feature folders in $screensDir');
  print('');
  print('   ${features.length} feature(s): ${features.join(", ")}');

  print('');
  if (warn == 0) {
    print('✅ Ready. Run: dart run lib/core/tools/testing/test_scaffold.dart all');
  } else {
    print('⚠️  $warn item(s) need attention before tests will run.');
  }
}

// ── helpers ─────────────────────────────────────────────────────────────────

List<String> _allFeatures() {
  final dir = Directory(screensDir);
  if (!dir.existsSync()) return const [];
  final names = dir
      .listSync()
      .whereType<Directory>()
      .map((d) => d.uri.pathSegments.where((s) => s.isNotEmpty).last)
      .toList()
    ..sort();
  return names;
}

String? _packageName(Directory root) {
  final file = File('${root.path}/pubspec.yaml');
  if (!file.existsSync()) return null;
  final m = RegExp(r'^name:\s*(\S+)', multiLine: true).firstMatch(file.readAsStringSync());
  return m?.group(1);
}

void _usage() {
  print('''
🧪 Test Scaffold Generator

  dart run lib/core/tools/testing/test_scaffold.dart <command> [options]

Commands
  unit        <feature>   mocktail mocks + bloc_test unit tests
  widget      <feature>   per-widget and per-screen widget tests using patrolWidgetTest
  patrol      <feature>   Patrol integration_test drivers
  all         <feature>   all of the above
  all                    every feature found in $screensDir
  doctor                 check whether the project can run tests yet

Options
  --dry-run             report what would change, write nothing
  --force               overwrite hand-edited files (keeps a .bak)

Examples
  dart run lib/core/tools/testing/test_scaffold.dart all --dry-run
  dart run lib/core/tools/testing/test_scaffold.dart unit main_screen
  dart run lib/core/tools/testing/test_scaffold.dart patrol main_screen
  dart run lib/core/tools/testing/test_scaffold.dart doctor
''');
}

// ── options ─────────────────────────────────────────────────────────────────

class _Options {
  _Options({this.feature, this.dryRun = false, this.force = false});

  final String? feature;
  final bool dryRun;
  final bool force;
  bool all = false;

  static _Options parse(List<String> argv) {
    String? feature;
    var dryRun = false;
    var force = false;

    for (final arg in argv.skip(1)) {
      if (arg == '--dry-run') {
        dryRun = true;
      } else if (arg == '--force') {
        force = true;
      } else if (arg.startsWith('--')) {
        print('⚠️  Unknown option: $arg');
      } else {
        feature ??= arg;
      }
    }

    return _Options(
      feature: feature,
      dryRun: dryRun,
      force: force,
    )..all = argv.first.toLowerCase() == 'all' && feature == null;
  }
}
