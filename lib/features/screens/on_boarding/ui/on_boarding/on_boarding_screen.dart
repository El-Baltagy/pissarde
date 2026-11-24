import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/app.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_assets.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/storage/hive_storage.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/features/screens/on_boarding/controller/on_boarding_cubit.dart';
import 'package:newf/features/screens/on_boarding/ui/on_boarding/widgets/on_boarding_next_button_widget.dart';
import 'package:newf/features/screens/on_boarding/ui/on_boarding/widgets/on_boarding_slide_widget.dart';
import 'package:newf/features/screens/on_boarding/ui/on_boarding/widgets/on_boarding_top_bar_widget.dart';

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
  static const List<OnBoardingSlideConfig> _slides = [
    OnBoardingSlideConfig(
      isSplash: true,
      imagePath: AppAssets.imagesLogoPng,
      titleKey: 'onboarding_splash_title',
      descriptionKey: 'onboarding_splash_desc',
      exitInterval: Interval(0.0, 0.2, curve: Curves.fastOutSlowIn),
      exitOffsetOverride: Offset(0.0, -1.0),
    ),
    OnBoardingSlideConfig(
      imagePath: AppAssets.imagesOnBoaringOnboarding1AttendanceTransparentPng,
      titleKey: 'onboarding_slide1_title',
      descriptionKey: 'onboarding_slide1_desc',
      enterInterval: Interval(0.0, 0.2, curve: Curves.fastOutSlowIn),
      exitInterval: Interval(0.2, 0.4, curve: Curves.fastOutSlowIn),
      enterOffsetOverride: Offset(0, 1),
      imageExitMultiplier: 2,
      titleEnterOffsetOverride: Offset(0, -1),
      descriptionExitMultiplier: 1,
    ),
    OnBoardingSlideConfig(
      imagePath: AppAssets.imagesOnBoaringOnboarding2LeavesTransparentPng,
      titleKey: 'onboarding_slide2_title',
      descriptionKey: 'onboarding_slide2_desc',
      enterInterval: Interval(0.2, 0.4, curve: Curves.fastOutSlowIn),
      exitInterval: Interval(0.4, 0.6, curve: Curves.fastOutSlowIn),
      imageEnterMultiplier: 3,
      imageExitMultiplier: 3,
      titleEnterMultiplier: 2,
      titleExitMultiplier: 2,
    ),
    OnBoardingSlideConfig(
      imagePath: AppAssets.imagesOnBoaringOnboarding3ShiftsTransparentPng,
      titleKey: 'onboarding_slide3_title',
      descriptionKey: 'onboarding_slide3_desc',
      enterInterval: Interval(0.4, 0.6, curve: Curves.fastOutSlowIn),
      exitInterval: Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
      imageEnterMultiplier: 3,
      imageExitMultiplier: 3,
      titleEnterMultiplier: 2,
      titleExitMultiplier: 2,
    ),
    OnBoardingSlideConfig(
      imagePath:
          AppAssets.imagesOnBoaringOnboarding4NotificationsTransparentPng,
      titleKey: 'onboarding_slide4_title',
      descriptionKey: 'onboarding_slide4_desc',
      enterInterval: Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
      exitInterval: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
      imageEnterMultiplier: 3,
      titleEnterMultiplier: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Onboarding screen',
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        body: ClipRect(
          child: Stack(
            children: [
              for (final slide in _slides)
                OnBoardingSlideWidget(
                  animationController: animationController,
                  config: slide,
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
