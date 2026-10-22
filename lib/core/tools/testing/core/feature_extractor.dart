// ignore_for_file: avoid_print

/// Extracts a [FeatureModel] from a feature folder by walking the real Dart AST.
///
/// Uses `package:analyzer`'s parser in syntactic (unresolved) mode: fast, no
/// dependency on a warm `.dart_tool`, and tolerant of partially-broken files —
/// whatever declarations were recovered are still used.
///
/// Every type/parameter is read from **syntax**, never from the element model,
/// because unresolved units report `dynamic` for everything.
library;

import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

import 'feature_model.dart';
import 'naming.dart';

/// Depth-first descendant collector. Recursion stops as soon as [stopAt]
/// returns true, which keeps the walk linear instead of exponential.
class _Collector extends GeneralizingAstVisitor<void> {
  _Collector({this.onNode, this.stopAt});

  final void Function(AstNode node)? onNode;
  final bool Function(AstNode node)? stopAt;
  bool _stopped = false;

  @override
  void visitNode(AstNode node) {
    if (_stopped) return;
    onNode?.call(node);
    if (stopAt?.call(node) ?? false) {
      _stopped = true;
      return;
    }
    super.visitNode(node);
  }
}

class FeatureExtractor {
  FeatureExtractor({required this.packageName});

  final String packageName;

  static const interactiveWidgets = {
    'GestureDetector',
    'InkWell',
    'InkResponse',
    'ElevatedButton',
    'TextButton',
    'OutlinedButton',
    'IconButton',
    'Switch',
    'Checkbox',
    'Slider',
    'DropdownButton',
  };

  // ── entry ────────────────────────────────────────────────────────────────

  FeatureModel extract(String featureName, String rootPath) {
    final cubit = _readCubit(
      _existing('$rootPath/controller/${featureName}_cubit.dart'),
      featureName,
      rootPath,
    );

    final service = _readService(
      _existing('$rootPath/service/base_${featureName}_service.dart'),
      RegExp(r'^Base\w+Service$'),
      abstractBase: 'BaseService',
    );

    final repo = _readRepo(
      _existing('$rootPath/data/repo/base_${featureName}_repo.dart'),
      RegExp(r'^Base\w+Repo$'),
      abstractBase: 'BaseRepo',
    );

    return FeatureModel(
      featureName: featureName,
      rootPath: rootPath,
      packageName: packageName,
      cubit: cubit,
      service: service,
      repo: repo,
      models: _readModels('$rootPath/data/model'),
      screens: _readScreens(rootPath),
      routes: _readRoutes(),
    );
  }

  // ── discovery helpers ────────────────────────────────────────────────────

  static String? _existing(String path) =>
      File(path).existsSync() ? path : null;

  static List<File> _dartFiles(String dir, {bool recursive = false}) {
    final d = Directory(dir);
    if (!d.existsSync()) return const [];
    return d
        .listSync(recursive: recursive)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart') && !f.path.endsWith('.g.dart'))
        .toList();
  }

  static CompilationUnit? _parse(String? path) {
    if (path == null) return null;
    try {
      return parseString(
        content: File(path).readAsStringSync(),
        path: path,
        throwIfDiagnostics: false,
      ).unit;
    } catch (_) {
      return null;
    }
  }

  static Iterable<AstNode> _descendants(AstNode root) sync* {
    final out = <AstNode>[];
    root.accept(_Collector(onNode: out.add));
    yield* out;
  }

  static Expression? _findNamedArg(AstNode root, String member) {
    Expression? found;
    root.accept(_Collector(stopAt: (n) {
      if (n is NamedExpression && n.name.label.name == member) {
        found = n.expression;
        return true;
      }
      return false;
    }));
    return found;
  }

  // ── syntax readers ───────────────────────────────────────────────────────

  static String _doc(AnnotatedNode node) {
    final comment = node.documentationComment;
    if (comment == null) return '';
    return comment
        .toString()
        .split('\n')
        .map((l) => l.replaceFirst(RegExp(r'^\s*(///+|//+|/\*+|\*+/?)'), '').trim())
        .where((l) => l.isNotEmpty)
        .join(' ')
        .trim();
  }

  static String _typeText(TypeAnnotation? type, [String fallback = 'dynamic']) {
    if (type == null) return fallback;
    final t = type.toString().trim();
    return t.isEmpty ? fallback : t;
  }

  static String? _extendsName(ClassDeclaration c) =>
      c.extendsClause?.superclass.name2.lexeme;

  static String? _baseTypeArg(ClassDeclaration c) {
    final args = c.extendsClause?.superclass.typeArguments?.arguments;
    if (args == null || args.isEmpty) return null;
    return args.first.toString().trim();
  }

  static ParamInfo? _param(FormalParameter p) {
    final name = p.name?.lexeme;
    if (name == null || name.isEmpty || name == '_') return null;

    // `this.x` / `super.x` -> type comes from the field, treat as dynamic.
    String type = 'dynamic';
    String? defaultValue;
    if (p is SimpleFormalParameter) {
      type = _typeText(p.type);
    } else if (p is DefaultFormalParameter) {
      defaultValue = p.defaultValue?.toString().trim();
    }

    // A `super.key` style parameter is always named + optional.
    final isSuperOrThis = p is FieldFormalParameter;

    return ParamInfo(
      name: name,
      type: type,
      named: isSuperOrThis || p.isNamed || p.isOptionalNamed,
      required: isSuperOrThis ? false : (p.isRequired || p.isRequiredNamed),
      defaultValue: defaultValue,
    );
  }

  static List<ParamInfo> _params(FormalParameterList? list) {
    if (list == null) return const [];
    return list.parameters.map(_param).whereType<ParamInfo>().toList();
  }

  static MethodInfo? _method(MethodDeclaration m) {
    final name = m.name.lexeme;
    if (name.isEmpty || name.startsWith('_')) return null;
    return MethodInfo(
      name: name,
      returnType: _typeText(m.returnType, 'void'),
      params: _params(m.parameters),
      isAsync: m.body.isAsynchronous,
      doc: _doc(m).isEmpty ? null : _doc(m),
    );
  }

  /// Reads `final BaseEmit? a, b;` into one entry per variable.
  ///
  /// The type lives on the shared [VariableDeclarationList], so every variable
  /// in the list inherits it.
  static List<StateFieldInfo> _fields(FieldDeclaration m) {
    final list = m.fields;
    final type = _typeText(list.type);
    final doc = _doc(m);
    return list.variables
        .map((v) => StateFieldInfo(
              name: v.name.lexeme,
              type: type,
              nullable: type.endsWith('?'),
              doc: doc.isEmpty ? null : doc,
            ))
        .toList();
  }

  // ── cubit ────────────────────────────────────────────────────────────────

  CubitInfo? _readCubit(String? path, String featureName, String rootPath) {
    final unit = _parse(path);
    if (unit == null) return null;

    final pascalFeature = toPascal(featureName);
    ClassDeclaration? cubitClass;
    for (final d in unit.declarations) {
      if (d is ClassDeclaration && (_extendsName(d) ?? '').startsWith('BaseCubit')) {
        cubitClass = d;
        break;
      }
    }
    if (cubitClass == null) return null;

    final stateBase = _baseTypeArg(cubitClass) ?? '${pascalFeature}State';

    // Service dependency — the `Base*Service` typed field.
    var serviceType = 'Base${pascalFeature}Service';
    var serviceField = '_service';
    for (final m in cubitClass.members) {
      if (m is! FieldDeclaration) continue;
      final t = _typeText(m.fields.type);
      if (t.startsWith('Base') && t.endsWith('Service')) {
        serviceType = t.replaceAll('?', '');
        serviceField = m.fields.variables.first.name.lexeme;
      }
    }

    // Initial state from `super(FooLoaded())`.
    var initialState = '${pascalFeature}Loaded()';
    for (final m in cubitClass.members) {
      if (m is! ConstructorDeclaration) continue;
      for (final init in m.initializers) {
        if (init is SuperConstructorInvocation) {
          final arg = init.argumentList.arguments;
          if (arg.isNotEmpty) initialState = arg.first.toString().trim();
        }
      }
    }

    final methods = <MethodInfo>[];
    for (final m in cubitClass.members) {
      if (m is MethodDeclaration) {
        final info = _method(m);
        if (info != null) methods.add(info);
      }
    }

    // State variants live in the `part` file.
    final variants = <StateVariantInfo>[];
    final stateFields = <StateFieldInfo>[];
    final partUnit = _parse(_existing('$rootPath/controller/${featureName}_state.dart'));
    if (partUnit != null) {
      for (final d in partUnit.declarations) {
        if (d is! ClassDeclaration) continue;
        if (d.abstractKeyword != null) continue; // skip `abstract class XState {}`
        if (_extendsName(d) != stateBase && !d.name.lexeme.endsWith('State')) continue;

        final fields = <StateFieldInfo>[];
        for (final m in d.members) {
          if (m is FieldDeclaration) fields.addAll(_fields(m));
        }
        stateFields.addAll(fields);
        variants.add(StateVariantInfo(name: d.name.lexeme, fields: fields));
      }
    }

    final contract = _findContractClass(
      _existing('$rootPath/service/base_${featureName}_service.dart'),
      RegExp(r'^Base\w+Service$'),
      'BaseService',
    );
    final repoContract = _findContractClass(
      _existing('$rootPath/data/repo/base_${featureName}_repo.dart'),
      RegExp(r'^Base\w+Repo$'),
      'BaseRepo',
    );

    return CubitInfo(
      name: cubitClass.name.lexeme,
      stateType: stateBase,
      stateBaseClass: stateBase,
      serviceType: serviceType,
      serviceField: serviceField,
      methods: methods,
      stateFields: stateFields,
      stateVariants: variants,
      initialState: initialState,
      importPath:
          'package:$packageName/features/screens/$featureName/controller/${featureName}_cubit.dart',
      service: contract == null
          ? null
          : ServiceInfo(
              name: contract.name,
              methods: contract.methods,
              isAbstract: contract.isAbstract,
            ),
      repo: repoContract == null
          ? null
          : RepoInfo(
              name: repoContract.name,
              methods: repoContract.methods,
              isAbstract: repoContract.isAbstract,
            ),
    );
  }

  // ── service / repo contracts ─────────────────────────────────────────────

  /// Reads an abstract service contract (`abstract class BaseXService`).
  ServiceInfo? _readService(
    String? path,
    RegExp namePattern, {
    required String abstractBase,
  }) {
    final found = _findContractClass(path, namePattern, abstractBase);
    if (found == null) return null;
    return ServiceInfo(
      name: found.name,
      methods: found.methods,
      isAbstract: found.isAbstract,
    );
  }

  /// Reads an abstract repo contract (`abstract class BaseXRepo`).
  RepoInfo? _readRepo(
    String? path,
    RegExp namePattern, {
    required String abstractBase,
  }) {
    final found = _findContractClass(path, namePattern, abstractBase);
    if (found == null) return null;
    return RepoInfo(
      name: found.name,
      methods: found.methods,
      isAbstract: found.isAbstract,
    );
  }

  static ({String name, List<MethodInfo> methods, bool isAbstract})? _findContractClass(
    String? path,
    RegExp namePattern,
    String abstractBase,
  ) {
    final unit = _parse(path);
    if (unit == null) return null;
    for (final d in unit.declarations) {
      if (d is! ClassDeclaration) continue;
      if (!namePattern.hasMatch(d.name.lexeme)) continue;
      final methods = <MethodInfo>[];
      for (final m in d.members) {
        if (m is MethodDeclaration) {
          final info = _method(m);
          if (info != null) methods.add(info);
        }
      }
      return (
        name: d.name.lexeme,
        methods: methods,
        isAbstract: d.abstractKeyword != null || _extendsName(d) == abstractBase,
      );
    }
    return null;
  }

  // ── models ───────────────────────────────────────────────────────────────

  List<ModelInfo> _readModels(String modelDir) {
    final out = <ModelInfo>[];
    for (final f in _dartFiles(modelDir, recursive: true)) {
      final unit = _parse(f.path);
      if (unit == null) continue;
      for (final d in unit.declarations) {
        if (d is! ClassDeclaration) continue;
        var fromJson = false;
        final fields = <StateFieldInfo>[];
        for (final m in d.members) {
          if (m is MethodDeclaration && m.name.lexeme == 'fromJson') fromJson = true;
          if (m is FieldDeclaration) fields.addAll(_fields(m));
        }
        out.add(ModelInfo(
          name: d.name.lexeme,
          fileName: f.uri.pathSegments.last,
          fields: fields,
          fromJson: fromJson,
        ));
      }
    }
    return out;
  }

  // ── screens + widgets ────────────────────────────────────────────────────

  List<ScreenInfo> _readScreens(String rootPath) {
    final uiDir = Directory('$rootPath/ui');
    if (!uiDir.existsSync()) return const [];

    final screens = <ScreenInfo>[];

    for (final screenDir in uiDir.listSync().whereType<Directory>()) {
      final nameParts = screenDir.uri.pathSegments.where((s) => s.isNotEmpty).toList();
      if (nameParts.isEmpty) continue;
      final screenName = nameParts.last;

      // A screen dir must contain `<name>_screen.dart`; this filters out
      // `widgets/` and any stray folders.
      final screenFile = File('${screenDir.path}/${screenName}_screen.dart');
      if (!screenFile.existsSync()) continue;

      final unit = _parse(screenFile.path);
      if (unit == null) continue;
      final source = unit.toString();

      ClassDeclaration? pageClass;
      for (final d in unit.declarations) {
        if (d is! ClassDeclaration) continue;
        final sup = _extendsName(d) ?? '';
        if (sup == 'StatefulWidget' || sup == 'StatelessWidget') {
          pageClass = d;
          break;
        }
      }
      if (pageClass == null) continue;

      String? argsType;
      for (final m in pageClass.members) {
        if (m is! FieldDeclaration) continue;
        final t = _typeText(m.fields.type);
        if (t.endsWith('RouteArgs')) argsType = t;
      }

      final hasRoutePage = pageClass.metadata
          .whereType<Annotation>()
          .any((a) => a.name.name == 'RoutePage');

      final listened = <String>{};
      for (final node in _descendants(pageClass)) {
        if (node is BinaryExpression && node.operator.lexeme == 'is') {
          final t = node.rightOperand.toString().trim();
          if (RegExp(r'^[A-Z][A-Za-z0-9_]*$').hasMatch(t)) listened.add(t);
        }
      }

      screens.add(ScreenInfo(
        name: screenName,
        pageClass: pageClass.name.lexeme,
        stateClass: '_${pageClass.name.lexeme}State',
        fileName: screenFile.uri.pathSegments.last,
        routeArgsType: argsType,
        hasRoutePage: hasRoutePage,
        hasBlocListener: source.contains('BlocListener'),
        hasBlocBuilder: source.contains('BlocBuilder'),
        listenedStates: listened.toList(),
        widgets: _readWidgets('${screenDir.path}/widgets'),
        scaffoldHasBody: (_scaffoldMember(pageClass, 'body') ?? '').isNotEmpty,
        scaffoldHasAppBar: (_scaffoldMember(pageClass, 'appBar') ?? '').isNotEmpty,
        // `rootPath` is already project-relative (`lib/features/...`), so it can
        // be pasted straight into a package: URI after slash normalisation.
        importPath: 'package:$packageName/${rootPath.replaceAll(r'\', '/')}'
            '/ui/$screenName/$screenName.dart',
      ));
    }
    return screens;
  }

  /// Source text of `member: <value>` inside the screen's `build` return.
  static String? _scaffoldMember(ClassDeclaration pageClass, String member) {
    for (final m in pageClass.members) {
      if (m is! MethodDeclaration || m.name.lexeme != 'build') continue;
      final body = m.body;
      if (body is! BlockFunctionBody) continue;
      for (final st in body.block.statements) {
        if (st is! ReturnStatement) continue;
        final expr = st.expression;
        if (expr == null) continue;
        final arg = _findNamedArg(expr, member);
        if (arg != null) return arg.toString().trim();
      }
    }
    return null;
  }

  static List<WidgetInfo> _readWidgets(String widgetsDir) {
    final out = <WidgetInfo>[];
    for (final f in _dartFiles(widgetsDir)) {
      final unit = _parse(f.path);
      if (unit == null) continue;
      final source = unit.toString();

      for (final d in unit.declarations) {
        if (d is! ClassDeclaration) continue;
        final sup = _extendsName(d) ?? '';
        if (sup != 'StatelessWidget' && sup != 'StatefulWidget') continue;

        final props = <ParamInfo>[];
        for (final m in d.members) {
          if (m is! ConstructorDeclaration) continue;
          for (final p in _params(m.parameters)) {
            if (p.name == 'key') continue;
            props.add(p);
          }
        }

        final semantics = <SemanticsRef>[];
        var usesBlocBuilder = false;
        var interactive = false;

        for (final node in _descendants(d)) {
          if (node is MethodInvocation) {
            final n = node.methodName.name;
            if (n == 'BlocBuilder') usesBlocBuilder = true;
            if (interactiveWidgets.contains(n)) interactive = true;
          }
          if (node is InstanceCreationExpression) {
            final ctor = node.constructorName.type.name2.lexeme;
            if (ctor != 'Semantics') continue;
            String? label;
            Expression? child;
            for (final a in node.argumentList.arguments) {
              if (a is! NamedExpression) continue;
              final key = a.name.label.name;
              if (key == 'label' && a.expression is SimpleStringLiteral) {
                label = (a.expression as SimpleStringLiteral).value;
              } else if (key == 'child') {
                child = a.expression;
              }
            }
            if (label != null) {
              semantics.add(SemanticsRef(
                label: label,
                widget: ctor,
                child: child?.toString().trim() ?? '',
              ));
            }
          }
        }

        final doc = _doc(d);
        out.add(WidgetInfo(
          className: d.name.lexeme,
          fileName: f.uri.pathSegments.last,
          props: props,
          isStateless: sup == 'StatelessWidget',
          semantics: semantics,
          usesBlocBuilder: usesBlocBuilder,
          doc: doc.isEmpty ? null : doc,
          interactive: interactive || interactiveWidgets.any(source.contains),
        ));
      }
    }
    return out;
  }

  // ── routes ───────────────────────────────────────────────────────────────

  List<RouteInfo> _readRoutes() {
    final unit = _parse(_existing('lib/core/app/route.dart'));
    if (unit == null) return const [];

    final out = <RouteInfo>[];
    for (final node in _descendants(unit)) {
      if (node is! InstanceCreationExpression) continue;
      if (node.constructorName.type.name2.lexeme != 'AutoRoute') continue;

      String? routeClass;
      bool isInitial = false;
      for (final a in node.argumentList.arguments) {
        if (a is NamedExpression) {
          if (a.name.label.name == 'initial' &&
              a.expression is BooleanLiteral &&
              (a.expression as BooleanLiteral).value == true) {
            isInitial = true;
          }
          final m = RegExp(r'(\w+Route)\.page').firstMatch(a.toString());
          if (m != null) routeClass = m.group(1);
        }
      }
      if (routeClass == null) continue;
      out.add(RouteInfo(
        routeClass: routeClass,
        path: '/${toSnake(routeClass.replaceAll(RegExp(r'Route$'), ''))}',
        pageClass: '${routeClass.replaceAll(RegExp(r'Route$'), '')}Page',
        isInitial: isInitial,
      ));
    }
    return out;
  }
}
