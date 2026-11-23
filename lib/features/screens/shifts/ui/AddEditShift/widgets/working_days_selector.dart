import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/shared/methods/date_helper.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class WorkingDaysSelector extends StatelessWidget {
  const WorkingDaysSelector({super.key, required this.selectedDaysNotifier});

  final ValueNotifier<List<int>> selectedDaysNotifier;

  static const List<int> dayIds = [0, 1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale.languageCode;

    return ValueListenableBuilder<List<int>>(
      valueListenable: selectedDaysNotifier,
      builder: (context, selectedDays, _) {
        return Wrap(
          spacing: AppSizes.s8,
          runSpacing: AppSizes.s8,
          children: dayIds.map((dayId) {
            final isSelected = selectedDays.contains(dayId);
            return FilterChip(
              label: Text(
                DateTimeHelper.getWeekdayName(dayId, locale: currentLocale),
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
                  current.add(dayId);
                } else {
                  if(current.length > 2) {
                    current.remove(dayId);

                  }

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
