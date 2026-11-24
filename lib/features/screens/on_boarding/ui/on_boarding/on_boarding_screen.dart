import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/app.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/storage/hive_storage.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/features/screens/on_boarding/controller/on_boarding_cubit.dart';
import 'package:newf/features/screens/on_boarding/ui/on_boarding/widgets/on_boarding_attendance_widget.dart';
import 'package:newf/features/screens/on_boarding/ui/on_boarding/widgets/on_boarding_leaves_widget.dart';
import 'package:newf/features/screens/on_boarding/ui/on_boarding/widgets/on_boarding_next_button_widget.dart';
import 'package:newf/features/screens/on_boarding/ui/on_boarding/widgets/on_boarding_shifts_widget.dart';
import 'package:newf/features/screens/on_boarding/ui/on_boarding/widgets/on_boarding_splash_widget.dart';
import 'package:newf/features/screens/on_boarding/ui/on_boarding/widgets/on_boarding_top_bar_widget.dart';
import 'package:newf/features/screens/on_boarding/ui/on_boarding/widgets/on_boarding_welcome_widget.dart';

part 'on_boarding_base_state.dart';

@RoutePage()
class OnBoardingPage extends StatefulWidget implements AutoRouteWrapper {
  const OnBoardingPage({super.key, required this.args});
  final OnBoardingRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<OnBoardingCubit>(
      create: (context) => AppLocator()()(),
      child: this,
    );
  }

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends OnBoardingPageBaseState {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Onboarding screen',
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        body: ClipRect(
          child: Stack(
            children: [

              OnBoardingSplashWidget(
                animationController: animationController,
              ),

              OnBoardingAttendanceWidget(
                animationController: animationController,
              ),

              OnBoardingLeavesWidget(
                animationController: animationController,
              ),

              OnBoardingShiftsWidget(
                animationController: animationController,
              ),

              OnBoardingWelcomeWidget(
                animationController: animationController,
              ),

              OnBoardingTopBarWidget(
                animationController: animationController,
                onBackClick: onBackClick,
                onSkipClick: onSkipClick,
              ),

              OnBoardingNextButtonWidget(
                animationController: animationController,
                onNextClick: onNextClick,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
