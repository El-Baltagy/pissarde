import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/data/model/employees/get_all_employees_res/get_all_employees_res.dart';

/// Displays summary information for a single employee.
class EmployeeCardWidget extends StatelessWidget {
  const EmployeeCardWidget({super.key, required this.employee});

  final DataItem employee;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Employee card for ${employee.name}',
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.r14),
          border:
              Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        ),
        child: Row(
          spacing: AppSizes.s12,
          children: [
            Container(
              width: AppSizes.s48,
              height: AppSizes.s48,
              decoration: BoxDecoration(
                color: AppColors.roleSwitchBg,
                borderRadius: BorderRadius.circular(AppSizes.r24),
              ),
              child: const Icon(
                Icons.person_outline,
                color: AppColors.headerBackground,
                size: AppSizes.s24,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSizes.s4,
                children: [
                  Text(employee.name, style: AppTextStyles.font14Bold),
                  Text(employee.employee_code,
                      style: AppTextStyles.font12Regular),
                  Text(
                    employee.role.label,
                    style: AppTextStyles.font12Medium
                        .copyWith(color: AppColors.headerBackground),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p8,
                vertical: AppPadding.p4,
              ),
              decoration: BoxDecoration(
                color: employee.is_active
                    ? AppColors.statusPresentBg
                    : AppColors.statusAbsentBg,
                borderRadius: BorderRadius.circular(AppSizes.r8),
              ),
              child: Text(
                employee.is_active ? 'active' : 'inactive',
                style: AppTextStyles.font11Bold.copyWith(
                  color: employee.is_active
                      ? AppColors.statusPresentText
                      : AppColors.statusAbsentText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
