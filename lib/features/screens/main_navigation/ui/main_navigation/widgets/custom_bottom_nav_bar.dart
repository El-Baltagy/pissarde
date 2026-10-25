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

  static const _leftTabs = [
    (index: 0, icon: Icons.home_rounded, labelKey: 'nav_home'),
    (index: 1, icon: Icons.calendar_month_outlined, labelKey: 'attendance'),
  ];

  static const _rightTabs = [
    (index: 2, icon: Icons.description_outlined, labelKey: 'nav_requests'),
    (index: 4, icon: Icons.person_outline_rounded, labelKey: 'nav_my_account'),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: AppSizes.s8,
      color: AppColors.bottomNavBg,
      elevation: AppSizes.s8,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.zero,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: AppSizes.s60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ..._leftTabs.map(
                (tab) => _buildNavItem(
                  index: tab.index,
                  icon: tab.icon,
                  labelKey: tab.labelKey,
                ),
              ),
              // Center gap for the notched floating action button
              const Expanded(
                child: SizedBox.shrink(),
              ),
              ..._rightTabs.map(
                (tab) => _buildNavItem(
                  index: tab.index,
                  icon: tab.icon,
                  labelKey: tab.labelKey,
                ),
              ),
            ],
          ),
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
        button: true,
        selected: isSelected,
        child: InkWell(
          onTap: () => onTap(index),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSizes.s4,
            children: [
              Icon(
                icon,
                color: color,
                size: AppSizes.s24,
              ),
              Text(
                label,
                style: isSelected
                    ? AppTextStyles.font14Bold.copyWith(color: color)
                    : AppTextStyles.font13Medium.copyWith(color: color),
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
