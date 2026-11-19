import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/requests/data/model/get_leaves_balance_res/get_leaves_balance_res.dart';

class LeaveBalanceCardWidget extends StatelessWidget {
  const LeaveBalanceCardWidget({super.key, required this.item});
  final BalanceItem item;

  @override
  Widget build(BuildContext context) {
    final remaining = item.remaining_days;
    final allocated = item.allocated_days;
    final ratio = allocated > 0 ? (remaining / allocated).clamp(0.0, 1.0) : 0.0;

    return Semantics(
      label: 'Leave balance for ${item.leave_type.name}',
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.r14),
          border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    color: AppColors.statusLeaveBg,
                    borderRadius: BorderRadius.circular(AppSizes.r10),
                  ),
                  child: const Icon(
                    Icons.beach_access_outlined,
                    color: AppColors.statusLeaveText,
                    size: AppSizes.s20,
                  ),
                ),
                const SizedBox(width: AppSizes.s12),
                Expanded(
                  child: Text(item.leave_type.name, style: AppTextStyles.font14Bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p8,
                    vertical: AppPadding.p4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.tagApprovedBg,
                    borderRadius: BorderRadius.circular(AppSizes.r8),
                  ),
                  child: Text(
                    '$remaining ${'days_remaining'.tr()}',
                    style: AppTextStyles.font11Bold.copyWith(
                      color: AppColors.tagApprovedText,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.s12),
            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.r4),
              child: LinearProgressIndicator(
                value: ratio,
                backgroundColor: AppColors.cardBorder,
                color: AppColors.statusLeaveText,
                minHeight: 8,
              ),
            ),
            const SizedBox(height: AppSizes.s12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _stat('allocated_days'.tr(), item.allocated_days, context.theme.primaryColor),
                _stat('used_days'.tr(), item.used_days, AppColors.statusAbsentText),
                _stat('pending_days'.tr(), item.pending_days, AppColors.tagReviewText),
                _stat('remaining_days'.tr(), item.remaining_days, AppColors.tagApprovedText),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(String label, int value, Color color) {
    return Column(
      children: [
        Text('$value', style: AppTextStyles.font14Bold.copyWith(color: color)),
        const SizedBox(height: AppSizes.s2),
        Text(label, style: AppTextStyles.font11Regular),
      ],
    );
  }
}
