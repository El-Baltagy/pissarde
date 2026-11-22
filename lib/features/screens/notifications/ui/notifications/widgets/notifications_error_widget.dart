import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class NotificationsErrorWidget extends StatelessWidget {
  const NotificationsErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppPadding.p32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSizes.s16,
          children: [
            Container(
              width: AppSizes.s80,
              height: AppSizes.s80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.statusAbsentBg,
              ),
              child: const Icon(
                Icons.error_outline_rounded,
                color: AppColors.statusAbsentText,
                size: AppSizes.s40,
              ),
            ),
            Text(
              'notifications_error_title'.tr(),
              style: AppTextStyles.font16Bold.copyWith(
                color: AppColors.lightTextPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              message,
              style: AppTextStyles.font12Regular.copyWith(
                color: AppColors.statusAbsentText,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.headerBackground,
                foregroundColor: AppColors.roleSwitchSelectedBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.r12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20,
                  vertical: AppPadding.p10,
                ),
              ),
              icon: const Icon(Icons.refresh_rounded, size: AppSizes.s18),
              label: Text(
                'notifications_retry'.tr(),
                style: AppTextStyles.font14Medium.copyWith(
                  color: AppColors.roleSwitchSelectedBg,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
