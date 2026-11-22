import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class OnBoardingNextButtonWidget extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onNextClick;

  const OnBoardingNextButtonWidget({
    super.key,
    required this.animationController,
    required this.onNextClick,
  });

  @override
  Widget build(BuildContext context) {
    final bottomMoveAnimation = Tween<Offset>(
      begin: const Offset(0, 4),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );

    final expandAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
      ),
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppPadding.p24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Page Dots Indicator
            SlideTransition(
              position: bottomMoveAnimation,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  final bool isVisible = animationController.value >= 0.15;
                  return AnimatedOpacity(
                    opacity: isVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: _buildPageIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(height: AppSizes.s16),
            // Floating Next / Get Started Action Button
            SlideTransition(
              position: bottomMoveAnimation,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  final isFinalSlide = expandAnimation.value > 0.65;
                  final double buttonWidth = 58.0 + (162.0 * expandAnimation.value);

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: AppSizes.s56,
                    width: buttonWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.r30),
                      color: AppColors.primaryLightColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryLightColor.withValues(alpha: 0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(AppSizes.r30),
                        onTap: onNextClick,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: isFinalSlide
                              ? Padding(
                                  key: const ValueKey('get_started_btn'),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'onboarding_get_started'.tr(),
                                        style: AppTextStyles.font16SemiBold.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: AppSizes.s8),
                                      const Icon(
                                        Icons.arrow_forward_rounded,
                                        color: Colors.white,
                                        size: AppSizes.s20,
                                      ),
                                    ],
                                  ),
                                )
                              : const Center(
                                  key: ValueKey('arrow_next_btn'),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: AppSizes.s20,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    int activeIndex = 0;
    final val = animationController.value;

    if (val >= 0.7) {
      activeIndex = 3;
    } else if (val >= 0.5) {
      activeIndex = 2;
    } else if (val >= 0.3) {
      activeIndex = 1;
    } else {
      activeIndex = 0;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        final bool isSelected = activeIndex == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
          height: AppSizes.s8,
          width: isSelected ? AppSizes.s24 : AppSizes.s8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.r4),
            color: isSelected ? AppColors.primaryLightColor : AppColors.lightBorder,
          ),
        );
      }),
    );
  }
}
