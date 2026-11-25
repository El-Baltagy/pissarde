import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/data/model/history_attendacne_res/history_attendacne_res.dart';

/// Card displaying a single attendance history record.
class AttendanceHistoryCardWidget extends StatelessWidget {
  const AttendanceHistoryCardWidget({super.key, required this.item});

  final DataItem item;

  @override
  Widget build(BuildContext context) {
    final isLate = item.late_minutes > 0;

    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r14),
        border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizes.s12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: AppSizes.s8,
                children: [
                  Icon(
                    Icons.event_available_outlined,
                    size: AppSizes.s18,
                    color: context.theme.primaryColor,
                  ),
                  Text(
                    item.date ?? '--',
                    style: AppTextStyles.font14Bold,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p10,
                  vertical: AppPadding.p4,
                ),
                decoration: BoxDecoration(
                  color: isLate
                      ? AppColors.tagReviewBg
                      : AppColors.tagApprovedBg,
                  borderRadius: BorderRadius.circular(AppSizes.r20),
                ),
                child: Text(
                  item.status.label,
                  style: AppTextStyles.font11Bold.copyWith(
                    color: isLate
                        ? AppColors.tagReviewText
                        : AppColors.tagApprovedText,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: AppSizes.s1, color: AppColors.cardBorder),
          Row(
            children: [
              Expanded(
                child: _buildTimeBox(
                  label: 'check_in'.tr(),
                  value: item.check_in_at ?? '--',
                  subLabel: item.check_in_method.label,
                ),
              ),
              Expanded(
                child: _buildTimeBox(
                  label: 'check_out'.tr(),
                  value: item.check_out_at ?? '--',
                  subLabel: item.check_out_method.label,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${item.branch.name} • ${item.shift.name}',
                style: AppTextStyles.font12Regular.copyWith(
                  color: AppColors.lightTextSecondary,
                ),
              ),
              Text(
                '${'worked_time'.tr()}: ${item.worked_time}',
                style: AppTextStyles.font12SemiBold.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
            ],
          ),
          if (item.late_minutes > 0 || item.early_departure_minutes > 0)
            Wrap(
              spacing: AppSizes.s8,
              runSpacing: AppSizes.s6,
              children: [
                if (item.late_minutes > 0)
                  _buildMetricChip(
                    '${'late'.tr()}: ${item.late_minutes}m',
                    AppColors.tagReviewBg,
                    AppColors.tagReviewText,
                  ),
                if (item.early_departure_minutes > 0)
                  _buildMetricChip(
                    '${'early_departure'.tr()}: ${item.early_departure_minutes}m',
                    AppColors.tagReviewBg,
                    AppColors.tagReviewText,
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildTimeBox({
    required String label,
    required String value,
    required String subLabel,
  }) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: AppPadding.p8),
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        color: AppColors.metricContainerBg,
        borderRadius: BorderRadius.circular(AppSizes.r10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizes.s2,
        children: [
          Text(
            label,
            style: AppTextStyles.font11Regular.copyWith(
              color: AppColors.lightTextSecondary,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.font13Medium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subLabel,
            style: AppTextStyles.font10Regular.copyWith(
              color: AppColors.lightTextSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricChip(String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p4,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppSizes.r8),
      ),
      child: Text(
        text,
        style: AppTextStyles.font11Bold.copyWith(color: fg),
      ),
    );
  }
}
