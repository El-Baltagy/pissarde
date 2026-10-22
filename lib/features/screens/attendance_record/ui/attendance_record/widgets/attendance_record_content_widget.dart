import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class AttendanceRecordContentWidget extends StatelessWidget {
  const AttendanceRecordContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSummaryHeader(),
          16.verticalSpace,
          _buildFilterChips(),
          16.verticalSpace,
          _buildRecordItem(
            date: 'الأربعاء، 15 مايو 2024',
            checkIn: '08:14 ص',
            checkOut: '--:--',
            statusKey: 'status_late',
            statusColor: AppColors.statusLateText,
            statusBgColor: AppColors.statusLateBg,
          ),
          12.verticalSpace,
          _buildRecordItem(
            date: 'الثلاثاء، 14 مايو 2024',
            checkIn: '07:55 ص',
            checkOut: '04:02 م',
            statusKey: 'status_present',
            statusColor: AppColors.statusPresentText,
            statusBgColor: AppColors.statusPresentBg,
          ),
          12.verticalSpace,
          _buildRecordItem(
            date: 'الاثنين، 13 مايو 2024',
            checkIn: '08:00 ص',
            checkOut: '04:05 م',
            statusKey: 'status_present',
            statusColor: AppColors.statusPresentText,
            statusBgColor: AppColors.statusPresentBg,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryHeader() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r16),
        border: Border.all(
          color: AppColors.cardBorder,
          width: AppSizes.s1,
        ),
      ),
      /// RTL-first: icon (right) → hours text (left)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p10),
            decoration: BoxDecoration(
              color: AppColors.roleSwitchBg,
              borderRadius: BorderRadius.circular(AppSizes.r12),
            ),
            child: const Icon(
              Icons.calendar_month_outlined,
              color: AppColors.headerBackground,
              size: AppSizes.s24,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'ساعات الحضور هذا الشهر',
                style: AppTextStyles.font11Regular,
              ),
              4.verticalSpace,
              Text(
                '160 / 176 ساعة',
                style: AppTextStyles.font16Bold.copyWith(
                  color: AppColors.headerBackground,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
        children: [
          _buildChip(label: 'الكل', isSelected: true),
          8.horizontalSpace,
          _buildChip(label: 'حاضر', isSelected: false),
          8.horizontalSpace,
          _buildChip(label: 'متأخر', isSelected: false),
          8.horizontalSpace,
          _buildChip(label: 'إجازة', isSelected: false),
          8.horizontalSpace,
          _buildChip(label: 'غياب', isSelected: false),
        ],
      ),
    );
  }

  Widget _buildChip({required String label, required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p14,
        vertical: AppPadding.p6,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.headerBackground : AppColors.roleSwitchBg,
        borderRadius: BorderRadius.circular(AppSizes.r20),
      ),
      child: Text(
        label,
        style: isSelected
            ? AppTextStyles.font12SemiBold.copyWith(color: AppColors.roleSwitchSelectedBg)
            : AppTextStyles.font12Medium.copyWith(color: AppColors.roleSwitchUnselectedText),
      ),
    );
  }

  Widget _buildRecordItem({
    required String date,
    required String checkIn,
    required String checkOut,
    required String statusKey,
    required Color statusColor,
    required Color statusBgColor,
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
      /// RTL-first: date+times (right) → status badge (left)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p8,
              vertical: AppPadding.p4,
            ),
            decoration: BoxDecoration(
              color: statusBgColor,
              borderRadius: BorderRadius.circular(AppSizes.r8),
            ),
            child: Text(
              statusKey.tr(),
              style: AppTextStyles.font11Regular.copyWith(
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: AppTextStyles.font13Medium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              4.verticalSpace,
              Text(
                'حضور: $checkIn  •  انصراف: $checkOut',
                style: AppTextStyles.font11Regular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
