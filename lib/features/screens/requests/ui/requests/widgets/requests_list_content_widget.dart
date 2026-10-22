import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class RequestsListContentWidget extends StatelessWidget {
  const RequestsListContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCreateRequestBanner(),
          16.verticalSpace,
          _buildRequestCard(
            titleKey: 'req_departure_edit',
            descKey: 'req_departure_desc',
            dateKey: 'date_14_may',
            statusKey: 'status_under_review',
            statusBgColor: AppColors.tagReviewBg,
            statusTextColor: AppColors.tagReviewText,
          ),
          12.verticalSpace,
          _buildRequestCard(
            titleKey: 'req_permission_2h',
            descKey: 'req_permission_desc',
            dateKey: 'date_10_may',
            statusKey: 'status_approved',
            statusBgColor: AppColors.tagApprovedBg,
            statusTextColor: AppColors.tagApprovedText,
          ),
          12.verticalSpace,
          _buildRequestCard(
            titleKey: 'btn_request_correction',
            descKey: 'req_fingerprint_unresponsive',
            dateKey: 'date_05_may',
            statusKey: 'status_approved',
            statusBgColor: AppColors.tagApprovedBg,
            statusTextColor: AppColors.tagApprovedText,
          ),
        ],
      ),
    );
  }

  Widget _buildCreateRequestBanner() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.headerBackground,
        borderRadius: BorderRadius.circular(AppSizes.r16),
      ),
      /// RTL-first: text block (right) → button (left)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.roleSwitchSelectedBg,
              foregroundColor: AppColors.headerBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.r12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p14,
                vertical: AppPadding.p8,
              ),
            ),
            icon: const Icon(Icons.add, size: AppSizes.s18),
            label: Text(
              'طلب جديد',
              style: AppTextStyles.font13Medium.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.headerBackground,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'الطلبات والتبريرات',
                style: AppTextStyles.font16Bold.copyWith(
                  color: AppColors.roleSwitchSelectedBg,
                ),
              ),
              2.verticalSpace,
              Text(
                'متابعة حالة الطلبات وتفاصيل الاعتماد',
                style: AppTextStyles.font11Regular.copyWith(
                  color: AppColors.darkTextSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRequestCard({
    required String titleKey,
    required String descKey,
    required String dateKey,
    required String statusKey,
    required Color statusBgColor,
    required Color statusTextColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r12),
        border: Border.all(
          color: AppColors.cardBorder,
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
