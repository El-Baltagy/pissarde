// ignore_for_file: avoid_print

/// HTTP bridge that exposes a running Flutter app to an external test runner.
///
/// Flutter web paints into a `<canvas>`, so Playwright has no selectors to work
/// with. This bridge closes that gap from the Dart side: the running app
/// publishes its accessibility tree and accepts commands, and Playwright talks
/// to it over HTTP.
///
/// Endpoints (all JSON):
///
///   GET  /health            -> `{ "ok": true, "screen": "main_screen" }`
///   GET  /state             -> `{ "screen": ..., "semantics": [...] }`
///   POST /publish           -> publish labels + screen name
///   POST /tap               -> `{ "label": "Add new" }` taps by accessible name
///   GET  /screenshot        -> raw PNG bytes
///
/// Nothing here imports `dart:io` HTTP types beyond `HttpServer`, so it compiles
/// for mobile/desktop too and is inert unless [start] is called.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// Minimal untyped view of the tester/element APIs this bridge needs, so the
/// bridge has no dependency on `flutter_test` and stays testable on its own.
typedef TapTarget = Future<void> Function(String label);

class TestingBridge {
  TestingBridge({this.port = 8765, this.host = '127.0.0.1'});

  final int port;
  final String host;

  HttpServer? _server;

  String _screen = '';
  final List<String> _semantics = [];
  final List<Map<String, String>> _actions = [];

  /// Registers a handler the generated driver wires up to real widget taps.
  TapTarget? tapHandler;

  /// Registers a screenshot provider returning encoded PNG bytes.
  Future<List<int>> Function()? screenshotProvider;

  final _done = Completer<void>();

  int get actualPort => _server?.port ?? port;
  bool get isRunning => _server != null;

  /// The URL Playwright should target.
  String get baseUrl => 'http://$host:$actualPort';

  Future<void> start() async {
    if (_server != null) return;
    final server = await HttpServer.bind(InternetAddress.anyIPv4, port, shared: true);
    _server = server;
    server.listen(_handle, onError: (Object e) => print('[bridge] error: $e'));
  }

  Future<void> stop() async {
    await _server?.close(force: true);
    _server = null;
    if (!_done.isCompleted) _done.complete();
  }

  /// Publishes the accessible labels currently on screen.
  void publish({required String screen, required List<String> semantics}) {
    _screen = screen;
    _semantics
      ..clear()
      ..addAll(semantics);
  }

  /// Records a tap so `/state` can report it back for assertions.
  void recordAction(String type, String target) =>
      _actions.add({'type': type, 'target': target});

  /// Resolves once the driver is torn down (Playwright has disconnected).
  Future<void> waitForDisconnect() => _done.future;

  // ── HTTP ─────────────────────────────────────────────────────────────────

  Future<void> _handle(HttpRequest request) async {
    final path = request.uri.path;
    request.response.headers.contentType = ContentType.json;

    try {
      switch (path) {
        case '/health':
          return _json(request, 200, {
            'ok': true,
            'screen': _screen,
            'semantics': _semantics.length,
          });

        case '/state':
          return _json(request, 200, {
            'screen': _screen,
            'semantics': _semantics,
            'actions': _actions,
          });

        case '/publish':
          final body = await _body(request);
          publish(
            screen: body['screen']?.toString() ?? '',
            semantics: (body['semantics'] as List?)?.map((e) => e.toString()).toList() ?? const [],
          );
          return _json(request, 200, {'ok': true});

        case '/tap':
          final body = await _body(request);
          final label = body['label']?.toString() ?? '';
          if (label.isEmpty) {
            return _json(request, 400, {'ok': false, 'error': 'label required'});
          }
          final handler = tapHandler;
          if (handler == null) {
            return _json(request, 501, {
              'ok': false,
              'error': 'no tapHandler registered',
              'available': _semantics,
            });
          }
          recordAction('tap', label);
          await handler(label);
          return _json(request, 200, {'ok': true, 'tapped': label});

        case '/screenshot':
          final provider = screenshotProvider;
          if (provider == null) {
            return _json(request, 501, {'ok': false, 'error': 'no screenshotProvider registered'});
          }
          final bytes = await provider();
          request.response.headers.contentType = ContentType('image', 'png');
          request.response.add(bytes);
          await request.response.close();
          return;

        default:
          return _json(request, 404, {'ok': false, 'error': 'unknown endpoint $path'});
      }
    } catch (e) {
      return _json(request, 500, {'ok': false, 'error': e.toString()});
    }
  }

  Future<void> _json(HttpRequest request, int status, Map<String, Object?> body) async {
    request.response.statusCode = status;
    request.response.write(jsonEncode(body));
    await request.response.close();
  }

  Future<Map<String, Object?>> _body(HttpRequest request) async {
    final raw = await utf8.decoder.bind(request).join();
    if (raw.isEmpty) return const {};
    try {
      return jsonDecode(raw) as Map<String, Object?>;
    } catch (_) {
      return const {};
    }
  }
}
