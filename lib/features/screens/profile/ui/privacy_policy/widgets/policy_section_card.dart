import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

/// Card presenting one titled section of the privacy policy.
class PolicySectionCard extends StatelessWidget {
  const PolicySectionCard({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r10),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizes.s8,
        children: [
          Row(
            spacing: AppSizes.s8,
            children: [
              Container(
                width: AppSizes.s6,
                height: AppSizes.s6,
                decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.font14SemiBold.copyWith(
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          Text(
            body,
            style: AppTextStyles.font13Regular.copyWith(
              color: AppColors.contractorGreyText,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
