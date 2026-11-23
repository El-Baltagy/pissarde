import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class LeaveDatePickerWidget extends StatelessWidget {
  const LeaveDatePickerWidget({
    super.key,
    required this.controllerStartDate,
    required this.controllerEndDate,
    required this.onPickStartDate,
    required this.onPickEndDate,
  });

  final TextEditingController controllerStartDate;
  final TextEditingController controllerEndDate;
  final VoidCallback onPickStartDate;
  final VoidCallback onPickEndDate;

  int? get _calculateDurationDays {
    final start = DateTime.tryParse(controllerStartDate.text);
    final end = DateTime.tryParse(controllerEndDate.text);
    if (start != null && end != null && !end.isBefore(start)) {
      return end.difference(start).inDays + 1;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final duration = _calculateDurationDays;

    return Semantics(
      label: 'Leave date range selection',
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.r14),
          border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizes.s14,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: AppSizes.s8,
                  children: [
                    Icon(
                      Icons.date_range_outlined,
                      size: AppSizes.s18,
                      color: context.theme.primaryColor,
                    ),
                    Text(
                      'shift_hours_label'.tr(),
                      style: AppTextStyles.font14Bold,
                    ),
                  ],
                ),
                if (duration != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p8,
                      vertical: AppPadding.p4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.statusLeaveBg,
                      borderRadius: BorderRadius.circular(AppSizes.r8),
                    ),
                    child: Text(
                      'leave_duration_days'.tr(args: [duration.toString()]),
                      style: AppTextStyles.font11Bold.copyWith(
                        color: AppColors.statusLeaveText,
                      ),
                    ),
                  ),
              ],
            ),
            // Start Date Field
            _buildDateField(
              context: context,
              label: 'start_date'.tr(),
              controller: controllerStartDate,
              onTap: onPickStartDate,
              validator: (val) =>
                  (val == null || val.isEmpty) ? 'start_date_required'.tr() : null,
            ),
            // End Date Field
            _buildDateField(
              context: context,
              label: 'end_date'.tr(),
              controller: controllerEndDate,
              onTap: onPickEndDate,
              validator: (val) =>
                  (val == null || val.isEmpty) ? 'end_date_required'.tr() : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField({
    required BuildContext context,
    required String label,
    required TextEditingController controller,
    required VoidCallback onTap,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizes.s6,
      children: [
        Text(
          label,
          style: AppTextStyles.font12Regular.copyWith(
            color: AppColors.lightTextSecondary,
          ),
        ),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: onTap,
          style: AppTextStyles.font14Regular,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.metricContainerBg,
            hintText: 'YYYY-MM-DD',
            hintStyle: AppTextStyles.font14Regular.copyWith(
              color: AppColors.lightTextSecondary,
            ),
            prefixIcon: Icon(
              Icons.calendar_month_outlined,
              size: AppSizes.s20,
              color: context.theme.primaryColor,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p14,
              vertical: AppPadding.p12,
            ),
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
          validator: validator,
        ),
      ],
    );
  }
}
