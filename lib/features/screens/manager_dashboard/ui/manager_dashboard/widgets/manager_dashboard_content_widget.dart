import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/core/extension/context.dart';

class ManagerDashboardContentWidget extends StatelessWidget {
  const ManagerDashboardContentWidget({super.key});

  static   _quickStats (BuildContext context)=> [
    (
      title: 'طلبات معلقة',
      value: '3',
      icon: Icons.pending_actions_rounded,
      color: AppColors.statusLateText,
      bgColor: AppColors.statusLateBg,
    ),
    (
      title: 'إجمالي الموظفين',
      value: '48',
      icon: Icons.people_outline_rounded,
      color: context.theme.primaryColor,
      bgColor: AppColors.policyCardBg,
    ),
  ];

  static const _departments = [
    (
      name: 'إدارة تقنية المعلومات',
      status: '12 / 12 حاضر',
      statusColor: AppColors.onlineGreen,
    ),
    (
      name: 'إدارة العمليات والتشغيل',
      status: '20 / 22 حاضر',
      statusColor: AppColors.statusLateText,
    ),
    (
      name: 'المبيعات والتسويق',
      status: '14 / 14 حاضر',
      statusColor: AppColors.onlineGreen,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSizes.s16,
        children: [
          _buildBranchHeaderCard(  context),
          _buildQuickStatsGrid(  context),
          _buildDepartmentList(),
        ],
      ),
    );
  }

  Widget _buildBranchHeaderCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: BorderRadius.circular(AppSizes.r16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizes.s4,
        children: [
          Text(
            'لوحة تحكم مدير الفرع',
            style: AppTextStyles.font16Bold.copyWith(
              color: AppColors.roleSwitchSelectedBg,
            ),
          ),
          Text(
            'فرع الرياض الرئيسي - متابعة فورية للحضور والانضباط',
            style: AppTextStyles.font11Regular.copyWith(
              color: AppColors.darkTextSecondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p8),
            child: Container(
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
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStatsGrid(BuildContext context) {
    /// RTL-first: pending requests (right) → total employees (left)
    return Row(
      spacing: AppSizes.s10,
      children: _quickStats(  context)
          .map((stat) => _buildStatCard(
                title: stat.title,
                value: stat.value,
                icon: stat.icon,
                color: stat.color,
                bgColor: stat.bgColor,
              ))
          .toList(),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizes.s4,
          children: [
            Icon(icon, color: color, size: AppSizes.s24),
            Text(
              value,
              style: AppTextStyles.font20Bold.copyWith(color: color),
            ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizes.s10,
        children: [
          Text(
            'حضور الأقسام اليوم',
            style: AppTextStyles.font14Bold,
          ),
          ..._departments.map(
            (dept) => _buildDeptRow(dept.name, dept.status, dept.statusColor),
          ),
        ],
      ),
    );
  }

  /// RTL-first: dept name (right) → status (left)
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
