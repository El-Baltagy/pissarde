import 'dart:convert';
import 'dart:io';

/// Extracts Postman collection folders into directories, generates request
/// parameter classes with `toJson()` for each API entity, and collects all API
/// endpoints into `lib/core/constants/app_api.dart`.
///
/// Usage:
///   dart run lib/core/tools/create_auto_functions/extract_api_params_and_endpoints.dart <path_to_collection.json>
void main(List<String> args) async {


  final removeEmpty =true;
      // args.contains('--remove_empty') || args.contains('--remove-empty');
  final positional = args.where((a) => !a.startsWith('--')).toList();
  final collectionPath = positional.isNotEmpty
      ? positional[0]
      : 'lib/core/tools/create_auto_functions/post_man_collection.json';
  final file = File(collectionPath);
  if (!file.existsSync()) {
    print('❌ Postman collection not found at: $collectionPath');
    exit(1);
  }

  final content = await file.readAsString();
  final dynamic data = json.decode(content);
  final items = data is Map && data['item'] is List
      ? data['item'] as List
      : data is List
      ? data
      : <dynamic>[];

  final outRoot = Directory('lib/core/tools/api_params');
  if (!outRoot.existsSync()) outRoot.createSync(recursive: true);

  int endpointCount = 0;
  int classCount = 0;
  int folderCount = 0;

  Future<void> processItems(
    List<dynamic> list,
    String folderName,
    Directory dir,
  ) async {
    for (final item in list) {
      if (item is! Map) continue;

      final hasRequest = item.containsKey('request');
      final subItems = item['item'];

      if (!hasRequest && subItems is List) {
        final String subFolderName = (item['name'] ?? 'folder').toString();
        final subDir = Directory(
          '${dir.path}/${_sanitizeDirName(subFolderName)}',
        );
        if (!subDir.existsSync()) subDir.createSync(recursive: true);
        folderCount++;
        print('📁 Folder: $subFolderName -> ${subDir.path}');
        await processItems(subItems, subFolderName, subDir);
        continue;
      }

      if (!hasRequest) continue;

      final String methodName = (item['name'] ?? 'api').toString();
      final request = item['request'];

      print('   🛠️ API: $methodName');
      final created = await _createReqParamClass(
        dir,
        methodName,
        request,
        removeEmpty: removeEmpty,
      );
      if (created) classCount++;

      final added = await _addApiToEndPoints(methodName, request);
      if (added) endpointCount++;
    }
  }

  for (final item in items) {
    if (item is! Map) continue;
    final hasRequest = item.containsKey('request');
    final subItems = item['item'];

    if (!hasRequest && subItems is List) {
      final String folderName = (item['name'] ?? 'folder').toString();
      final dir = Directory('${outRoot.path}/${_sanitizeDirName(folderName)}');
      if (!dir.existsSync()) dir.createSync(recursive: true);
      folderCount++;
      print('🚀 Processing folder: $folderName');
      await processItems(subItems, folderName, dir);
    } else if (hasRequest) {
      // Top-level request (no folder) -> put under _root
      final dir = Directory('${outRoot.path}/_root');
      if (!dir.existsSync()) dir.createSync(recursive: true);
      final String methodName = (item['name'] ?? 'api').toString();
      final request = item['request'];
      print('   🛠️ API: $methodName');
      final created = await _createReqParamClass(
        dir,
        methodName,
        request,
        removeEmpty: removeEmpty,
      );
      if (created) classCount++;
      final added = await _addApiToEndPoints(methodName, request);
      if (added) endpointCount++;
    }
  }

  print(
    '✅ Done. Folders: $folderCount, Param classes: $classCount, New endpoints: $endpointCount',
  );
  print('   Param classes root: ${outRoot.path}');
  print('   Endpoints file: lib/core/constants/app_api.dart');
}

String _sanitizeDirName(String name) {
  final s = name
      .trim()
      .replaceAll(RegExp(r'[<>:"/\\|?*\x00-\x1F]'), '_')
      .replaceAll(RegExp(r'\s+'), '_');
  return s.isEmpty ? 'folder' : s;
}

String _stripLeadingNumberPrefix(String input) {
  // Remove leading non-alnum and numeric prefixes like "01", "p_37___" etc.
  var s = input.replaceFirst(RegExp(r'^[^A-Za-z0-9]+'), '');
  s = s.replaceFirst(RegExp(r'^\d+[_\-\s]*'), '');
  s = s.replaceFirst(RegExp(r'^[^A-Za-z0-9]+'), '');
  return s.isEmpty ? input : s;
}

String _toSnakeCase(String input) {
  final cleaned = _stripLeadingNumberPrefix(input);
  return cleaned
      .replaceAllMapped(
        RegExp(r'(?<=[a-z0-9])([A-Z])'),
        (m) => '_${m.group(1)}',
      )
      .replaceAll(RegExp(r'[^a-zA-Z0-9]+'), '_')
      .replaceAll(RegExp(r'_+'), '_')
      .replaceAll(RegExp(r'^_|_$'), '')
      .toLowerCase();
}

String toPascalCase(String input) {
  final cleaned = _stripLeadingNumberPrefix(input);
  final parts = cleaned
      .split(RegExp(r'[^a-zA-Z0-9]+'))
      .where((p) => p.isNotEmpty);
  final buffer = StringBuffer();
  for (final word in parts) {
    buffer.write(word[0].toUpperCase());
    if (word.length > 1) buffer.write(word.substring(1));
  }
  final result = buffer.toString();
  if (result.isEmpty) return 'Api';
  // If still starts with a digit somehow, prefix with 'Api'
  if (RegExp(r'^[0-9]').hasMatch(result)) return 'Api$result';
  return result;
}

String _sanitizeFieldName(String key) {
  var name = key.replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '_');
  if (name.isEmpty) name = 'param';
  if (RegExp(r'^[0-9]').hasMatch(name)) name = 'p_$name';
  return name;
}

String toLowerCamelEndpointName(String input) {
  // Drop leading non-letter prefixes like "p_37___"
  var cleaned = input.replaceFirst(RegExp(r'^[^A-Za-z]+'), '');
  if (cleaned.isEmpty) cleaned = input;

  final parts = cleaned
      .split(RegExp(r'[^a-zA-Z0-9]+'))
      .where((p) => p.isNotEmpty)
      .toList();
  if (parts.isEmpty) return 'api';

  final buffer = StringBuffer(parts.first.toLowerCase());
  for (var i = 1; i < parts.length; i++) {
    final word = parts[i];
    buffer.write(word[0].toUpperCase());
    if (word.length > 1) buffer.write(word.substring(1).toLowerCase());
  }

  var result = buffer.toString();
  if (RegExp(r'^[0-9]').hasMatch(result)) result = 'api$result';
  return result;
}

Future<bool> _createReqParamClass(
  Directory dir,
  String methodName,
  dynamic request, {
  bool removeEmpty = false,
}) async {
  final className = '${toPascalCase(methodName)}ReqParam';
  final fileName = '${_toSnakeCase(methodName)}_req_param.dart';
  final outFile = File('${dir.path}/$fileName');

  String inferTypeFromValue(dynamic value, {bool fileHint = false}) {
    if (fileHint) return 'File';
    if (value is List) return 'List<dynamic>';
    if (value is String) {
      final t = value.trim();
      if (t.startsWith('[') && t.endsWith(']')) return 'List<dynamic>';
      return 'String';
    }
    return 'String';
  }

  String mergeTypes(String existing, String incoming) {
    if (existing == incoming) return existing;
    if (existing == 'File' || incoming == 'File') return 'File';
    if (existing.startsWith('List') || incoming.startsWith('List')) {
      return 'List<dynamic>';
    }
    return 'String';
  }

  final params = <Map<String, String>>[];

  void addParam(String key, String type) {
    if (key.isEmpty) return;
    params.add({'key': key, 'field': _sanitizeFieldName(key), 'type': type});
  }

  void addParamsFromDynamic(dynamic value) {
    if (value is Map) {
      for (final entry in value.entries) {
        final k = entry.key?.toString();
        if (k == null || k.isEmpty) continue;
        addParam(k, inferTypeFromValue(entry.value));
      }
    } else if (value is List) {
      for (final item in value) {
        if (item is Map) addParamsFromDynamic(item);
      }
    }
  }

  if (request is Map) {
    // Query parameters
    final url = request['url'];
    if (url is Map && url['query'] is List) {
      for (final q in url['query'] as List) {
        if (q is! Map) continue;
        if (q['disabled'] == true) continue;
        final key = q['key']?.toString();
        if (key == null || key.isEmpty) continue;
        addParam(key, inferTypeFromValue(q['value']));
      }
    } else if (url is String) {
      final uri = Uri.tryParse(url.replaceAll(RegExp(r'\{\{.*?\}\}'), 'x'));
      if (uri != null) {
        for (final entry in uri.queryParametersAll.entries) {
          final type = entry.value.length > 1 ? 'List<dynamic>' : 'String';
          addParam(entry.key, type);
        }
      }
    }

    // Body parameters (formdata/urlencoded/raw/graphql)
    final body = request['body'];
    if (body is Map) {
      final mode = body['mode']?.toString();
      if (mode == 'formdata' && body['formdata'] is List) {
        for (final f in body['formdata'] as List) {
          if (f is! Map) continue;
          if (f['disabled'] == true) continue;
          final key = f['key']?.toString();
          if (key == null || key.isEmpty) continue;
          final isFile =
              f['type']?.toString().toLowerCase() == 'file' ||
              f.containsKey('src');
          addParam(key, isFile ? 'File' : inferTypeFromValue(f['value']));
        }
      } else if (mode == 'urlencoded' && body['urlencoded'] is List) {
        for (final f in body['urlencoded'] as List) {
          if (f is! Map) continue;
          if (f['disabled'] == true) continue;
          final key = f['key']?.toString();
          if (key == null || key.isEmpty) continue;
          addParam(key, inferTypeFromValue(f['value']));
        }
      } else if (mode == 'raw') {
        final raw = body['raw'];
        if (raw is String && raw.trim().isNotEmpty) {
          try {
            final decoded = json.decode(raw);
            addParamsFromDynamic(decoded);
          } catch (_) {
            // not JSON raw body; ignore
          }
        } else if (raw is Map || raw is List) {
          addParamsFromDynamic(raw);
        }
      } else if (mode == 'graphql' && body['graphql'] is Map) {
        final vars = (body['graphql'] as Map)['variables'];
        if (vars is String && vars.trim().isNotEmpty) {
          try {
            addParamsFromDynamic(json.decode(vars));
          } catch (_) {}
        } else {
          addParamsFromDynamic(vars);
        }
      }

      // Fallback: if Postman stores params in body params list
      if (body['params'] is List) {
        for (final p in body['params'] as List) {
          if (p is! Map) continue;
          if (p['disabled'] == true) continue;
          final key = p['key']?.toString();
          if (key == null || key.isEmpty) continue;
          final isFile =
              p['type']?.toString().toLowerCase() == 'file' ||
              p.containsKey('src');
          addParam(key, isFile ? 'File' : inferTypeFromValue(p['value']));
        }
      }
    }
  }

  // Deduplicate by original key, merging types
  final byKey = <String, Map<String, String>>{};
  for (final p in params) {
    final key = p['key']!;
    if (!byKey.containsKey(key)) {
      byKey[key] = Map<String, String>.from(p);
    } else {
      byKey[key]!['type'] = mergeTypes(byKey[key]!['type']!, p['type']!);
    }
  }
  final uniqueParams = byKey.values.toList();

  // Ensure unique Dart field names
  final seenFields = <String>{};
  for (final p in uniqueParams) {
    var field = p['field']!;
    if (seenFields.contains(field)) {
      var i = 2;
      while (seenFields.contains('${field}_$i')) {
        i++;
      }
      field = '${field}_$i';
      p['field'] = field;
    }
    seenFields.add(field);
  }

  if (removeEmpty && uniqueParams.isEmpty) {
    if (outFile.existsSync()) {
      outFile.deleteSync();
      print('      ??? Removed empty class: ${outFile.path}');
    } else {
      print('      ?? Skipped empty class: $className');
    }
    return false;
  }

  final buffer = StringBuffer();
  final usesFile = uniqueParams.any((p) => p['type'] == 'File');
  if (usesFile) {
    buffer.writeln("import 'dart:io';");
    buffer.writeln();
  }
  buffer.writeln('class $className {');

  for (final p in uniqueParams) {
    buffer.writeln('  final ${p['type']} ${p['field']};');
  }

  if (uniqueParams.isNotEmpty) {
    buffer.writeln('\n  const $className({');
    for (final p in uniqueParams) {
      buffer.writeln('    required this.${p['field']},');
    }
    buffer.writeln('  });');
  } else {
    buffer.writeln('\n  const $className();');
  }

  buffer.writeln('\n  Map<String, dynamic> toJson() => {');
  for (final p in uniqueParams) {
    buffer.writeln("        '${p['key']}': ${p['field']},");
  }
  buffer.writeln('      };');
  buffer.writeln('}');

  await outFile.writeAsString(buffer.toString());
  print('      ? Created: ${outFile.path}');
  return true;
}

Future<bool> _addApiToEndPoints(String methodName, dynamic request) async {
  final file = File('lib/core/constants/app_api.dart');
  if (!file.existsSync()) {
    print('      ⚠️ app_api.dart not found, skipping endpoint: $methodName');
    return false;
  }
  var content = await file.readAsString();

  String path = '';
  if (request is Map) {
    final urlData = request['url'];
    if (urlData is String) {
      path = urlData;
    } else if (urlData is Map) {
      final raw = urlData['raw'];
      if (raw is String) {
        path = raw;
      } else if (urlData['path'] is List) {
        final parts = (urlData['path'] as List)
            .map((e) => e.toString())
            .join('/');
        path = '/$parts';
      }
    }
  }

  path = path
      .replaceFirst(RegExp(r'^https?://[^/]+'), '')
      .replaceAll(RegExp(r'\{\{\s*base_url\s*\}\}'), '')
      .replaceAll(RegExp(r'\{\{\s*baseUrl\s*\}\}'), '')
      .replaceAll(RegExp(r'\{\{\s*url\s*\}\}'), '');
  if (path.contains('?')) {
    path = path.split('?').first;
  }
  // collapse duplicate slashes (keep leading single slash if any)
  path = path.replaceAll(RegExp(r'/{2,}'), '/');
  if (path.isNotEmpty && !path.startsWith('/')) {
    path = '/$path';
  }

  final endpointName = toLowerCamelEndpointName(methodName);
  final endpointValue = path.isEmpty ? 'baseUrl' : '"\$baseUrl$path"';
  final endpointLine = '  static const String $endpointName = $endpointValue;';

  if (!content.contains(
    RegExp('static\\s+const\\s+String\\s+$endpointName\\s*='),
  )) {
    if (content.contains('abstract class EndPoints {')) {
      content = content.replaceFirst(
        'abstract class EndPoints {',
        'abstract class EndPoints {\n$endpointLine',
      );
      await file.writeAsString(content);
      final displayPath = path.isEmpty ? '\$baseUrl' : '\$baseUrl$path';
      print('      ✅ Added Endpoint: $endpointName -> $displayPath');
      return true;
    }
  }
  return false;
}
