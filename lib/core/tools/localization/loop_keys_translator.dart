import 'dart:convert';
import 'dart:io';

/// Script to loop over keys in `loopKeys.txt` (or a specified file)
/// and translate them using `lib/core/tools/localization/generate_key.dart`.
///
/// Usage:
///   dart run lib/core/tools/localization/loop_keys_translator.dart [filePath] [--each]
///
/// Example:
///   dart run lib/core/tools/localization/loop_keys_translator.dart
///   dart run lib/core/tools/localization/loop_keys_translator.dart lib/core/tools/localization/loopKeys.txt
///   dart run lib/core/tools/localization/loop_keys_translator.dart --each
void main(List<String> args) async {
  final bool runOneByOne = args.contains('--each') || args.contains('--one-by-one');
  final fileArgs = args.where((arg) => !arg.startsWith('--')).toList();

  final String filePath = fileArgs.isNotEmpty
      ? fileArgs.first
      : 'lib/core/tools/localization/loopKeys.txt';

  final keysFile = File(filePath);
  if (!await keysFile.exists()) {
    print('❌ Error: Keys file not found at "$filePath"');
    exit(1);
  }

  print('📖 Reading keys from: $filePath');
  final rawLines = await keysFile.readAsLines(encoding: utf8);

  // Extract non-empty, non-comment lines
  final List<String> rawKeys = rawLines
      .map((line) => line.trim())
      .where((line) => line.isNotEmpty && !line.startsWith('#') && !line.startsWith('//'))
      .toList();

  if (rawKeys.isEmpty) {
    print('⚠️ No keys found in "$filePath".');
    return;
  }

  print('🔍 Found ${rawKeys.length} key(s) in file.');

  // Check existing keys in translations.csv to prevent duplicates
  final csvFile = File('assets/l10n/translations.csv');
  final Set<String> existingKeys = {};

  if (await csvFile.exists()) {
    final csvLines = await csvFile.readAsLines(encoding: utf8);
    for (final line in csvLines.skip(1)) {
      if (line.trim().isEmpty) continue;
      final commaIndex = line.indexOf(',');
      final key = commaIndex != -1 ? line.substring(0, commaIndex).trim() : line.trim();
      if (key.isNotEmpty) {
        existingKeys.add(key);
      }
    }
  }

  final List<String> keysToTranslate = [];
  for (final key in rawKeys) {
    final normalizedKey = key.replaceAll(RegExp(r'\s+'), '_').toLowerCase();
    if (existingKeys.contains(normalizedKey) || existingKeys.contains(key)) {
      print('⏩ Skipping "$key" (already exists in translations.csv)');
    } else {
      keysToTranslate.add(key);
    }
  }

  if (keysToTranslate.isEmpty) {
    print('✨ All keys from "$filePath" already exist in translations.csv. Nothing to add.');
    return;
  }

  print('\n🚀 Processing ${keysToTranslate.length} new key(s) with generate_key.dart:');
  for (var i = 0; i < keysToTranslate.length; i++) {
    print('  ${i + 1}. ${keysToTranslate[i]}');
  }

  final generateKeyScript = 'lib/core/tools/localization/generate_key.dart';

  if (runOneByOne) {
    print('\n🔄 Running generate_key.dart sequentially for each key...');
    for (final key in keysToTranslate) {
      print('\n--- Translating key: "$key" ---');
      final result = await Process.run(
        'dart',
        ['run', generateKeyScript, key],
        runInShell: true,
      );

      if (result.stdout.toString().isNotEmpty) {
        stdout.write(result.stdout);
      }
      if (result.stderr.toString().isNotEmpty) {
        stderr.write(result.stderr);
      }

      if (result.exitCode != 0) {
        print('❌ Failed to process "$key" (exit code: ${result.exitCode})');
      }
    }
  } else {
    print('\n🔄 Running generate_key.dart in batch mode...');
    final result = await Process.run(
      'dart',
      ['run', generateKeyScript, ...keysToTranslate],
      runInShell: true,
    );

    if (result.stdout.toString().isNotEmpty) {
      stdout.write(result.stdout);
    }
    if (result.stderr.toString().isNotEmpty) {
      stderr.write(result.stderr);
    }

    if (result.exitCode != 0) {
      print('❌ generate_key.dart failed with exit code: ${result.exitCode}');
      exit(result.exitCode);
    }
  }

  print('\n🎉 All keys from "$filePath" have been processed successfully!');
}
