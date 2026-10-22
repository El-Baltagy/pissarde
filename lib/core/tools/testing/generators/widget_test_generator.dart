// ignore_for_file: avoid_print

/// Generates Patrol widget tests.
///
/// Two shapes:
///  * one smoke + semantics test per extracted widget, using the real accessible
///    name from its `Semantics(label: ...)` so the assertions match exactly what
///    an assistive tech (and Patrol) will see;
///  * one screen test that pumps the page inside the minimum wrapper tree needed
///    (MaterialApp + BlocProvider + route args) and verifies it builds.
library;

import 'dart:io';

import '../core/feature_model.dart';
import '../core/naming.dart';
import '../core/scaffold_writer.dart';

class WidgetTestGenerator {
  WidgetTestGenerator();

  /// Per-widget tests under `test/widget/<feature>/widgets/`.
  List<String> generateWidgetTests(FeatureModel feature, ScaffoldWriter writer) {
    final paths = <String>[];
    for (final screen in feature.screens) {
      for (final w in screen.widgets) {
        final path = 'test/widget/${feature.featureName}/widgets/'
            '${toSnake(w.className)}_test.dart';
        writer.write(path, _widgetTest(feature, screen, w));
        paths.add(path);
      }
    }
    return paths;
  }

  /// One test file per screen.
  List<String> generateScreenTests(FeatureModel feature, ScaffoldWriter writer) {
    final paths = <String>[];
    for (final screen in feature.screens) {
      final path = 'test/widget/${feature.featureName}/${screen.name}_screen_test.dart';
      writer.write(path, _screenTest(feature, screen));
      paths.add(path);
    }
    return paths;
  }

  // ── per-widget ───────────────────────────────────────────────────────────

  String _widgetTest(FeatureModel feature, ScreenInfo screen, WidgetInfo w) {
    final buf = StringBuffer()
      ..writeln(generatedMarker)
      ..writeln("import 'package:flutter/material.dart';")
      ..writeln("import 'package:flutter_test/flutter_test.dart';")
      ..writeln("import 'package:patrol_finders/patrol_finders.dart';")
      ..writeln()
      ..writeln("import '${screen.importPath}';")
      ..writeln();

    final instance = 'const ${w.className}(${_namedProps(w.props)})';

    buf
      ..writeln('void main() {')
      ..writeln('  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));')
      ..writeln()
      ..writeln('  patrolWidgetTest(\'${w.className} renders without overflow\', (\$) async {')
      ..writeln('    await \$.pumpWidgetAndSettle(wrap($instance));')
      ..writeln()
      ..writeln('    expect(\$.tester.takeException(), isNull);')
      ..writeln('    expect(\$(${w.className}), findsOneWidget);')
      ..writeln('  });');

    if (w.semantics.isNotEmpty) {
      buf
        ..writeln()
        ..writeln('  // The screen wraps this widget in Semantics, so the accessible name')
        ..writeln('  // below is the contract Patrol and screen readers depend on.')
        ..writeln('  patrolWidgetTest(\'${w.className} exposes its semantics label\', (\$) async {')
        ..writeln('    final handle = \$.tester.ensureSemantics();')
        ..writeln('    await \$.pumpWidgetAndSettle(wrap($instance));');
      for (final s in w.semantics) {
        buf
          ..writeln()
          ..writeln('    expect(')
          ..writeln('      \$(${dartString(s.label)}),')
          ..writeln('      findsOneWidget,')
          ..writeln('      reason: \'Semantics label "${s.label}" must stay stable\',')
          ..writeln('    );');
      }
      buf
        ..writeln('    handle.dispose();')
        ..writeln('  });');
    }

    if (w.props.isNotEmpty) {
      buf
        ..writeln()
        ..writeln('  patrolWidgetTest(\'${w.className} handles required props\', (\$) async {')
        ..writeln('    await \$.pumpWidgetAndSettle(wrap($instance));')
        ..writeln()
        ..writeln('    expect(\$.tester.takeException(), isNull);')
        ..writeln('  });');
    }

    buf
      ..writeln('}')
      ..writeln(footer(feature));

    return buf.toString();
  }

  // ── per-screen ───────────────────────────────────────────────────────────

  String _screenTest(FeatureModel feature, ScreenInfo screen) {
    final cubit = feature.cubit;
    final buf = StringBuffer()
      ..writeln(generatedMarker)
      ..writeln("import 'package:flutter/material.dart';")
      ..writeln("import 'package:flutter_test/flutter_test.dart';")
      ..writeln("import 'package:patrol_finders/patrol_finders.dart';")
      ..writeln()
      ..writeln("import '${screen.importPath}';");
    if (cubit != null) {
      buf.writeln("import '${cubit.importPath}';");
      buf.writeln("import 'package:${feature.packageName}/core/constants/app_locator.dart';");
    }
    buf.writeln();

    buf
      ..writeln('void main() {')
      ..writeln('  // A blank ${screen.routeArgsType ?? 'RouteArgs'} so the screen can be constructed')
      ..writeln('  // directly, bypassing the router.')
      ..writeln(_routeArgsStub(feature, screen))
      ..writeln()
      ..writeln('  Widget wrap(Widget child) => MaterialApp(home: child);')
      ..writeln()
      ..writeln('  patrolWidgetTest(\'${screen.pageClass} builds its Scaffold\', (\$) async {')
      ..writeln('    await \$.pumpWidgetAndSettle(wrap(${_instance(screen, cubit != null)}));')
      ..writeln()
      ..writeln('    expect(\$.tester.takeException(), isNull);')
      ..writeln('    expect(\$(${screen.pageClass}), findsOneWidget);')
      ..writeln('  });');

    if (screen.scaffoldHasBody) {
      buf
        ..writeln()
        ..writeln('  patrolWidgetTest(\'${screen.pageClass} renders its body\', (\$) async {')
        ..writeln('    await \$.pumpWidgetAndSettle(wrap(${_instance(screen, cubit != null)}));')
        ..writeln()
        ..writeln('    expect(\$(Scaffold), findsOneWidget);')
        ..writeln('  });');
    }

    if (screen.widgets.isNotEmpty) {
      buf
        ..writeln()
        ..writeln('  group(\'accessible children\', () {')
        ..writeln('    late SemanticsHandle handle;')
        ..writeln('    setUp(() => handle = WidgetsBinding.instance.pipelineOwner.ensureSemantics());')
        ..writeln('    tearDown(() => handle.dispose());')
        ..writeln();
        
      for (final w in screen.widgets) {
        final label = w.accessibleName;
        buf
          ..writeln('    patrolWidgetTest(\'${w.className} is reachable by name\', (\$) async {')
          ..writeln('      await \$.pumpWidgetAndSettle(wrap(${_instance(screen, cubit != null)}));')
          ..writeln()
          ..writeln('      expect(')
          ..writeln('        \$(${dartString(label)}),')
          ..writeln('        findsOneWidget,')
          ..writeln('      );')
          ..writeln('    });')
          ..writeln();
      }
      buf.writeln('  });');
    }

    buf
      ..writeln('}')
      ..writeln(footer(feature));

    return buf.toString();
  }

  static String _instance(ScreenInfo screen, bool hasCubit) =>
      hasCubit
          ? '${screen.pageClass}(args: const ${screen.routeArgsType ?? 'RouteArgs'}())'
          : 'const ${screen.pageClass}()';

  static String _namedProps(List<ParamInfo> props) {
    final named = props.where((p) => p.named).toList();
    if (named.isEmpty) return '';
    return named.map((p) => '${p.name}: ${p.placeholder}').join(', ');
  }

  static String _routeArgsStub(FeatureModel feature, ScreenInfo screen) {
    final args = screen.routeArgsType;
    if (args == null) {
      return '  // TODO: this screen takes no route args.';
    }
    final f = _routeArgsFile(feature, args);
    if (f == null) {
      return '  // TODO: could not locate `$args`; add `class $args` with const-able\n'
          '  // constructor params before this screen test can be pumped.';
    }
    return _constArgsStub(f);
  }

  static _ArgsCtor? _routeArgsFile(FeatureModel feature, String argsType) {
    final dir = Directory('${feature.rootPath}/ui');
    if (!dir.existsSync()) return null;
    final needle = 'class $argsType';
    for (final entry in dir.listSync(recursive: true).whereType<File>()) {
      if (!entry.path.endsWith('.dart')) continue;
      final src = entry.readAsStringSync();
      final idx = src.indexOf(needle);
      if (idx == -1) continue;

      final ctorMatch = RegExp(r'const\s+$argsType\s*\(([^)]*)\)').firstMatch(src.substring(idx));
      if (ctorMatch == null) continue;
      final params = ctorMatch
          .group(1)!
          .split(',')
          .map((s) => s.trim())
          .where((s) => s.isNotEmpty && !s.startsWith('//'))
          .map(_Param2.parse)
          .toList();
      return _ArgsCtor(ctorMatch.group(1)!, params);
    }
    return null;
  }

  static String _constArgsStub(_ArgsCtor ctor) {
    final required = ctor.params.where((p) => p.required).toList();
    if (required.isEmpty) return '  // ${ctor.raw} has no required params.';
    return '  // Required route args: ${required.map((p) => p.type).join(', ')}\n'
        '  // Provide a real instance here once the route is navigable in tests.';
  }

  static String footer(FeatureModel f) => '\n$regenerateHint\n';
}

class _ArgsCtor {
  _ArgsCtor(this.raw, this.params);

  final String raw;
  final List<_Param2> params;
}

class _Param2 {
  _Param2(this.type, this.required);

  final String type;
  final bool required;

  static _Param2 parse(String raw) {
    final required = raw.contains('required');
    final cleaned = raw.replaceFirst(RegExp(r'\brequired\b'), '').replaceFirst('this.', '').trim();
    final type = cleaned.contains(' ') ? cleaned.split(' ').first : 'dynamic';
    return _Param2(type, required);
  }
}
