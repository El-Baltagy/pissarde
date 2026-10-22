import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bottomNavBg,
        border: Border(
          top: BorderSide(
            color: AppColors.lightBorder,
            width: AppSizes.s1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p8,
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              index: 0,
              icon: Icons.home_rounded,
              labelKey: 'nav_home',
            ),
            _buildNavItem(
              index: 1,
              icon: Icons.calendar_month_outlined,
              labelKey: 'nav_attendance_record',
            ),
            _buildNavItem(
              index: 2,
              icon: Icons.description_outlined,
              labelKey: 'nav_requests',
            ),
            _buildNavItem(
              index: 3,
              icon: Icons.grid_view_rounded,
              labelKey: 'nav_manager_dashboard',
            ),
            _buildNavItem(
              index: 4,
              icon: Icons.person_outline_rounded,
              labelKey: 'nav_my_account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String labelKey,
  }) {
    final isSelected = currentIndex == index;
    final color = isSelected ? AppColors.bottomNavActive : AppColors.bottomNavInactive;
    final label = labelKey.tr();

    return Expanded(
      child: Semantics(
        label: label,
        selected: isSelected,
        button: true,
        child: InkWell(
          onTap: () => onTap(index),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: color,
                size: AppSizes.s24,
              ),
              const SizedBox(height: AppPadding.p4),
              Text(
                label,
                style: isSelected
                    ? AppTextStyles.font12SemiBold.copyWith(color: color)
                    : AppTextStyles.font11Regular.copyWith(color: color),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
