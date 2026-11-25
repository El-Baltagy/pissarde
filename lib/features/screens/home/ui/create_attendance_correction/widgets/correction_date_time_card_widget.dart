import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

/// Card containing date, requested check-in, and requested check-out pickers.
class CorrectionDateTimeCardWidget extends StatelessWidget {
  const CorrectionDateTimeCardWidget({
    super.key,
    required this.controllerDate,
    required this.controllerCheckIn,
    required this.controllerCheckOut,
    required this.onPickDate,
    required this.onPickCheckIn,
    required this.onPickCheckOut,
  });

  final TextEditingController controllerDate;
  final TextEditingController controllerCheckIn;
  final TextEditingController controllerCheckOut;
  final VoidCallback onPickDate;
  final VoidCallback onPickCheckIn;
  final VoidCallback onPickCheckOut;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Correction date and time selection',
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
              spacing: AppSizes.s8,
              children: [
                Icon(
                  Icons.access_time_outlined,
                  size: AppSizes.s18,
                  color: context.theme.primaryColor,
                ),
                Text(
                  'shift_hours_label'.tr(),
                  style: AppTextStyles.font14Bold,
                ),
              ],
            ),
            _buildPickerField(
              context: context,
              label: 'correction_date'.tr(),
              icon: Icons.calendar_today_outlined,
              controller: controllerDate,
              onTap: onPickDate,
              validator: (val) => (val == null || val.isEmpty)
                  ? 'correction_date_required'.tr()
                  : null,
            ),
            Row(
              spacing: AppSizes.s12,
              children: [
                Expanded(
                  child: _buildPickerField(
                    context: context,
                    label: 'requested_check_in'.tr(),
                    icon: Icons.login_rounded,
                    controller: controllerCheckIn,
                    onTap: onPickCheckIn,
                    validator: (val) => (val == null || val.isEmpty)
                        ? 'requested_check_in_required'.tr()
                        : null,
                  ),
                ),
                Expanded(
                  child: _buildPickerField(
                    context: context,
                    label: 'requested_check_out'.tr(),
                    icon: Icons.logout_rounded,
                    controller: controllerCheckOut,
                    onTap: onPickCheckOut,
                    validator: (val) => (val == null || val.isEmpty)
                        ? 'requested_check_out_required'.tr()
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPickerField({
    required BuildContext context,
    required String label,
    required IconData icon,
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
          validator: validator,
          style: AppTextStyles.font14Regular,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.metricContainerBg,
            hintText: label,
            hintStyle: AppTextStyles.font13Regular.copyWith(
              color: AppColors.lightTextSecondary,
            ),
            suffixIcon: Icon(
              icon,
              size: AppSizes.s18,
              color: context.theme.primaryColor,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
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
        ),
      ],
    );
  }
}
