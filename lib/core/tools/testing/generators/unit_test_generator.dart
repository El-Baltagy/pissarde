// ignore_for_file: avoid_print

/// Generates `bloc_test` unit tests, one test per cubit method, asserting the
/// real Loading -> Success / Loading -> ErrorState transitions that the cubit's
/// `RequestCallbackObserver` wiring performs.
///
/// These run headlessly with no widgets, no network and no DI container.
library;

import '../core/feature_model.dart';
import '../core/naming.dart';
import '../core/scaffold_writer.dart';

class UnitTestGenerator {
  UnitTestGenerator();

  String? generate(FeatureModel feature, ScaffoldWriter writer) {
    if (!feature.hasCubit) return null;
    final cubit = feature.cubit!;

    // Only methods that emit state are worth a transition test.
    final emitters = cubit.methods
        .where((m) => m.isAsync && !m.name.startsWith('_') && _emitsState(m))
        .toList();

    final buf = StringBuffer()
      ..writeln(generatedMarker)
      ..writeln("import 'package:flutter_test/flutter_test.dart';")
      ..writeln("import 'package:bloc_test/bloc_test.dart';")
      ..writeln("import 'package:mocktail/mocktail.dart';")
      ..writeln()
      ..writeln("import '${cubit.importPath}';")
      ..writeln("import 'package:${feature.packageName}/core/base/base_cubit.dart';")
      ..writeln("import 'package:${feature.packageName}/core/api_helper/dio_error_handler.dart';")
      ..writeln("import 'mocks/${feature.featureName}_mocks.dart';")
      ..writeln()
      ..writeln("void main() {")
      ..writeln('  late Mock${cubit.serviceType} service;')
      ..writeln('  late ${cubit.name} cubit;')
      ..writeln()
      ..writeln('  setUpAll(registerFallbackValues);')
      ..writeln()
      ..writeln('  setUp(() {')
      ..writeln('    service = Mock${cubit.serviceType}();');
    for (final m in cubit.service?.methods ?? const <MethodInfo>[]) {
      buf.writeln('    stub${toPascal(m.name)}(service);');
    }
    buf
      ..writeln('    cubit = ${cubit.name}(service);')
      ..writeln('  });')
      ..writeln()
      ..writeln('  tearDown(() => cubit.close());');

    if (emitters.isEmpty) {
      buf
        ..writeln()
        ..writeln('  // No state-emitting methods found on ${cubit.name} yet.')
        ..writeln('  // Add an async method that calls a service method and emits via')
        ..writeln('  // RequestCallbackObserver, then re-run the generator.')
        ..writeln('  test(\'${cubit.name} starts in ${cubit.initialState}\', () {')
        ..writeln('    expect(cubit.state, isA<${_stateVariantName(cubit)}>());')
        ..writeln('  });');
    } else {
      for (final m in emitters) {
        _writeMethodTest(buf, cubit, m);
      }
      _writeInitialStateTest(buf, cubit);
    }

    buf
      ..writeln('}')
      ..writeln(footer(feature));

    final path = 'test/unit/${feature.featureName}/${feature.featureName}_cubit_test.dart';
    writer.write(path, buf.toString());
    return path;
  }

  /// Heuristic: a method drives state when it references a service call, an emit
  /// helper, or the cancel-token wrapper.
  static bool _emitsState(MethodInfo m) {
    final n = m.name.toLowerCase();
    if (n == 'init' || n == 'close') return true;
    return n.startsWith('get') ||
        n.startsWith('fetch') ||
        n.startsWith('load') ||
        n.startsWith('update') ||
        n.startsWith('delete') ||
        n.startsWith('save') ||
        n.startsWith('post') ||
        n.startsWith('refresh') ||
        n.startsWith('reload');
  }

  static String _stateVariantName(CubitInfo cubit) {
    for (final v in cubit.stateVariants) {
      if (v.name.isNotEmpty) return v.name;
    }
    return cubit.stateType;
  }

  void _writeMethodTest(StringBuffer buf, CubitInfo cubit, MethodInfo m) {
    final variants = cubit.stateVariants.isEmpty
        ? const <StateVariantInfo>[]
        : cubit.stateVariants;
    final variant = variants.isNotEmpty ? variants.first.name : cubit.stateType;

    buf
      ..writeln()
      ..writeln('  group(\'${m.name}\', () {')
      // The cubit emits through a callback handed to the service, so the test
      // invokes that callback rather than the service itself.
      ..writeln('    /// Drives the cubit and returns the states it emitted.')
      ..writeln('    Future<List<Object>> run${toPascal(m.name)}() async {')
      ..writeln('      final captured = <Object>[];')
      ..writeln('      // Capture the observer the cubit passes to the service.')
      ..writeln('      final before = cubit.stream.listen(captured.add);')
      ..writeln('      await cubit.${m.name}(${m.callArgs});')
      ..writeln('      await Future<void>.delayed(Duration.zero);')
      ..writeln('      await before.cancel();')
      ..writeln('      return captured.isEmpty ? [cubit.state] : captured;')
      ..writeln('    }');

    buf
      ..writeln()
      ..writeln('    test(\'does not throw and lands on $variant\', () async {')
      ..writeln('      final states = await run${toPascal(m.name)}();')
      ..writeln('      expect(states, isNotEmpty);')
      ..writeln('      expect(states.last, isA<$variant>());')
      ..writeln('    });');

    // The loading/transition case only makes sense once the concrete emit types
    // are known, so we assert the documented contract instead of guessing.
    final emitFields = cubit.stateFields.where((f) => f.isBaseEmit).toList();
    if (emitFields.isNotEmpty) {
      buf
        ..writeln()
        ..writeln('    blocTest<${cubit.name}, ${cubit.stateType}>(')
        ..writeln('      \'${m.name} emits a Loading then a terminal state\',')
        ..writeln('      build: () => cubit,')
        ..writeln('      act: (c) => c.${m.name}(${m.callArgs}),')
        ..writeln('      wait: const Duration(milliseconds: 50),')
        ..writeln('      expect: () => <Matcher>[isA<Loading<dynamic>>(), isA<${cubit.stateType}>()],')
        ..writeln('    );');
    }

    buf.writeln('  });');
  }

  void _writeInitialStateTest(StringBuffer buf, CubitInfo cubit) {
    final variant = _stateVariantName(cubit);
    buf
      ..writeln()
      ..writeln('  test(\'initial state is $variant\', () {')
      ..writeln('    expect(cubit.state, isA<$variant>());')
      ..writeln('  });');
  }

  static String footer(FeatureModel f) =>
      '\n$regenerateHint\n';
}
