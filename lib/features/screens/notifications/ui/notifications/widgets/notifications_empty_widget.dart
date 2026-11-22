import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class NotificationsEmptyWidget extends StatelessWidget {
  const NotificationsEmptyWidget({
    super.key,
    required this.onRefresh,
  });

  final VoidCallback onRefresh;

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
                color: AppColors.policyCardBg,
              ),
              child: const Icon(
                Icons.notifications_off_outlined,
                color: AppColors.headerBackground,
                size: AppSizes.s40,
              ),
            ),
            Text(
              'notifications_empty_title'.tr(),
              style: AppTextStyles.font16Bold.copyWith(
                color: AppColors.lightTextPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'notifications_empty_desc'.tr(),
              style: AppTextStyles.font12Regular.copyWith(
                color: AppColors.contractorGreyText,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: onRefresh,
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
