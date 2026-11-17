import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class WorkingDaysSelector extends StatelessWidget {
  const WorkingDaysSelector({super.key, required this.selectedDaysNotifier});

  final ValueNotifier<List<int>> selectedDaysNotifier;

  static const List<({int dayId, String labelAr, String labelEn})> days = [
    (dayId: 0, labelAr: 'أحد', labelEn: 'Sun'),
    (dayId: 1, labelAr: 'إثنين', labelEn: 'Mon'),
    (dayId: 2, labelAr: 'ثلاثاء', labelEn: 'Tue'),
    (dayId: 3, labelAr: 'أربعاء', labelEn: 'Wed'),
    (dayId: 4, labelAr: 'خميس', labelEn: 'Thu'),
    (dayId: 5, labelAr: 'جمعة', labelEn: 'Fri'),
    (dayId: 6, labelAr: 'سبت', labelEn: 'Sat'),
  ];

  @override
  Widget build(BuildContext context) {
    final isAr = !context.isLTR;

    return ValueListenableBuilder<List<int>>(
      valueListenable: selectedDaysNotifier,
      builder: (context, selectedDays, _) {
        return Wrap(
          spacing: AppSizes.s8,
          runSpacing: AppSizes.s8,
          children: days.map((day) {
            final isSelected = selectedDays.contains(day.dayId);
            return FilterChip(
              label: Text(
                isAr ? day.labelAr : day.labelEn,
                style: AppTextStyles.font13Medium.copyWith(
                  color: isSelected
                      ? context.theme.scaffoldBackgroundColor
                      : context.theme.colorScheme.onSurface,
                ),
              ),
              selected: isSelected,
              selectedColor: context.theme.primaryColor,
              backgroundColor: AppColors.cardBackground,
              checkmarkColor: context.theme.scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.r8),
                side: BorderSide(
                  color: isSelected
                      ? context.theme.primaryColor
                      : AppColors.cardBorder,
                ),
              ),
              onSelected: (selected) {
                final current = List<int>.from(selectedDaysNotifier.value);
                if (selected) {
                  current.add(day.dayId);
                } else {
                  current.remove(day.dayId);
                }
                current.sort();
                selectedDaysNotifier.value = current;
              },
            );
          }).toList(),
        );
      },
    );
  }
}
