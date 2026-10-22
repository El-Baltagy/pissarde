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
          _buildShiftHeaderRow(),
          14.verticalSpace,
          _buildDelayAlertBox(),
          14.verticalSpace,
          _buildShiftMetricsRow(),
          14.verticalSpace,
          _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _buildShiftHeaderRow() {
    /// RTL-first: shift name+icon (right) → hours (left)
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.storefront_rounded,
              color: AppColors.headerBackground,
              size: AppSizes.s20,
            ),
            8.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'current_shift_label'.tr(),
                  style: AppTextStyles.font11Regular,
                ),
                2.verticalSpace,
                Text(
                  'current_shift_name'.tr(),
                  style: AppTextStyles.font14Bold.copyWith(
                    color: AppColors.headerBackground,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'shift_hours_label'.tr(),
              style: AppTextStyles.font11Regular,
            ),
            2.verticalSpace,
            Text(
              'shift_hours_time'.tr(),
              style: AppTextStyles.font14Bold,
            ),
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
        border: Border.all(
          color: AppColors.alertWarningBorder,
          width: AppSizes.s1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// RTL-first: status dot + text (right) → badge (left)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: AppSizes.s8,
                    height: AppSizes.s8,
                    decoration: const BoxDecoration(
                      color: AppColors.statusLateText,
                      shape: BoxShape.circle,
                    ),
                  ),
                  6.horizontalSpace,
                  Text(
                    'shift_status_late_desc'.tr(),
                    style: AppTextStyles.font14Bold,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p8,
                  vertical: AppPadding.p2,
                ),
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
          6.verticalSpace,
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'delay_explanation'.tr(),
              style: AppTextStyles.font12Medium.copyWith(
                color: AppColors.alertWarningText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShiftMetricsRow() {
    /// RTL-first: check-in (right) → departure → work hours (left)
    return Row(
      children: [
        _buildMetricBox(
          label: 'check_in_time_label'.tr(),
          value: 'check_in_time_val'.tr(),
        ),
        8.horizontalSpace,
        _buildMetricBox(
          label: 'expected_departure_label'.tr(),
          value: 'expected_departure_val'.tr(),
        ),
        8.horizontalSpace,
        _buildMetricBox(
          label: 'work_hours_today_label'.tr(),
          value: 'work_hours_today_val'.tr(),
        ),
      ],
    );
  }

  Widget _buildMetricBox({
    required String label,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p10,
          horizontal: AppPadding.p6,
        ),
        decoration: BoxDecoration(
          color: AppColors.metricContainerBg,
          borderRadius: BorderRadius.circular(AppSizes.r12),
          border: Border.all(
            color: AppColors.metricBorder,
            width: AppSizes.s1,
          ),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: AppTextStyles.font10Regular,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            4.verticalSpace,
            Text(
              value,
              style: AppTextStyles.font14Bold,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// LTR-end / RTL-start: percentage
            Text(
              'daily_hours_completion'.tr(),
              style: AppTextStyles.font11Regular,
            ),
            Text(
              '65%',
              style: AppTextStyles.font12SemiBold,
            ),
          ],
        ),
        8.verticalSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.r8),
          child: LinearProgressIndicator(
            value: 0.65,
            minHeight: AppSizes.s8,
            backgroundColor: AppColors.metricBorder,
            valueColor: const AlwaysStoppedAnimation<Color>(
              AppColors.headerBackground,
            ),
          ),
        ),
      ],
    );
  }
}
