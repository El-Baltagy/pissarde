import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/data/model/check_in_today_status_res/check_in_today_status_res.dart';

/// Renders today's attendance status, shift, and branch details.
class AttendanceTodayBodyWidget extends StatelessWidget {
  const AttendanceTodayBodyWidget({
    super.key,
    required this.emit,
    required this.onRefresh,
  });

  final BaseEmit? emit;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    if (emit == null || emit is Loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (emit is ErrorState) {
      final err = emit as ErrorState;
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSizes.s12,
            children: [
              Text(
                err.failure.message,
                style: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.primaryActionRed,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton.icon(
                onPressed: onRefresh,
                icon: const Icon(Icons.refresh_rounded, size: AppSizes.s18),
                label: Text('retry'.tr()),
              ),
            ],
          ),
        ),
      );
    }
    if (emit is Success && (emit as Success).data is CheckInTodayStatusRes) {
      final data = (emit as Success).data as CheckInTodayStatusRes;
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSizes.s16,
            children: [
              _buildStatusBanner(context, data),
              _buildInfoCard(
                context,
                icon: Icons.schedule_outlined,
                title: 'shift'.tr(),
                rows: [
                  (label: 'shift_name'.tr(), value: data.shift.name),
                  (label: 'shift_code'.tr(), value: data.shift.code),
                  (
                    label: 'shift_hours_label'.tr(),
                    value: '${data.shift.start_time} - ${data.shift.end_time}',
                  ),
                  (
                    label: 'grace_period'.tr(),
                    value: '${data.shift.grace_period_minutes} min',
                  ),
                ],
              ),
              _buildInfoCard(
                context,
                icon: Icons.location_city_outlined,
                title: 'branch'.tr(),
                rows: [
                  (label: 'branch_name'.tr(), value: data.branch.name),
                  (label: 'branch_code'.tr(), value: data.branch.code),
                  (label: 'address'.tr(), value: data.branch.address),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildStatusBanner(BuildContext context, CheckInTodayStatusRes data) {
    final isCheckedIn = data.has_checked_in;
    final statusText = isCheckedIn ? 'checked_in'.tr() : 'not_checked_in'.tr();
    final sessionText =
        data.is_open ? 'open_session'.tr() : 'closed_session'.tr();

    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: BorderRadius.circular(AppSizes.r16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSizes.s4,
              children: [
                Text(
                  data.date,
                  style: AppTextStyles.font16Bold.copyWith(
                    color: AppColors.roleSwitchSelectedBg,
                  ),
                ),
                Text(
                  sessionText,
                  style: AppTextStyles.font12Regular.copyWith(
                    color: AppColors.darkTextSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
              vertical: AppPadding.p6,
            ),
            decoration: BoxDecoration(
              color: isCheckedIn
                  ? AppColors.tagApprovedBg
                  : AppColors.tagReviewBg,
              borderRadius: BorderRadius.circular(AppSizes.r20),
            ),
            child: Text(
              statusText,
              style: AppTextStyles.font12SemiBold.copyWith(
                color: isCheckedIn
                    ? AppColors.tagApprovedText
                    : AppColors.tagReviewText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required List<({String label, String value})> rows,
  }) {
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
            spacing: AppSizes.s8,
            children: [
              Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  color: AppColors.roleSwitchBg,
                  borderRadius: BorderRadius.circular(AppSizes.r10),
                ),
                child: Icon(
                  icon,
                  color: context.theme.primaryColor,
                  size: AppSizes.s20,
                ),
              ),
              Text(title, style: AppTextStyles.font16Bold),
            ],
          ),
          const Divider(height: AppSizes.s1, color: AppColors.cardBorder),
          ...rows.map(
            (row) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSizes.s12,
              children: [
                Text(
                  row.label,
                  style: AppTextStyles.font13Regular.copyWith(
                    color: AppColors.lightTextSecondary,
                  ),
                ),
                Flexible(
                  child: Text(
                    row.value,
                    textAlign: TextAlign.end,
                    style: AppTextStyles.font13Medium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
