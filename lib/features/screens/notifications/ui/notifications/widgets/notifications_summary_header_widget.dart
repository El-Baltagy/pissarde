import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class NotificationsSummaryHeaderWidget extends StatelessWidget {
  const NotificationsSummaryHeaderWidget({
    super.key,
    required this.total,
  });

  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p12,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r14),
        border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightBorder.withValues(alpha: 0.3),
            blurRadius: AppSizes.s8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: AppSizes.s8,
            children: [
              Container(
                padding: const EdgeInsets.all(AppPadding.p6),
                decoration: BoxDecoration(
                  color: AppColors.policyCardBg,
                  borderRadius: BorderRadius.circular(AppSizes.r8),
                ),
                child: const Icon(
                  Icons.notifications_active_outlined,
                  color: AppColors.headerBackground,
                  size: AppSizes.s18,
                ),
              ),
              Text(
                'notifications_total_count'.tr(args: [total.toString()]),
                style: AppTextStyles.font13Medium.copyWith(
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p10,
              vertical: AppPadding.p4,
            ),
            decoration: BoxDecoration(
              color: AppColors.statusPresentBg,
              borderRadius: BorderRadius.circular(AppSizes.r12),
            ),
            child: Row(
              spacing: AppSizes.s4,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: AppSizes.s6,
                  height: AppSizes.s6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.onlineGreen,
                  ),
                ),
                Text(
                  'notifications_new_badge'.tr(),
                  style: AppTextStyles.font10SemiBold.copyWith(
                    color: AppColors.statusPresentText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
