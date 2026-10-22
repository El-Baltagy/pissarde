import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class RecentRequestsCardWidget extends StatelessWidget {
  const RecentRequestsCardWidget({super.key});

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
          _buildRequestItem(
            titleKey: 'req_departure_edit',
            descKey: 'req_departure_desc',
            dateKey: 'date_14_may',
            statusKey: 'status_under_review',
            statusBgColor: AppColors.tagReviewBg,
            statusTextColor: AppColors.tagReviewText,
          ),
          10.verticalSpace,
          _buildRequestItem(
            titleKey: 'req_permission_2h',
            descKey: 'req_permission_desc',
            dateKey: 'date_10_may',
            statusKey: 'status_approved',
            statusBgColor: AppColors.tagApprovedBg,
            statusTextColor: AppColors.tagApprovedText,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    /// RTL-first: icon+title (right) → view all (left)
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.assignment_outlined,
              color: AppColors.headerBackground,
              size: AppSizes.s20,
            ),
            8.horizontalSpace,
            Text(
              'recent_requests_title'.tr(),
              style: AppTextStyles.font14Bold,
            ),
          ],
        ),
        Text(
          'view_all'.tr(),
          style: AppTextStyles.font12SemiBold.copyWith(
            color: AppColors.headerBackground,
          ),
        ),
      ],
    );
  }

  Widget _buildRequestItem({
    required String titleKey,
    required String descKey,
    required String dateKey,
    required String statusKey,
    required Color statusBgColor,
    required Color statusTextColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p12),
      decoration: BoxDecoration(
        color: AppColors.metricContainerBg,
        borderRadius: BorderRadius.circular(AppSizes.r12),
        border: Border.all(
          color: AppColors.metricBorder,
          width: AppSizes.s1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// RTL-first: title (right) → status badge (left)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p8,
                  vertical: AppPadding.p2,
                ),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(AppSizes.r8),
                ),
                child: Text(
                  statusKey.tr(),
                  style: AppTextStyles.font10SemiBold.copyWith(
                    color: statusTextColor,
                  ),
                ),
              ),
              Text(
                titleKey.tr(),
                style: AppTextStyles.font13Medium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          6.verticalSpace,
          Text(
            descKey.tr(),
            style: AppTextStyles.font11Regular,
            textAlign: TextAlign.start,
          ),
          6.verticalSpace,
          Text(
            dateKey.tr(),
            style: AppTextStyles.font10Regular,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
