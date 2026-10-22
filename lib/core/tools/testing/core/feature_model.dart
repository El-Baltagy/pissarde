// ignore_for_file: avoid_print

/// Structural model of a feature folder, extracted from real Dart source via
/// `package:analyzer` (AST, not regex) so generated tests compile against the
/// actual method names, state fields and types.
library;

class ParamInfo {
  ParamInfo({
    required this.name,
    required this.type,
    required this.named,
    required this.required,
    this.defaultValue,
  });

  final String name;
  final String type;
  final bool named;
  final bool required;
  final String? defaultValue;

  /// Placeholder literal that satisfies the type for a mock/stub call site.
  String get placeholder {
    final t = type.replaceAll('?', '').toLowerCase();
    if (t.startsWith('void')) return '';
    if (t.startsWith('string')) return "''";
    if (t.startsWith('int') || t.startsWith('double') || t.startsWith('num')) return '0';
    if (t.startsWith('bool')) return 'false';
    if (t.startsWith('list')) return 'const []';
    if (t.startsWith('set')) return 'const {}';
    if (t.startsWith('map')) return 'const {}';
    if (t.contains('noParameters')) return 'NoParameters()';
    return 'null';
  }
}

class MethodInfo {
  MethodInfo({
    required this.name,
    required this.returnType,
    required this.params,
    required this.isAsync,
    required this.doc,
  });

  final String name;
  final String returnType;
  final List<ParamInfo> params;
  final bool isAsync;
  final String? doc;

  /// Argument list for a mocktail `when(() => mock.m(...))`.
  ///
  /// Named params use `any(named: '...')`, positional use `any()`.
  String get mockArgs {
    final buffer = StringBuffer();
    for (var i = 0; i < params.length; i++) {
      final p = params[i];
      if (i > 0) buffer.write(', ');
      if (p.named) {
        buffer.write("${p.name}: any(named: '${p.name}')");
      } else {
        buffer.write('any()');
      }
    }
    return buffer.toString();
  }

  String get positionalSignature =>
      params.where((p) => !p.named).map((p) => p.type).join(', ');

  /// e.g. `Future<void> getProjectsServ(RequestCallbackObserver<...>)`
  String get signature =>
      '${isAsync ? 'Future<$returnType>' : returnType} $name(${_declParams()})';

  String _declParams() => params.map((p) {
        final prefix = p.named
            ? (p.required ? 'required ' : '')
            : (p.required ? '' : 'required ');
        return '$prefix${p.type} $name';
      }).join(', ');

  String get callArgs => params
      .map((p) => p.named ? '${p.name}: ${p.placeholder}' : p.placeholder)
      .join(', ');
}

class StateFieldInfo {
  StateFieldInfo({
    required this.name,
    required this.type,
    required this.nullable,
    this.doc,
  });

  final String name;
  final String type;
  final bool nullable;
  final String? doc;

  bool get isBaseEmit => type.contains('BaseEmit');
}

class StateVariantInfo {
  StateVariantInfo({required this.name, required this.fields});

  final String name;
  final List<StateFieldInfo> fields;
}

class CubitInfo {
  CubitInfo({
    required this.name,
    required this.stateType,
    required this.stateBaseClass,
    required this.serviceType,
    required this.serviceField,
    required this.methods,
    required this.stateFields,
    required this.stateVariants,
    required this.initialState,
    required this.importPath,
    this.service,
    this.repo,
  });

  final String name;
  final String stateType;
  final String stateBaseClass;

  /// Abstract service the cubit depends on, e.g. `BaseMainScreenService`.
  final String serviceType;
  final String serviceField;
  final List<MethodInfo> methods;
  final List<StateFieldInfo> stateFields;
  final List<StateVariantInfo> stateVariants;
  final String initialState;

  /// Package import for the cubit, ready to paste into a test.
  final String importPath;

  /// Service contract this cubit depends on, when it could be read.
  final ServiceInfo? service;

  /// Repo contract behind the service, when it could be read.
  final RepoInfo? repo;

  /// Methods that emit state (drive Loading -> Success/Error transitions).
  List<MethodInfo> get statefulMethods =>
      methods.where((m) => m.isAsync && !m.name.startsWith('_')).toList();

  /// `Loading() -> Success(data) -> ErrorState(Failure(...))` per state field.
  Iterable<({StateFieldInfo field, String emittedType})> get emitSlices sync* {
    for (final f in stateFields) {
      if (!f.isBaseEmit) continue;
      yield (field: f, emittedType: f.name);
    }
  }
}

class ServiceInfo {
  ServiceInfo({required this.name, required this.methods, required this.isAbstract});

  final String name;
  final List<MethodInfo> methods;
  final bool isAbstract;
}

class RepoInfo {
  RepoInfo({required this.name, required this.methods, required this.isAbstract});

  final String name;
  final List<MethodInfo> methods;
  final bool isAbstract;
}

class ModelInfo {
  ModelInfo({
    required this.name,
    required this.fileName,
    required this.fields,
    required this.fromJson,
  });

  final String name;
  final String fileName;
  final List<StateFieldInfo> fields;
  final bool fromJson;
}

class SemanticsRef {
  SemanticsRef({required this.label, required this.widget, required this.child});

  final String label;
  final String widget;

  /// The `const X()` expression the wrapper was applied to.
  final String child;
}

class WidgetInfo {
  WidgetInfo({
    required this.className,
    required this.fileName,
    required this.props,
    required this.isStateless,
    required this.semantics,
    required this.usesBlocBuilder,
    required this.doc,
    required this.interactive,
  });

  final String className;
  final String fileName;
  final List<ParamInfo> props;
  final bool isStateless;
  final List<SemanticsRef> semantics;
  final bool usesBlocBuilder;
  final String? doc;
  final bool interactive;

  /// Accessible name Playwright / `find.bySemanticsLabel` will use.
  String get accessibleName {
    if (semantics.isNotEmpty) return semantics.first.label;
    return className;
  }

  String get propsArgs => props
      .map((p) => p.named ? '${p.name}: ${p.placeholder}' : p.placeholder)
      .join(', ');
}

class ScreenInfo {
  ScreenInfo({
    required this.name,
    required this.pageClass,
    required this.stateClass,
    required this.fileName,
    required this.routeArgsType,
    required this.hasRoutePage,
    required this.hasBlocListener,
    required this.hasBlocBuilder,
    required this.listenedStates,
    required this.widgets,
    required this.scaffoldHasBody,
    required this.scaffoldHasAppBar,
    required this.importPath,
  });

  final String name;
  final String pageClass;
  final String stateClass;
  final String fileName;
  final String? routeArgsType;
  final bool hasRoutePage;
  final bool hasBlocListener;
  final bool hasBlocBuilder;
  final List<String> listenedStates;
  final List<WidgetInfo> widgets;
  final bool scaffoldHasBody;
  final bool scaffoldHasAppBar;
  final String importPath;

  String get widgetUnderTest => widgets.isEmpty ? pageClass : widgets.first.className;
}

class RouteInfo {
  RouteInfo({
    required this.routeClass,
    required this.path,
    required this.pageClass,
    this.isInitial = false,
  });

  final String routeClass;
  final String path;
  final String pageClass;

  /// The route auto_route would start on.
  final bool isInitial;

  /// Deep link Playwright can navigate straight to, e.g. `/main_screen`.
  String get webPath => '/#${isInitial ? '' : ''}$path';
}

/// Everything the generators need about one feature folder.
class FeatureModel {
  FeatureModel({
    required this.featureName,
    required this.rootPath,
    required this.packageName,
    required this.cubit,
    required this.service,
    required this.repo,
    required this.models,
    required this.screens,
    required this.routes,
  });

  final String featureName;
  final String rootPath;
  final String packageName;
  final CubitInfo? cubit;
  final ServiceInfo? service;
  final RepoInfo? repo;
  final List<ModelInfo> models;
  final List<ScreenInfo> screens;
  final List<RouteInfo> routes;

  bool get hasCubit => cubit != null;
  bool get hasScreens => screens.isNotEmpty;

  /// Default widget to drive in e2e tests: the first screen with a Scaffold body.
  ScreenInfo? get primaryScreen {
    if (screens.isEmpty) return null;
    for (final s in screens) {
      if (s.scaffoldHasBody) return s;
    }
    return screens.first;
  }
}
