// ignore_for_file: avoid_print

/// Case-conversion and identifier helpers shared by every test generator.
library;

String toPascal(String s) => s
    .split(RegExp(r'[\s_]+'))
    .where((w) => w.isNotEmpty)
    .map((w) => '${w[0].toUpperCase()}${w.substring(1)}')
    .join();

String toCamel(String s) {
  final p = toPascal(s);
  if (p.isEmpty) return p;
  return '${p[0].toLowerCase()}${p.substring(1)}';
}

String toSnake(String s) => s
    .replaceAllMapped(RegExp(r'[A-Z]'), (m) => '_${m.group(0)!.toLowerCase()}')
    .replaceAll(RegExp(r'[^A-Za-z0-9]+'), '_')
    .replaceAll(RegExp(r'_+'), '_')
    .replaceAll(RegExp(r'^_|_$'), '')
    .toLowerCase();

/// `getProjectsFunc` -> `get projects func`
String humanize(String identifier) {
  final words = toSnake(identifier).split('_').where((w) => w.isNotEmpty).toList();
  if (words.isEmpty) return identifier;
  return words.first;
}

/// Escapes a string for embedding inside a single-quoted Dart literal.
String dartString(String value) => value.replaceAll(r'\', r'\\').replaceAll("'", r"\'").replaceAll(r'$', r'\$');

/// Escapes a string for embedding inside a single-quoted TypeScript literal.
String tsString(String value) => value
    .replaceAll(r'\', r'\\')
    .replaceAll("'", "\\'")
    .replaceAll('\n', '\\n')
    .replaceAll('\r', '');
