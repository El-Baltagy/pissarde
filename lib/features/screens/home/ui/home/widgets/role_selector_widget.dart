import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class RoleSelectorWidget extends StatefulWidget {
  const RoleSelectorWidget({super.key});

  @override
  State<RoleSelectorWidget> createState() => _RoleSelectorWidgetState();
}

class _RoleSelectorWidgetState extends State<RoleSelectorWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      padding: const EdgeInsets.all(AppPadding.p4),
      decoration: BoxDecoration(
        color: AppColors.roleSwitchBg,
        borderRadius: BorderRadius.circular(AppSizes.r16),
      ),
      child: Row(
        /// RTL-first: employee (right) → branch manager → hr (left)
        children: [
          _buildRoleItem(
            index: 0,
            icon: Icons.person_outline_rounded,
            labelKey: 'role_employee_view',
          ),
          4.horizontalSpace,
          _buildRoleItem(
            index: 1,
            icon: Icons.groups_outlined,
            labelKey: 'role_branch_manager',
          ),
          4.horizontalSpace,
          _buildRoleItem(
            index: 2,
            icon: Icons.shield_outlined,
            labelKey: 'role_hr',
          ),
        ],
      ),
    );
  }

  Widget _buildRoleItem({
    required int index,
    required IconData icon,
    required String labelKey,
  }) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _selectedIndex = index),
        borderRadius: BorderRadius.circular(AppSizes.r12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.roleSwitchSelectedBg : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.r12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.lightBorder.withValues(alpha: 0.6),
                      blurRadius: AppSizes.s4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          /// RTL-first inside each pill: icon (right) → text (left)
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: AppSizes.s18,
                color: isSelected
                    ? AppColors.roleSwitchSelectedText
                    : AppColors.roleSwitchUnselectedText,
              ),
              6.horizontalSpace,
              Text(
                labelKey.tr(),
                style: isSelected
                    ? AppTextStyles.font13Medium.copyWith(
                        color: AppColors.roleSwitchSelectedText,
                        fontWeight: FontWeight.bold,
                      )
                    : AppTextStyles.font13Regular.copyWith(
                        color: AppColors.roleSwitchUnselectedText,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
