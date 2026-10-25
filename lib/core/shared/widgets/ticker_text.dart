import 'dart:async';
import 'package:flutter/material.dart';

class TickerText extends StatefulWidget {
  /// Creates a widget that scrolls to reveal child contents if it overflows,
  /// and scrolls back up when it reaches the end.
  /// Optionally accepts a [TickerTextController] to control scroll behavior.
  const TickerText({
    super.key,
    required this.child,
    this.scrollDirection = Axis.horizontal,
    this.returnDuration = const Duration(milliseconds: 800),
    this.startPauseDuration = const Duration(seconds: 2),
    this.endPauseDuration,
    this.speed = 20,
    this.controller,
    this.primaryCurve = Curves.linear,
    this.returnCurve = Curves.easeOut,
  }) : assert(speed > 0, 'Speed has to be greater than zero');

  final Widget child;
  final Axis scrollDirection;
  final int speed;
  final Duration returnDuration;
  final Duration startPauseDuration;
  final Duration? endPauseDuration;
  final TickerTextController? controller;
  final Curve primaryCurve;
  final Curve returnCurve;

  @override
  State<TickerText> createState() => _TickerTextState();
}

class _TickerTextState extends State<TickerText> {
  late final ScrollController _scrollController;
  late final TickerTextController _autoScrollController;
  Timer? _activeTimer;

  double get maxScrollExtent => _scrollController.position.maxScrollExtent;
  Duration get scrollDuration => Duration(
        milliseconds: ((maxScrollExtent / widget.speed) * 1000).toInt(),
      );

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _autoScrollController =
        widget.controller ?? TickerTextController(autoStart: true);

    if (_autoScrollController.started) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _scroll();
      });
    } else {
      _autoScrollController.addListener(_scroll);
    }
  }

  @override
  void dispose() {
    _activeTimer?.cancel();
    _scrollController.dispose();
    if (widget.controller == null) {
      _autoScrollController.dispose();
    }
    super.dispose();
  }

  Future<bool> _waitWithCancel(Duration duration) {
    final completer = Completer<bool>();
    _activeTimer?.cancel();
    _activeTimer = Timer(duration, () {
      if (!completer.isCompleted) completer.complete(true);
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: widget.scrollDirection,
      controller: _scrollController,
      child: widget.child,
    );
  }

  Future<void> _scroll() async {
    if (!mounted) return;
    if (_scrollController.hasClients &&
        _scrollController.offset > 0 &&
        !_autoScrollController.started) {
      _scrollController.jumpTo(0);
      return;
    }
    while (mounted &&
        _scrollController.hasClients &&
        _autoScrollController.started) {
      await _waitWithCancel(widget.startPauseDuration);
      if (!mounted) break;
      if (_scrollController.hasClients &&
          _autoScrollController.started &&
          _scrollController.offset == 0) {
        await _scrollController.animateTo(
          maxScrollExtent,
          duration: scrollDuration,
          curve: widget.primaryCurve,
        );
      }
      if (!mounted) break;
      if (_scrollController.hasClients &&
          _autoScrollController.started &&
          _scrollController.offset == maxScrollExtent) {
        await _waitWithCancel(
          widget.endPauseDuration ?? widget.startPauseDuration,
        );
      }
      if (!mounted) break;
      if (_scrollController.hasClients &&
          _scrollController.offset == maxScrollExtent) {
        await _scrollController.animateTo(
          0.0,
          duration: widget.returnDuration,
          curve: widget.returnCurve,
        );
      }
    }
  }
}

class TickerTextController extends ChangeNotifier {
  TickerTextController({bool autoStart = false}) : _started = autoStart;
  bool _started;

  bool get started => _started;

  void startScroll() {
    _started = true;
    notifyListeners();
  }

  void stopScroll() {
    _started = false;
    notifyListeners();
  }
}
