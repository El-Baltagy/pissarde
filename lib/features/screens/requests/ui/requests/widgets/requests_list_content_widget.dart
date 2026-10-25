import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class RequestsListContentWidget extends StatelessWidget {
  const RequestsListContentWidget({super.key});

  static const _requests = [
    (
      titleKey: 'req_departure_edit',
      descKey: 'req_departure_desc',
      dateKey: 'date_14_may',
      statusKey: 'status_under_review',
      statusBgColor: AppColors.tagReviewBg,
      statusTextColor: AppColors.tagReviewText,
    ),
    (
      titleKey: 'req_permission_2h',
      descKey: 'req_permission_desc',
      dateKey: 'date_10_may',
      statusKey: 'status_approved',
      statusBgColor: AppColors.tagApprovedBg,
      statusTextColor: AppColors.tagApprovedText,
    ),
    (
      titleKey: 'btn_request_correction',
      descKey: 'req_fingerprint_unresponsive',
      dateKey: 'date_05_may',
      statusKey: 'status_approved',
      statusBgColor: AppColors.tagApprovedBg,
      statusTextColor: AppColors.tagApprovedText,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSizes.s12,
        children: [
          _buildCreateRequestBanner(),
          ..._requests.map(
            (req) => _buildRequestCard(
              titleKey: req.titleKey,
              descKey: req.descKey,
              dateKey: req.dateKey,
              statusKey: req.statusKey,
              statusBgColor: req.statusBgColor,
              statusTextColor: req.statusTextColor,
            ),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: AppSizes.s2,
            children: [
              Text(
                'requests_and_justifications'.tr(),
                style: AppTextStyles.font16Bold.copyWith(
                  color: AppColors.roleSwitchSelectedBg,
                ),
              ),
              Text(
                'tracking_order_status_and_credit_details'.tr(),
                style: AppTextStyles.font11Regular.copyWith(
                  color: AppColors.darkTextSecondary,
                ),
              ),
            ],
          ),
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
              'new_request'.tr(),
              style: AppTextStyles.font13Medium.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.headerBackground,
              ),
            ),
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
        spacing: AppSizes.s6,
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
          Text(
            descKey.tr(),
            style: AppTextStyles.font11Regular,
            textAlign: TextAlign.start,
          ),
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
