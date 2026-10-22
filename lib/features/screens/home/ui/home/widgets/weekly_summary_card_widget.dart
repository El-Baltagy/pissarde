import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class WeeklySummaryCardWidget extends StatelessWidget {
  const WeeklySummaryCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r16),
        border: Border.all(
          color: AppColors.cardBorder,
          width: AppSizes.s1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightBorder.withValues(alpha: 0.3),
            blurRadius: AppSizes.s8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderRow(),
          14.verticalSpace,
          _buildDaysRow(),
          16.verticalSpace,
          _buildMetricRow(
            labelKey: 'total_critical_month_delay',
            valueKey: 'delay_minutes_val',
            valueColor: AppColors.statusLateText,
          ),
          8.verticalSpace,
          _buildMetricRow(
            labelKey: 'overtime_hours_label',
            valueKey: 'overtime_hours_val',
            valueColor: AppColors.onlineGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    /// RTL-first: icon+title (right) → subtitle (left)
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.bar_chart_rounded,
              color: AppColors.headerBackground,
              size: AppSizes.s20,
            ),
            8.horizontalSpace,
            Text(
              'weekly_summary_title'.tr(),
              style: AppTextStyles.font14Bold,
            ),
          ],
        ),
        Text(
          'current_week_label'.tr(),
          style: AppTextStyles.font11Regular,
        ),
      ],
    );
  }

  Widget _buildDaysRow() {
    /// RTL-first: present → delayed → absent
    return Row(
      children: [
        _buildDayBox(
          count: '4',
          labelKey: 'days_present',
          bgColor: AppColors.statusPresentBg,
          textColor: AppColors.statusPresentText,
        ),
        10.horizontalSpace,
        _buildDayBox(
          count: '1',
          labelKey: 'days_delayed',
          bgColor: AppColors.statusLateBg,
          textColor: AppColors.statusLateText,
        ),
        10.horizontalSpace,
        _buildDayBox(
          count: '0',
          labelKey: 'days_absent',
          bgColor: AppColors.statusAbsentBg,
          textColor: AppColors.statusAbsentText,
        ),
      ],
    );
  }

  Widget _buildDayBox({
    required String count,
    required String labelKey,
    required Color bgColor,
    required Color textColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        child: Column(
          children: [
            Text(
              count,
              style: AppTextStyles.font18Bold.copyWith(
                color: textColor,
              ),
            ),
            4.verticalSpace,
            Text(
              labelKey.tr(),
              style: AppTextStyles.font12Medium.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow({
    required String labelKey,
    required String valueKey,
    required Color valueColor,
  }) {
    /// RTL-first: value (right) → label (left)
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelKey.tr(),
          style: AppTextStyles.font12Regular,
        ),
        Text(
          valueKey.tr(),
          style: AppTextStyles.font13Medium.copyWith(
            color: valueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
