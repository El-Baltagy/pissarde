import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class CurrentShiftCardWidget extends StatelessWidget {
  const CurrentShiftCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r16),
        border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightBorder.withValues(alpha: 0.3),
            blurRadius: AppSizes.s8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        spacing: AppSizes.s14,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildShiftHeaderRow(),
          _buildDelayAlertBox(),
          _buildShiftMetricsRow(),
          _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _buildShiftHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// RTL-first: icon + shift name (right)
        Row(
          spacing: AppSizes.s8,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.storefront_rounded, color: AppColors.headerBackground, size: AppSizes.s20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('current_shift_label'.tr(), style: AppTextStyles.font11Regular),
                Text(
                  'current_shift_name'.tr(),
                  style: AppTextStyles.font14Bold.copyWith(color: AppColors.headerBackground),
                ),
              ],
            ),
          ],
        ),
        /// hours (left)
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('shift_hours_label'.tr(), style: AppTextStyles.font11Regular),
            Text('shift_hours_time'.tr(), style: AppTextStyles.font14Bold),
          ],
        ),
      ],
    );
  }

  Widget _buildDelayAlertBox() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p12),
      decoration: BoxDecoration(
        color: AppColors.alertWarningBg,
        borderRadius: BorderRadius.circular(AppSizes.r12),
        border: Border.all(color: AppColors.alertWarningBorder, width: AppSizes.s1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSizes.s6,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// RTL-first: dot + text (right)
              Row(
                spacing: AppSizes.s6,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: AppSizes.s8,
                    height: AppSizes.s8,
                    decoration: const BoxDecoration(color: AppColors.statusLateText, shape: BoxShape.circle),
                  ),
                  Text('shift_status_late_desc'.tr(), style: AppTextStyles.font14Bold),
                ],
              ),
              /// badge (left)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p2),
                decoration: BoxDecoration(
                  color: AppColors.statusLateBg,
                  borderRadius: BorderRadius.circular(AppSizes.r8),
                ),
                child: Text(
                  'badge_delay'.tr(),
                  style: AppTextStyles.font11Regular.copyWith(
                    color: AppColors.statusLateText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'delay_explanation'.tr(),
              style: AppTextStyles.font12Medium.copyWith(color: AppColors.alertWarningText),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShiftMetricsRow() {
    return Row(
      spacing: AppSizes.s8,
      children: [
        _buildMetricBox(label: 'check_in_time_label'.tr(), value: 'check_in_time_val'.tr()),
        _buildMetricBox(label: 'expected_departure_label'.tr(), value: 'expected_departure_val'.tr()),
        _buildMetricBox(label: 'work_hours_today_label'.tr(), value: 'work_hours_today_val'.tr()),
      ],
    );
  }

  Widget _buildMetricBox({required String label, required String value}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p10, horizontal: AppPadding.p6),
        decoration: BoxDecoration(
          color: AppColors.metricContainerBg,
          borderRadius: BorderRadius.circular(AppSizes.r12),
          border: Border.all(color: AppColors.metricBorder, width: AppSizes.s1),
        ),
        child: Column(
          spacing: AppSizes.s4,
          children: [
            Text(label, style: AppTextStyles.font10Regular, textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(value, style: AppTextStyles.font14Bold, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      spacing: AppSizes.s8,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('daily_hours_completion'.tr(), style: AppTextStyles.font11Regular),
            Text('65%', style: AppTextStyles.font12SemiBold),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.r8),
          child: LinearProgressIndicator(
            value: 0.65,
            minHeight: AppSizes.s8,
            backgroundColor: AppColors.metricBorder,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.headerBackground),
          ),
        ),
      ],
    );
  }
}
