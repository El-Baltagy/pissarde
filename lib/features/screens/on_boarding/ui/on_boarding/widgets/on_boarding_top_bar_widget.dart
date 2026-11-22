import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class OnBoardingTopBarWidget extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onBackClick;
  final VoidCallback onSkipClick;

  const OnBoardingTopBarWidget({
    super.key,
    required this.animationController,
    required this.onBackClick,
    required this.onSkipClick,
  });

  @override
  Widget build(BuildContext context) {
    final topBarEnterAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );

    final skipFadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
      ),
    );

    return SlideTransition(
      position: topBarEnterAnimation,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onBackClick,
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.primaryLightColor,
                  size: AppSizes.s20,
                ),
                tooltip: 'Back',
              ),
              AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: skipFadeAnimation.value.clamp(0.0, 1.0),
                    child: skipFadeAnimation.value > 0.05
                        ? TextButton(
                            onPressed: onSkipClick,
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.lightTextSecondary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p12,
                                vertical: AppPadding.p6,
                              ),
                            ),
                            child: Text(
                              'onboarding_skip'.tr(),
                              style: AppTextStyles.font14Medium.copyWith(
                                color: AppColors.lightTextSecondary,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
