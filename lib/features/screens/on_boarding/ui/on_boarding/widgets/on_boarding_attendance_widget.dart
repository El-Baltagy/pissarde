import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/constants/app_assets.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class OnBoardingAttendanceWidget extends StatelessWidget {
  final AnimationController animationController;

  const OnBoardingAttendanceWidget({super.key, required this.animationController});

  @override
  Widget build(BuildContext context) {
    final isRtl = context.locale.languageCode == 'ar';
    final exitOffset = isRtl ? const Offset(1, 0) : const Offset(-1, 0);

    final firstHalfAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );

    final secondHalfAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: exitOffset,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn),
      ),
    );

    final imageAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: exitOffset * 2,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn),
      ),
    );

    final titleAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );

    final textAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: exitOffset,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn),
      ),
    );

    return SlideTransition(
      position: firstHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.s100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideTransition(
                position: imageAnimation,
                child: Container(
                  height: 260,
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Image.asset(
                    AppAssets.imagesOnBoaringOnboarding1AttendanceTransparentPng,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              AppSizes.s32.verticalSpace,
              SlideTransition(
                position: titleAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                  child: Text(
                    'onboarding_slide1_title'.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font24Bold.copyWith(
                      color: AppColors.primaryLightColor,
                    ),
                  ),
                ),
              ),
              AppSizes.s12.verticalSpace,
              SlideTransition(
                position: textAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p32),
                  child: Text(
                    'onboarding_slide1_desc'.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14Regular.copyWith(
                      color: AppColors.lightTextSecondary,
                      height: 1.6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
