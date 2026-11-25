import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

/// Month switcher banner for filtering attendance history records.
class AttendanceHistoryMonthFilterWidget extends StatelessWidget {
  const AttendanceHistoryMonthFilterWidget({
    super.key,
    required this.selectedMonth,
    required this.onPreviousMonth,
    required this.onNextMonth,
  });

  final DateTime selectedMonth;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;

  @override
  Widget build(BuildContext context) {
    final label = DateFormat(
      'MMMM yyyy',
      context.locale.languageCode,
    ).format(selectedMonth);

    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppPadding.p16,
        AppPadding.p16,
        AppPadding.p16,
        0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
        vertical: AppPadding.p8,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r14),
        border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onPreviousMonth,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: context.theme.primaryColor,
            ),
          ),
          Row(
            spacing: AppSizes.s8,
            children: [
              Icon(
                Icons.calendar_month_outlined,
                size: AppSizes.s18,
                color: context.theme.primaryColor,
              ),
              Text(label, style: AppTextStyles.font14Bold),
            ],
          ),
          IconButton(
            onPressed: onNextMonth,
            icon: Icon(
              Icons.chevron_right_rounded,
              color: context.theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
