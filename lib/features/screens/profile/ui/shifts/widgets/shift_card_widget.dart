import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/data/model/shifts/get_all_shifts_res/get_all_shifts_res.dart';
import 'package:newf/core/extension/context.dart';

import '../../../../../../core/shared/methods/date_helper.dart';

/// Displays summary information for a single shift.
class ShiftCardWidget extends StatelessWidget {
  const ShiftCardWidget({super.key, required this.shift});

  final ShiftItem shift;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Shift card for ${shift.name}',
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.r14),
          border:
              Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizes.s10,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    color: AppColors.roleSwitchBg,
                    borderRadius: BorderRadius.circular(AppSizes.r10),
                  ),
                  child:   Icon(
                    Icons.access_time_outlined,
                    color: context.theme.primaryColor,
                    size: AppSizes.s20,
                  ),
                ),
                const SizedBox(width: AppSizes.s12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSizes.s2,
                    children: [
                      Text(shift.name, style: AppTextStyles.font14Bold),
                      Text(shift.code,
                          style: AppTextStyles.font12Regular),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p8,
                      vertical: AppPadding.p4),
                  decoration: BoxDecoration(
                    color: shift.is_active
                        ? AppColors.statusPresentBg
                        : AppColors.statusAbsentBg,
                    borderRadius: BorderRadius.circular(AppSizes.r8),
                  ),
                  child: Text(
                    shift.is_active ? 'active'.tr() : 'inactive'.tr(),
                    style: AppTextStyles.font11Bold.copyWith(
                      color: shift.is_active
                          ? AppColors.statusPresentText
                          : AppColors.statusAbsentText,
                    ),
                  ),
                ),
              ],
            ),
            _buildWorkingDays(context),

            Row(
              spacing: AppSizes.s16,
              children: [
                _timeChip(Icons.login_rounded, DateTimeHelper.toHourMinute(shift.start_time)  ),
                _timeChip(Icons.logout_rounded, DateTimeHelper.toHourMinute(shift.end_time)),
                if (shift.employees_count != null)
                  _timeChip(Icons.people_outline,
                      '${shift.employees_count}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkingDays(BuildContext context) {
    if (shift.working_days.isEmpty) return const SizedBox.shrink();

    final currentLocale = context.locale.languageCode;
    final sortedDays = List<int>.from(shift.working_days)..sort();

    return Wrap(
      spacing: AppSizes.s6,
      runSpacing: AppSizes.s4,
      children: sortedDays.map((day) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
            vertical: AppPadding.p2,
          ),
          decoration: BoxDecoration(
            color: context.theme.primaryColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(AppSizes.r6),
            border: Border.all(
              color: context.theme.primaryColor.withValues(alpha: 0.25),
              width: AppSizes.s1,
            ),
          ),
          child: Text(
            DateTimeHelper.getWeekdayName(day, locale: currentLocale),
            style: AppTextStyles.font11Bold.copyWith(
              color: context.theme.primaryColor,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _timeChip(IconData icon, String text) {
    return Row(
      spacing: AppSizes.s4,
      children: [
        Icon(icon,
            size: AppSizes.s14, color: AppColors.contractorGreyText),
        Text(text, style: AppTextStyles.font12Regular),
      ],
    );
  }
}
