import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

/// Card containing the duty reason input field.
/// - Required (button disabled when empty).
/// - Max 8 characters.
/// - Notifies [dutyReasonNotifier] on every change so the button can react.
class CheckInDutyReasonWidget extends StatelessWidget {
  const CheckInDutyReasonWidget({
    super.key,
    required this.controllerDutyReason,
    required this.dutyReasonNotifier,
  });

  final TextEditingController controllerDutyReason;
  final ValueNotifier<String> dutyReasonNotifier;

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
              Text(
                '*',
                style: AppTextStyles.font14Bold.copyWith(color: AppColors.notificationRed),
              ),
            ],
          ),
          ValueListenableBuilder<String>(
            valueListenable: dutyReasonNotifier,
            builder: (context, value, _) {
              return TextFormField(
                controller: controllerDutyReason,
                maxLines: 2,
                maxLength: 30,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                style: AppTextStyles.font14Regular,
                onChanged: (v) => dutyReasonNotifier.value = v.trim(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.metricContainerBg,
                  hintText: 'duty_reason'.tr(),
                  hintStyle: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.lightTextSecondary,
                  ),
                  counterStyle: AppTextStyles.font11Regular.copyWith(
                    color: value.isNotEmpty
                        ? AppColors.lightTextSecondary
                        : AppColors.notificationRed,
                  ),
                  contentPadding: const EdgeInsets.all(AppPadding.p12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.r10),
                    borderSide: const BorderSide(color: AppColors.cardBorder),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.r10),
                    borderSide: BorderSide(
                      color: value.isEmpty ? AppColors.notificationRed : AppColors.cardBorder,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.r10),
                    borderSide: BorderSide(
                      color: context.theme.primaryColor,
                      width: AppSizes.s1_5,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
