import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class BranchStatusCardWidget extends StatelessWidget {
  const BranchStatusCardWidget({super.key});

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
          _buildStatusMetricsRow(),
          14.verticalSpace,
          _buildPendingApprovalNotice(),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p10,
            vertical: AppPadding.p4,
          ),
          decoration: BoxDecoration(
            color: AppColors.commitmentBadgeBg,
            borderRadius: BorderRadius.circular(AppSizes.r20),
          ),
          child: Text(
            'commitment_rate'.tr(),
            style: AppTextStyles.font11Regular.copyWith(
              color: AppColors.commitmentBadgeText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'branch_status_title'.tr(),
                  style: AppTextStyles.font14Bold,
                ),
                2.verticalSpace,
                Text(
                  'branch_total_employees'.tr(),
                  style: AppTextStyles.font11Regular,
                ),
              ],
            ),
            10.horizontalSpace,
            Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                color: AppColors.roleSwitchBg,
                borderRadius: BorderRadius.circular(AppSizes.r12),
              ),
              child: const Icon(
                Icons.groups_rounded,
                color: AppColors.headerBackground,
                size: AppSizes.s20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusMetricsRow() {
    return Row(
      children: [
        _buildMetricBox(
          count: '2',
          labelKey: 'status_leave',
          bgColor: AppColors.statusLeaveBg,
          textColor: AppColors.statusLeaveText,
        ),
        8.horizontalSpace,
        _buildMetricBox(
          count: '3',
          labelKey: 'status_absent',
          bgColor: AppColors.statusAbsentBg,
          textColor: AppColors.statusAbsentText,
        ),
        8.horizontalSpace,
        _buildMetricBox(
          count: '5',
          labelKey: 'status_late',
          bgColor: AppColors.statusLateBg,
          textColor: AppColors.statusLateText,
        ),
        8.horizontalSpace,
        _buildMetricBox(
          count: '38',
          labelKey: 'status_present',
          bgColor: AppColors.statusPresentBg,
          textColor: AppColors.statusPresentText,
        ),
      ],
    );
  }

  Widget _buildMetricBox({
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

  Widget _buildPendingApprovalNotice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'review_requests'.tr(),
          style: AppTextStyles.font12SemiBold.copyWith(
            color: AppColors.headerBackground,
            decoration: TextDecoration.underline,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'pending_fingerprint_requests'.tr(),
              style: AppTextStyles.font12Medium.copyWith(
                color: AppColors.alertWarningText,
              ),
            ),
            6.horizontalSpace,
            const Icon(
              Icons.warning_amber_rounded,
              color: AppColors.statusLateText,
              size: AppSizes.s18,
            ),
          ],
        ),
      ],
    );
  }
}
