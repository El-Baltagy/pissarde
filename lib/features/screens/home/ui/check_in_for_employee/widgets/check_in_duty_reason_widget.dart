import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

/// Card containing an optional duty reason input field.
class CheckInDutyReasonWidget extends StatelessWidget {
  const CheckInDutyReasonWidget({
    super.key,
    required this.controllerDutyReason,
  });

  final TextEditingController controllerDutyReason;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r14),
        border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizes.s12,
        children: [
          Row(
            spacing: AppSizes.s8,
            children: [
              Icon(
                Icons.notes_outlined,
                size: AppSizes.s18,
                color: context.theme.primaryColor,
              ),
              Text(
                'duty_reason'.tr(),
                style: AppTextStyles.font14Bold,
              ),
            ],
          ),
          TextFormField(
            controller: controllerDutyReason,
            maxLines: 2,
            style: AppTextStyles.font14Regular,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.metricContainerBg,
              hintText: 'duty_reason'.tr(),
              hintStyle: AppTextStyles.font14Regular.copyWith(
                color: AppColors.lightTextSecondary,
              ),
              contentPadding: const EdgeInsets.all(AppPadding.p12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.r10),
                borderSide: const BorderSide(color: AppColors.cardBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.r10),
                borderSide: const BorderSide(color: AppColors.cardBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.r10),
                borderSide: BorderSide(
                  color: context.theme.primaryColor,
                  width: AppSizes.s1_5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
