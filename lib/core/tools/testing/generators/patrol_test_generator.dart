// ignore_for_file: avoid_print

/// Generates `integration_test/` drivers for Patrol:
/// Real app boots, real taps, with native automation support.
library;

import '../core/feature_model.dart';
import '../core/naming.dart';
import '../core/scaffold_writer.dart';

class PatrolTestGenerator {
  PatrolTestGenerator();

  /// One patrol integration test per screen that has a buildable body.
  List<String> generate(FeatureModel feature, ScaffoldWriter writer) {
    final paths = <String>[];
    for (final screen in feature.screens.where((s) => s.scaffoldHasBody)) {
      final path = 'integration_test/${screen.name}_patrol_test.dart';
      writer.write(path, _screenDriver(feature, screen));
      paths.add(path);
    }
    return paths;
  }

  String _screenDriver(FeatureModel feature, ScreenInfo screen) {
    final buf = StringBuffer()
      ..writeln(generatedMarker)
      ..writeln("import 'package:flutter/material.dart';")
      ..writeln("import 'package:flutter_test/flutter_test.dart';")
      ..writeln("import 'package:patrol/patrol.dart';")
      ..writeln()
      ..writeln("import '${screen.importPath}';")
      ..writeln()
      ..writeln('void main() {')
      ..writeln('  patrolTest(\'${screen.pageClass} loads and exposes widgets\', (\$) async {')
      ..writeln('    await \$.pumpWidgetAndSettle(')
      ..writeln('      MaterialApp(')
      ..writeln('        home: ${screen.pageClass}(args: const ${screen.routeArgsType ?? 'RouteArgs'}()),')
      ..writeln('      ),')
      ..writeln('    );')
      ..writeln();
      
    if (screen.widgets.isNotEmpty) {
      buf.writeln('    // Verify known widgets by accessible name');
      for (final w in screen.widgets) {
        buf.writeln("    expect(\$('${dartString(w.accessibleName)}'), findsOneWidget);");
      }
    } else {
      buf.writeln('    // TODO: Extract components into widgets/ and verify them here.');
    }

    buf
      ..writeln('  });')
      ..writeln('}')
      ..writeln(footer(feature));

    return buf.toString();
  }

  static String footer(FeatureModel f) => '\n$regenerateHint\n';
}
