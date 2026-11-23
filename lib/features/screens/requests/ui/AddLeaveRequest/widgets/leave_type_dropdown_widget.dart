import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/requests/data/model/get_leaves_types_res/get_leaves_types_res.dart';

class LeaveTypeDropdownWidget extends StatelessWidget {
  const LeaveTypeDropdownWidget({
    super.key,
    required this.leaveTypes,
    required this.selectedLeaveTypeId,
    required this.onChanged,
  });

  final List<LeaveTypeItem> leaveTypes;
  final int? selectedLeaveTypeId;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Leave type selection',
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.r14),
          border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizes.s8,
          children: [
            Row(
              spacing: AppSizes.s8,
              children: [
                Icon(
                  Icons.category_outlined,
                  size: AppSizes.s18,
                  color: context.theme.primaryColor,
                ),
                Text(
                  'leave_type'.tr(),
                  style: AppTextStyles.font14Bold,
                ),
              ],
            ),
            DropdownButtonFormField<int>(
              initialValue: selectedLeaveTypeId,
              dropdownColor: AppColors.cardBackground,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.metricContainerBg,
                hintText: 'leave_type'.tr(),
                hintStyle: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.lightTextSecondary,
                ),
                prefixIcon: Icon(
                  Icons.event_note_outlined,
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
              items: leaveTypes
                  .map(
                    (t) => DropdownMenuItem(
                      value: t.id,
                      child: Text(t.name, style: AppTextStyles.font14Regular),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
              validator: (val) => val == null ? 'leave_type_required'.tr() : null,
            ),
          ],
        ),
      ),
    );
  }
}
