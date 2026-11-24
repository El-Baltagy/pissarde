import 'dart:convert';
import 'dart:io';

/// Reverses a language JSON file (e.g. `app_ar.json`) back into the
/// translations CSV (`assets/l10n/translations.csv`).
///
/// For every key found in the JSON, the matching column of the CSV is updated
/// with the JSON value. Keys that do not yet exist in the CSV are appended as
/// new rows (other language columns left empty).
///
/// Usage:
///   dart run lib/core/tools/localization/json_to_csv.dart `<jsonFile>` [`<csvPath>`]
///
/// Examples:
///   dart run lib/core/tools/localization/json_to_csv.dart assets/l10n/app_ar.json
///   dart run lib/core/tools/localization/json_to_csv.dart assets/l10n/app_tr.json assets/l10n/translations.csv
void main(List<String> args) {
  if (args.isEmpty) {
    print('❌ Missing language code.');
    print('Usage: dart run lib/core/tools/localization/json_to_csv.dart <langCode> [csvPath]');
    exit(1);
  }

  final jsonPath = 'assets/l10n/app_${args[0]}.json';
  // final jsonPath = args[0];
  final csvPath =   'assets/l10n/translations.csv';

  final jsonFile = File(jsonPath);
  if (!jsonFile.existsSync()) {
    print('❌ JSON file not found: $jsonPath');
    exit(1);
  }

  final csvFile = File(csvPath);
  if (!csvFile.existsSync()) {
    print('❌ CSV file not found: $csvPath');
    exit(1);
  }

  // ── Read & parse JSON ───────────────────────────────────────────────────────
  final rawJson = jsonFile.readAsStringSync(encoding: utf8);
  final decoded = jsonDecode(rawJson);
  if (decoded is! Map) {
    print('❌ JSON root must be an object.');
    exit(1);
  }

  // Determine language code from @@locale or file name.
  String lang = (decoded['@@locale'] ?? '').toString().trim();
  if (lang.isEmpty) {
    final name = jsonFile.uri.pathSegments.last;
    final m = RegExp(r'app_(.+)\.json').firstMatch(name);
    if (m != null) lang = m.group(1)!;
  }
  if (lang.isEmpty) {
    print('❌ Could not determine language code (no @@locale and filename not app_<lang>.json).');
    exit(1);
  }

  // Collect key -> value pairs (skip @@locale).
  final Map<String, String> jsonEntries = {};
  for (final e in decoded.entries) {
    if (e.key == '@@locale') continue;
    jsonEntries[e.key.toString()] = (e.value ?? '').toString();
  }

  print('📖 Read ${jsonEntries.length} key(s) from $jsonPath (lang: $lang)');

  // ── Read CSV ────────────────────────────────────────────────────────────────
  final csvLines = csvFile.readAsLinesSync(encoding: utf8);
  if (csvLines.isEmpty) {
    print('❌ CSV is empty.');
    exit(1);
  }

  final header = _splitCsvLine(csvLines.first);
  if (header.length < 2) {
    print('❌ CSV must have at least a key column and one language column.');
    exit(1);
  }

  // Ensure the target language has a column.
  var langIndex = header.indexOf(lang);
  if (langIndex == -1) {
    header.add(lang);
    langIndex = header.length - 1;
    print('➕ Added new language column: $lang');
  }

  // Parse existing rows into a mutable list of column lists.
  final rows = <List<String>>[];
  final keyToRowIndex = <String, int>{};
  for (int i = 1; i < csvLines.length; i++) {
    final line = csvLines[i];
    if (line.trim().isEmpty) continue;
    final cols = _splitCsvLine(line);
    // Pad to header length.
    while (cols.length < header.length) { cols.add(''); }    rows.add(cols);
    final key = cols[0].trim();
    if (key.isNotEmpty && !keyToRowIndex.containsKey(key)) {
      keyToRowIndex[key] = rows.length - 1;
    }
  }

  // ── Apply JSON values into CSV ───────────────────────────────────────────────
  int updated = 0;
  int appended = 0;
  for (final entry in jsonEntries.entries) {
    final key = entry.key;
    final value = entry.value;
    final idx = keyToRowIndex[key];
    if (idx != null) {
      rows[idx][langIndex] = value;
      updated++;
    } else {
      final newRow = List<String>.filled(header.length, '');
      newRow[0] = key;
      newRow[langIndex] = value;
      rows.add(newRow);
      keyToRowIndex[key] = rows.length - 1;
      appended++;
    }
  }

  // ── Write CSV back ──────────────────────────────────────────────────────────
  final buffer = StringBuffer();
  buffer.writeln(header.map(_escapeCsv).join(','));
  for (final row in rows) {
    // Pad rows just in case.
    while (row.length < header.length) { row.add(''); }
    buffer.writeln(row.map(_escapeCsv).join(','));
  }
  csvFile.writeAsStringSync(buffer.toString(), encoding: utf8);

  print('✅ Updated $updated existing key(s), appended $appended new key(s).');
  print('📄 CSV written: $csvPath');
  print('\n💡 Tip: run csv_to_json.dart to regenerate the JSON files from the CSV.');
}

/// Minimal CSV line splitter (handles quoted fields with commas inside).
List<String> _splitCsvLine(String line) {
  final result = <String>[];
  final buffer = StringBuffer();
  bool inQuotes = false;

  for (int i = 0; i < line.length; i++) {
    final char = line[i];

    if (char == '"') {
      if (inQuotes && i + 1 < line.length && line[i + 1] == '"') {
        buffer.write('"');
        i++;
      } else {
        inQuotes = !inQuotes;
      }
    } else if (char == ',' && !inQuotes) {
      result.add(buffer.toString());
      buffer.clear();
    } else {
      buffer.write(char);
    }
  }
  result.add(buffer.toString());
  return result;
}

/// Escapes a value for CSV output.
String _escapeCsv(String value) {
  if (value.contains(',') || value.contains('"') || value.contains('\n') || value.contains('\r')) {
    return '"${value.replaceAll('"', '""')}"';
  }
  return value;
}
