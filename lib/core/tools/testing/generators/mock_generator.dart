// ignore_for_file: avoid_print

/// Generates mocktail mocks for the feature's service + repo contracts.
///
/// Real `Base*Service` methods (with their real signatures) become
/// `when(...).thenAnswer(...)` stubs, so generated tests fail at compile time
/// if the production contract changes.
library;

import '../core/feature_model.dart';
import '../core/naming.dart';
import '../core/scaffold_writer.dart';

class MockGenerator {
  MockGenerator();

  String? generate(FeatureModel feature, ScaffoldWriter writer) {
    if (!feature.hasCubit) return null;
    final service = feature.service;
    final repo = feature.repo;
    if (service == null && repo == null) return null;

    final buf = StringBuffer()
      ..writeln(generatedMarker)
      ..writeln(importLine(service, feature))
      ..writeln('import \'package:mocktail/mocktail.dart\';')
      ..writeln();

    var needsFallback = false;

    if (service != null) {
      buf.writeln('// ── ${service.name} ───────────────────────────────────────────────');
      buf.writeln('class Mock${service.name} extends Mock implements ${service.name} {}');
      buf.writeln();
      for (final m in service.methods) {
        buf.writeln('/// Stubs [${m.signature}].');
        buf.writeln('/// Defaults: resolves to a completed Future; override with `thenAnswer`.');
        buf.writeln('void stub${toPascal(m.name)}(Mock${service.name} mock) {');
        if (m.params.isNotEmpty) needsFallback = true;
        buf.writeln('  when(() => mock.${m.name}(${m.mockArgs})).thenAnswer((_) async {});');
        buf.writeln('}');
        buf.writeln();
      }
    }

    if (repo != null) {
      buf.writeln('// ── ${repo.name} ─────────────────────────────────────────────────');
      buf.writeln('class Mock${repo.name} extends Mock implements ${repo.name} {}');
      buf.writeln();
      for (final m in repo.methods) {
        buf.writeln('/// Stubs [${m.signature}].');
        buf.writeln('/// Default: [Right] is returned via `Success`.');
        buf.writeln('void stub${toPascal(m.name)}(Mock${repo.name} mock) {');
        if (m.params.isNotEmpty) needsFallback = true;
        buf.writeln('  when(() => mock.${m.name}(${m.mockArgs})).thenAnswer((_) async => '
            'const Right(null));');
        buf.writeln('}');
        buf.writeln();
      }
    }

    buf.writeln(footer(service, repo));

    if (needsFallback) {
      buf.writeln('// Non-primitive parameters passed to `any()` must be registered once.');
      buf.writeln('void registerFallbackValues() {');
      final types = <String>{};
      for (final m in [...?service?.methods, ...?repo?.methods]) {
        for (final p in m.params) {
          final t = p.type.replaceAll('?', '');
          if (RegExp(r'^(String|int|double|bool|num|void|dynamic)$').hasMatch(t)) continue;
          types.add(t);
        }
      }
      for (final t in types) {
        buf.writeln('  registerFallbackValue($t);');
      }
      buf.writeln('}');
      buf.writeln();
    }

    final path = 'test/unit/${feature.featureName}/mocks/${feature.featureName}_mocks.dart';
    writer.write(path, buf.toString());
    return path;
  }

  static String importLine(ServiceInfo? service, FeatureModel feature) {
    return 'import \'package:${feature.packageName}/features/screens/${feature.featureName}'
        '/service/base_${feature.featureName}_service.dart\';';
  }

  static String footer(ServiceInfo? service, RepoInfo? repo) =>
      regenerateHint;
}
