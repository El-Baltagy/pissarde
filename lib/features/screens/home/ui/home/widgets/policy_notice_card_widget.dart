import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class PolicyNoticeCardWidget extends StatelessWidget {
  const PolicyNoticeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      padding: const EdgeInsets.all(AppPadding.p14),
      decoration: BoxDecoration(
        color: AppColors.policyCardBg,
        borderRadius: BorderRadius.circular(AppSizes.r14),
        border: Border.all(
          color: AppColors.policyCardBorder,
          width: AppSizes.s1,
        ),
      ),
      child: Column(
        spacing: AppSizes.s8,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// RTL-first: icon (right) → title (left)
          Row(
            spacing: AppSizes.s6,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.info_outline_rounded,
                color: AppColors.policyCardText,
                size: AppSizes.s18,
              ),
              Text(
                'policy_title'.tr(),
                style: AppTextStyles.font13Medium.copyWith(
                  color: AppColors.policyCardText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            'policy_content'.tr(),
            style: AppTextStyles.font11Regular.copyWith(
              color: AppColors.policyCardText,
              height: 1.5,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
