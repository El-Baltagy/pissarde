import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/constants/app_assets.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class OnBoardingSplashWidget extends StatelessWidget {
  final AnimationController animationController;

  const OnBoardingSplashWidget({super.key, required this.animationController});

  @override
  Widget build(BuildContext context) {
    final introductionAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0.0, -1.0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );

    return SlideTransition(
      position: introductionAnimation,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: 140,
                height: 140,
                padding: const EdgeInsets.all(AppPadding.p20),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryLightColor.withValues(alpha: 0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Image.asset(
                  AppAssets.imagesLogoPng,
                  fit: BoxFit.contain,
                ),
              ),
              AppSizes.s32.verticalSpace,
              Text(
                'onboarding_splash_title'.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.font24Bold.copyWith(
                  color: AppColors.primaryLightColor,
                ),
              ),
              AppSizes.s12.verticalSpace,
              Text(
                'onboarding_splash_desc'.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.lightTextSecondary,
                  height: 1.6,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p32),
                child: SizedBox(
                  width: double.infinity,
                  height: AppSizes.s56,
                  child: ElevatedButton(
                    onPressed: () {
                      animationController.animateTo(
                        0.2,
                        duration: const Duration(milliseconds: 600),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryLightColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.r30),
                      ),
                    ),
                    child: Text(
                      'onboarding_lets_begin'.tr(),
                      style: AppTextStyles.font16SemiBold.copyWith(
                        color: Colors.white,
                      ),
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
