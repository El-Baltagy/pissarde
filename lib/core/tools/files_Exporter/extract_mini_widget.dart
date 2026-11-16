import 'dart:io';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

// ─── Entry Point ─────────────────────────────────────────────────────────────
//
// Usage:
//   dart run lib/core/tools/extract_widgets/extract_mini_widget.dart [uiFolderOrFile]
//
// Examples:
//   dart run lib/core/tools/extract_widgets/extract_mini_widget.dart lib/features/screens/profile/ui/profile
//   dart run lib/core/tools/extract_widgets/extract_mini_widget.dart profile
//   dart run lib/core/tools/extract_widgets/extract_mini_widget.dart
//
// Finds comments of format:
//   ///extracted --WidgetName
// or
//   /// extracted -- WidgetName
// Extracts the following widget expression into:
//   <screen_folder>/widgets/<snake_case_widget_name>.dart
// Uses "part" in the parent file and "part of" in the mini widget file.
// Replaces the expression in the parent file with:
//   const WidgetName(), (or WidgetName(),)
// ─────────────────────────────────────────────────────────────────────────────

void main(List<String> args) async {
  String targetInput = '';

  if (args.isNotEmpty) {
    targetInput = args[0].trim();
  } else {
    stdout.write('📂 Enter UI folder path (e.g. lib/features/screens/profile/ui/profile): ');
    targetInput = stdin.readLineSync()?.trim() ?? '';
  }

  if (targetInput.isEmpty) {
    print('❌ Error: Path is required.');
    exit(1);
  }

  final resolvedDir = _resolveTargetDirectory(targetInput);
  if (resolvedDir == null) {
    print('❌ Error: Could not resolve directory from "$targetInput".');
    exit(1);
  }

  print('🔍 Searching for "///extracted --..." inside: ${resolvedDir.path}');

  final dartFiles = _findDartFiles(resolvedDir);
  if (dartFiles.isEmpty) {
    print('⚠️ No Dart files found to process.');
    return;
  }

  final projectName = _readProjectName();
  int totalExtracted = 0;

  for (final file in dartFiles) {
    final count = await _processFile(file, projectName);
    totalExtracted += count;
  }

  if (totalExtracted == 0) {
    print('ℹ️ No "///extracted --<Name>" markers found in the specified directory.');
  } else {
    print('🎉 Successfully extracted $totalExtracted widget(s)!');
  }
}

// ─── Path Resolution ─────────────────────────────────────────────────────────

Directory? _resolveTargetDirectory(String input) {
  // 1. Direct directory match
  final directDir = Directory(input);
  if (directDir.existsSync()) {
    return directDir;
  }

  // 2. If it's a file, return its parent directory
  final directFile = File(input);
  if (directFile.existsSync()) {
    return directFile.parent;
  }

  // 3. Try under lib/features/screens/<input>/ui/<input>
  final featureScreenDir = Directory('lib/features/screens/$input/ui/$input');
  if (featureScreenDir.existsSync()) {
    return featureScreenDir;
  }

  // 4. Try under lib/features/screens/<input>/ui
  final featureUiDir = Directory('lib/features/screens/$input/ui');
  if (featureUiDir.existsSync()) {
    return featureUiDir;
  }

  // 5. Try under lib/features/screens/<input>
  final featureDir = Directory('lib/features/screens/$input');
  if (featureDir.existsSync()) {
    return featureDir;
  }

  // 6. Search under lib/features/screens for matching folder
  final screensBase = Directory('lib/features/screens');
  if (screensBase.existsSync()) {
    for (final entity in screensBase.listSync(recursive: true)) {
      if (entity is Directory && entity.path.endsWith(input.replaceAll('\\', '/'))) {
        return entity;
      }
    }
  }

  return null;
}

List<File> _findDartFiles(Directory dir) {
  final files = <File>[];
  for (final entity in dir.listSync(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final normalized = entity.path.replaceAll('\\', '/');
      // Skip widgets subfolder, generated files, and parts
      if (!normalized.contains('/widgets/') &&
          !normalized.endsWith('.g.dart') &&
          !normalized.endsWith('.freezed.dart') &&
          !normalized.endsWith('.gr.dart')) {
        files.add(entity);
      }
    }
  }
  return files;
}

String _readProjectName() {
  final pubspec = File('pubspec.yaml');
  if (pubspec.existsSync()) {
    final content = pubspec.readAsStringSync();
    final match = RegExp(r'^name:\s*(.+)$', multiLine: true).firstMatch(content);
    if (match != null) {
      return match.group(1)!.trim();
    }
  }
  return 'newf';
}

// ─── File Processing ─────────────────────────────────────────────────────────

Future<int> _processFile(File file, String projectName) async {
  String content = await file.readAsString();
  final markerRegex = RegExp(r'///\s*extracted\s*--\s*([A-Za-z0-9_]+)', multiLine: true);
  final matches = markerRegex.allMatches(content).toList();

  if (matches.isEmpty) return 0;

  print('📄 Found ${matches.length} marker(s) in ${file.path}');

  // Determine widgets directory: <screen_directory>/widgets
  final screenDir = file.parent;
  final parentFileName = file.uri.pathSegments.last;
  final widgetsDir = Directory('${screenDir.path}/widgets');
  if (!widgetsDir.existsSync()) {
    widgetsDir.createSync(recursive: true);
    print('📁 Created widgets directory: ${widgetsDir.path}');
  }

  int extractedCount = 0;

  // Process in REVERSE order so character offsets in earlier parts of the file remain valid!
  for (final match in matches.reversed) {
    final rawName = match.group(1)!;
    final widgetClassName = _toPascalCase(rawName);
    final widgetFileName = '${_toSnakeCase(widgetClassName)}.dart';
    final widgetFilePath = '${widgetsDir.path}/$widgetFileName'.replaceAll('\\', '/');

    // Parse current content with analyzer
    final parseResult = parseString(content: content, path: file.path, throwIfDiagnostics: false);
    final unit = parseResult.unit;

    // Code starts after the comment line
    final commentLineEnd = _findLineEnd(content, match.end);
    final codeStartIndex = _skipWhitespace(content, commentLineEnd);

    if (codeStartIndex >= content.length) continue;

    // Locate the AST node starting at or containing codeStartIndex
    final astExtraction = _extractAstNode(unit, content, codeStartIndex);
    if (astExtraction == null) {
      print('⚠️ Could not parse widget node following marker "$rawName" in ${file.path}');
      continue;
    }

    final extractedCode = astExtraction.code;
    final nodeStart = astExtraction.startOffset;
    final nodeEnd = astExtraction.endOffset;
    final hasTrailingComma = astExtraction.hasTrailingComma;

    // Generate new widget file content using part of
    final newWidgetContent = _generateWidgetFileContent(
      widgetClassName: widgetClassName,
      widgetCode: extractedCode,
      parentFileName: parentFileName,
    );

    // Write new widget file
    final widgetFile = File(widgetFilePath);
    await widgetFile.writeAsString(newWidgetContent);
    print('  ✨ Created mini widget (part of $parentFileName): $widgetFilePath');

    // Construct replacement call in the parent file
    final isConst = _canBeConst(extractedCode);
    final constructorCall = isConst ? 'const $widgetClassName()' : '$widgetClassName()';
    final replacement = hasTrailingComma ? '$constructorCall,' : constructorCall;

    // Calculate full range to replace: from the start of the marker line to nodeEnd
    final markerLineStart = _findLineStart(content, match.start);
    final indentation = content.substring(markerLineStart, match.start);
    final replaceEnd = hasTrailingComma ? nodeEnd + 1 : nodeEnd;

    final indentedReplacement = '$indentation$replacement';

    content = content.substring(0, markerLineStart) +
        indentedReplacement +
        content.substring(replaceEnd);

    // Clean up any old package import for this widget if it existed
    content = _removeImportFromSource(content, widgetFilePath, projectName);

    // Inject part directive into parent file
    final partRelativePath = 'widgets/$widgetFileName';
    content = _injectPartDirectiveIntoSource(content, partRelativePath);

    // Ensure parent file has any necessary imports used by the widget
    content = _ensureParentImports(content, extractedCode, projectName);

    extractedCount++;
  }

  // Save updated parent file
  await file.writeAsString(content);
  print('  ✅ Updated parent file: ${file.path}');

  return extractedCount;
}

// ─── AST Node Extraction ─────────────────────────────────────────────────────

class _ExtractedNodeInfo {
  final String code;
  final int startOffset;
  final int endOffset;
  final bool hasTrailingComma;

  _ExtractedNodeInfo({
    required this.code,
    required this.startOffset,
    required this.endOffset,
    required this.hasTrailingComma,
  });
}

_ExtractedNodeInfo? _extractAstNode(CompilationUnit unit, String source, int codeStart) {
  AstNode? target;
  unit.accept(_Collector(onNode: (node) {
    if (node.offset <= codeStart && codeStart < node.end) {
      target = node;
    }
  }));

  if (target == null) {
    return _extractWithBracketBalancer(source, codeStart);
  }

  // Ascend to the top-level widget expression
  AstNode current = target!;
  while (current.parent != null) {
    final parent = current.parent!;
    if (parent is ArgumentList ||
        parent is ListLiteral ||
        parent is SetOrMapLiteral ||
        parent is ExpressionFunctionBody ||
        parent is Block ||
        parent is VariableDeclaration ||
        parent is ReturnStatement) {
      break;
    }
    if (parent is Expression || parent is MethodDeclaration || parent is ClassDeclaration) {
      current = parent;
    } else {
      break;
    }
  }

  final nodeStart = current.offset;
  final nodeEnd = current.end;
  var rawCode = source.substring(nodeStart, nodeEnd).trim();

  bool hasTrailingComma = false;
  if (nodeEnd < source.length) {
    int checkIdx = nodeEnd;
    while (checkIdx < source.length && (source[checkIdx] == ' ' || source[checkIdx] == '\t')) {
      checkIdx++;
    }
    if (checkIdx < source.length && source[checkIdx] == ',') {
      hasTrailingComma = true;
    }
  }

  return _ExtractedNodeInfo(
    code: rawCode,
    startOffset: nodeStart,
    endOffset: nodeEnd,
    hasTrailingComma: hasTrailingComma,
  );
}

_ExtractedNodeInfo? _extractWithBracketBalancer(String source, int start) {
  int parenDepth = 0;
  int bracketDepth = 0;
  int braceDepth = 0;
  int end = start;
  bool inSingleQuote = false;
  bool inDoubleQuote = false;

  while (end < source.length) {
    final char = source[end];

    if (char == "'" && !inDoubleQuote) {
      inSingleQuote = !inSingleQuote;
    } else if (char == '"' && !inSingleQuote) {
      inDoubleQuote = !inDoubleQuote;
    } else if (!inSingleQuote && !inDoubleQuote) {
      if (char == '(') parenDepth++;
      if (char == ')') parenDepth--;
      if (char == '[') bracketDepth++;
      if (char == ']') bracketDepth--;
      if (char == '{') braceDepth++;
      if (char == '}') braceDepth--;

      if (parenDepth == 0 && bracketDepth == 0 && braceDepth == 0) {
        if (char == ',' || char == ';') {
          final code = source.substring(start, end).trim();
          return _ExtractedNodeInfo(
            code: code,
            startOffset: start,
            endOffset: end,
            hasTrailingComma: char == ',',
          );
        }
      }
    }
    end++;
  }

  return null;
}

// ─── Widget Generator (part of) ──────────────────────────────────────────────

String _generateWidgetFileContent({
  required String widgetClassName,
  required String widgetCode,
  required String parentFileName,
}) {
  final buffer = StringBuffer();

  // Part of directive linking to parent file
  buffer.writeln("part of '../$parentFileName';");
  buffer.writeln();

  String cleanCode = widgetCode.trim();
  if (cleanCode.endsWith(';')) {
    cleanCode = cleanCode.substring(0, cleanCode.length - 1).trim();
  }

  buffer.writeln('/// Extracted mini widget: [$widgetClassName]');
  buffer.writeln('class $widgetClassName extends StatelessWidget {');
  buffer.writeln('  const $widgetClassName({super.key});');
  buffer.writeln();
  buffer.writeln('  @override');
  buffer.writeln('  Widget build(BuildContext context) {');
  buffer.writeln('    return $cleanCode;');
  buffer.writeln('  }');
  buffer.writeln('}');
  buffer.writeln();

  return buffer.toString();
}

// ─── String & Ast Helpers ────────────────────────────────────────────────────

bool _canBeConst(String code) {
  if (code.startsWith('const ')) return true;
  if (code.startsWith('SizedBox') || code.startsWith('Container()')) return true;
  return false;
}

String _injectPartDirectiveIntoSource(String source, String partRelativePath) {
  final partDirective = "part '$partRelativePath';";
  if (source.contains(partDirective)) return source;

  // 1. If there are already `part` directives, insert after the last `part`
  final lastPartMatch = RegExp(r"^part\s+['""][^'""]+['""];", multiLine: true).allMatches(source).lastOrNull;
  if (lastPartMatch != null) {
    final insertIdx = lastPartMatch.end;
    return '${source.substring(0, insertIdx)}\n$partDirective${source.substring(insertIdx)}';
  }

  // 2. Otherwise insert after the last `import`
  final lastImportMatch = RegExp(r"^import\s+['""][^'""]+['""];", multiLine: true).allMatches(source).lastOrNull;
  if (lastImportMatch != null) {
    final insertIdx = lastImportMatch.end;
    return '${source.substring(0, insertIdx)}\n\n$partDirective${source.substring(insertIdx)}';
  }

  return '$partDirective\n\n$source';
}

String _removeImportFromSource(String source, String widgetFilePath, String projectName) {
  final packageImport = _toPackageImport(widgetFilePath, projectName);
  final importLineRegex = RegExp(r"import\s+['""]" + RegExp.escape(packageImport) + r"['""];\s*\n?");
  return source.replaceAll(importLineRegex, '');
}

String _ensureParentImports(String source, String widgetCode, String projectName) {
  var updated = source;
  if ((widgetCode.contains('.tr()') || widgetCode.contains('.tr(')) &&
      !updated.contains('easy_localization/easy_localization.dart')) {
    updated = _injectImportIntoSource(updated, "package:easy_localization/easy_localization.dart");
  }
  if (widgetCode.contains('AppColors') && !updated.contains('app_colors.dart')) {
    updated = _injectImportIntoSource(updated, "package:$projectName/core/theming/app_colors.dart");
  }
  if (widgetCode.contains('AppTextStyles') && !updated.contains('app_text_styles.dart')) {
    updated = _injectImportIntoSource(updated, "package:$projectName/core/theming/app_text_styles.dart");
  }
  if ((widgetCode.contains('AppSizes') || widgetCode.contains('AppPadding')) && !updated.contains('app_values.dart')) {
    updated = _injectImportIntoSource(updated, "package:$projectName/core/theming/app_values.dart");
  }
  if ((widgetCode.contains('.horizontalSpace') || widgetCode.contains('.verticalSpace')) && !updated.contains('double.dart')) {
    updated = _injectImportIntoSource(updated, "package:$projectName/core/extension/double.dart");
  }
  return updated;
}

String _injectImportIntoSource(String source, String importPackageUri) {
  final fullImport = "import '$importPackageUri';";
  if (source.contains(fullImport)) return source;

  final lastImportMatch = RegExp(r"^import\s+['""][^'""]+['""];", multiLine: true).allMatches(source).lastOrNull;
  if (lastImportMatch != null) {
    final insertIdx = lastImportMatch.end;
    return '${source.substring(0, insertIdx)}\n$fullImport${source.substring(insertIdx)}';
  } else {
    return '$fullImport\n$source';
  }
}

String _toPackageImport(String filePath, String projectName) {
  final normalized = filePath.replaceAll('\\', '/');
  final libIndex = normalized.indexOf('lib/');
  if (libIndex != -1) {
    final relativeToLib = normalized.substring(libIndex + 4);
    return 'package:$projectName/$relativeToLib';
  }
  return normalized;
}

int _findLineStart(String text, int index) {
  final lastNewline = text.lastIndexOf('\n', index);
  return lastNewline == -1 ? 0 : lastNewline + 1;
}

int _findLineEnd(String text, int index) {
  final nextNewline = text.indexOf('\n', index);
  return nextNewline == -1 ? text.length : nextNewline + 1;
}

int _skipWhitespace(String text, int start) {
  int idx = start;
  while (idx < text.length && (text[idx] == ' ' || text[idx] == '\t' || text[idx] == '\r' || text[idx] == '\n')) {
    idx++;
  }
  return idx;
}

String _toPascalCase(String input) {
  if (input.isEmpty) return input;
  if (input.contains('_') || input.contains('-')) {
    return input.split(RegExp(r'[-_]')).where((e) => e.isNotEmpty).map((w) {
      return w[0].toUpperCase() + w.substring(1);
    }).join();
  }
  return input[0].toUpperCase() + input.substring(1);
}

String _toSnakeCase(String input) {
  return input
      .replaceAllMapped(RegExp(r'(?<!^)([A-Z])'), (m) => '_${m.group(0)}')
      .toLowerCase();
}

class _Collector extends GeneralizingAstVisitor<void> {
  final void Function(AstNode node) onNode;
  _Collector({required this.onNode});

  @override
  void visitNode(AstNode node) {
    onNode(node);
    super.visitNode(node);
  }
}
