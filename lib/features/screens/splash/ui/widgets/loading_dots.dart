import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_values.dart';

class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  State<LoadingDots> createState() => LoadingDotsState();
}

class LoadingDotsState extends State<LoadingDots>
    with TickerProviderStateMixin {
  late List<AnimationController> _dotControllers;
  late List<Animation<double>> _dotAnims;
  final List<Timer> _timers = [];

  @override
  void initState() {
    super.initState();
    _dotControllers = List.generate(
      3,
      (i) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      ),
    );
    _dotAnims = _dotControllers
        .map((c) => Tween<double>(begin: 0.0, end: -10.0).animate(
              CurvedAnimation(parent: c, curve: Curves.easeInOut),
            ))
        .toList();

    // Start each dot with a staggered delay
    for (int i = 0; i < 3; i++) {
      final timer = Timer(Duration(milliseconds: i * 180), () {
        if (mounted) {
          _dotControllers[i].repeat(reverse: true);
        }
      });
      _timers.add(timer);
    }
  }

  @override
  void dispose() {
    for (final timer in _timers) {
      timer.cancel();
    }
    for (var c in _dotControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: AppSizes.s8,
      children: List.generate(3, (i) {
        return AnimatedBuilder(
          animation: _dotAnims[i],
          builder: (_, __) => Transform.translate(
            offset: Offset(0, _dotAnims[i].value),
            child: Container(
              width: AppSizes.s8,
              height: AppSizes.s8,
              decoration: BoxDecoration(
                color: i == 1
                    ? AppColors.primaryGoldStart
                    : Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      }),
    );
  }
}
