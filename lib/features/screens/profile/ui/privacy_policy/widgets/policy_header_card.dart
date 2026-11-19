import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

/// Header card showing the policy title and its last update date.
class PolicyHeaderCard extends StatelessWidget {
  const PolicyHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r10),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        spacing: AppSizes.s14,
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p12),
            decoration: BoxDecoration(
              color: AppColors.roleSwitchBg,
              borderRadius: BorderRadius.circular(AppSizes.r10),
            ),
            child: Icon(
              Icons.privacy_tip_outlined,
              color: context.theme.primaryColor,
              size: AppSizes.s28,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSizes.s4,
              children: [
                Text(
                  'privacy_policy'.tr(),
                  style: AppTextStyles.font16Bold.copyWith(
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                Row(
                  spacing: AppSizes.s6,
                  children: [
                    Text(
                      'last_updated'.tr(),
                      style: AppTextStyles.font12Regular.copyWith(
                        color: AppColors.contractorGreyText,
                      ),
                    ),
                    Text(
                      'january_1_2026'.tr(),
                      style: AppTextStyles.font12Medium.copyWith(
                        color: AppColors.contractorGreyText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
