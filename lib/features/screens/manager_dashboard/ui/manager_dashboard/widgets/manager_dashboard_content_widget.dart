import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class ManagerDashboardContentWidget extends StatelessWidget {
  const ManagerDashboardContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildBranchHeaderCard(),
          16.verticalSpace,
          _buildQuickStatsGrid(),
          16.verticalSpace,
          _buildDepartmentList(),
        ],
      ),
    );
  }

  Widget _buildBranchHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.headerBackground,
        borderRadius: BorderRadius.circular(AppSizes.r16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'لوحة تحكم مدير الفرع',
            style: AppTextStyles.font16Bold.copyWith(
              color: AppColors.roleSwitchSelectedBg,
            ),
          ),
          4.verticalSpace,
          Text(
            'فرع الرياض الرئيسي - متابعة فورية للحضور والانضباط',
            style: AppTextStyles.font11Regular.copyWith(
              color: AppColors.darkTextSecondary,
            ),
          ),
          12.verticalSpace,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
              vertical: AppPadding.p6,
            ),
            decoration: BoxDecoration(
              color: AppColors.headerBadgeBg,
              borderRadius: BorderRadius.circular(AppSizes.r12),
            ),
            child: Text(
              'نسبة الانضباط العام اليوم: 92%',
              style: AppTextStyles.font12SemiBold.copyWith(
                color: AppColors.roleSwitchSelectedBg,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStatsGrid() {
    return Row(
      children: [
        _buildStatCard(
          title: 'طلبات معلقة',
          value: '3',
          icon: Icons.pending_actions_rounded,
          color: AppColors.statusLateText,
          bgColor: AppColors.statusLateBg,
        ),
        10.horizontalSpace,
        _buildStatCard(
          title: 'إجمالي الموظفين',
          value: '48',
          icon: Icons.people_outline_rounded,
          color: AppColors.headerBackground,
          bgColor: AppColors.policyCardBg,
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required Color bgColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppSizes.r14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(icon, color: color, size: AppSizes.s24),
            8.verticalSpace,
            Text(
              value,
              style: AppTextStyles.font20Bold.copyWith(color: color),
            ),
            2.verticalSpace,
            Text(
              title,
              style: AppTextStyles.font11Regular.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDepartmentList() {
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'حضور الأقسام اليوم',
            style: AppTextStyles.font14Bold,
          ),
          12.verticalSpace,
          _buildDeptRow('إدارة تقنية المعلومات', '12 / 12 حاضر', AppColors.onlineGreen),
          8.verticalSpace,
          _buildDeptRow('إدارة العمليات والتشغيل', '20 / 22 حاضر', AppColors.statusLateText),
          8.verticalSpace,
          _buildDeptRow('المبيعات والتسويق', '14 / 14 حاضر', AppColors.onlineGreen),
        ],
      ),
    );
  }

  Widget _buildDeptRow(String dept, String status, Color statusColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          status,
          style: AppTextStyles.font11Regular.copyWith(
            color: statusColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          dept,
          style: AppTextStyles.font12Medium,
        ),
      ],
    );
  }
}
