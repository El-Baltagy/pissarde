import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class NotificationsFilterChipsWidget extends StatelessWidget {
  const NotificationsFilterChipsWidget({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
    this.counts = const {},
  });

  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;
  final Map<String, int> counts;

  static const List<({String key, String labelKey})> filters = [
    (key: 'all', labelKey: 'notifications_filter_all'),
    (key: 'leaves', labelKey: 'notifications_filter_leaves'),
    (key: 'attendance', labelKey: 'notifications_filter_attendance'),
    (key: 'reminders', labelKey: 'notifications_filter_reminders'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        spacing: AppSizes.s8,
        children: filters.map((filter) {
          final isSelected = selectedFilter == filter.key;
          final count = counts[filter.key];

          return GestureDetector(
            onTap: () => onFilterChanged(filter.key),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p14,
                vertical: AppPadding.p8,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.headerBackground
                    : AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppSizes.r20),
                border: Border.all(
                  color: isSelected
                      ? AppColors.headerBackground
                      : AppColors.cardBorder,
                  width: AppSizes.s1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppColors.headerBackground.withValues(alpha: 0.25),
                          blurRadius: AppSizes.s8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: AppSizes.s6,
                children: [
                  Text(
                    filter.labelKey.tr(),
                    style: AppTextStyles.font12Medium.copyWith(
                      color: isSelected
                          ? AppColors.roleSwitchSelectedBg
                          : AppColors.lightTextSecondary,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                  if (count != null && count > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p6,
                        vertical: AppPadding.p2,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.roleSwitchSelectedBg.withValues(alpha: 0.2)
                            : AppColors.roleSwitchBg,
                        borderRadius: BorderRadius.circular(AppSizes.r10),
                      ),
                      child: Text(
                        '$count',
                        style: AppTextStyles.font10SemiBold.copyWith(
                          color: isSelected
                              ? AppColors.roleSwitchSelectedBg
                              : AppColors.lightTextPrimary,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
