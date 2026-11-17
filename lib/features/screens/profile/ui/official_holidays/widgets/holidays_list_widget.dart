import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/data/model/get_avilable_holidays_res/get_avilable_holidays_res.dart';

import 'holiday_card_widget.dart';

/// Renders the official holidays list, handling loading / error / empty / success states.
class HolidaysListWidget extends StatelessWidget {
  const HolidaysListWidget({super.key, required this.emit});

  final BaseEmit? emit;

  @override
  Widget build(BuildContext context) {
    if (emit == null || emit is Loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (emit is ErrorState) {
      final e = emit as ErrorState;
      return Center(
        child: Text(
          e.failure.message,
          style: AppTextStyles.font14Regular
              .copyWith(color: AppColors.primaryActionRed),
          textAlign: TextAlign.center,
        ),
      );
    }
    if (emit is Success<GetAvilableHolidaysRes>) {
      final items =
          (emit as Success<GetAvilableHolidaysRes>).data?.holidays ?? [];
      if (items.isEmpty) {
        return Center(
            child: Text('no_holidays'.tr(),
                style: AppTextStyles.font14Regular));
      }
      return ListView.separated(
        padding: const EdgeInsets.all(AppPadding.p16),
        itemCount: items.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: AppSizes.s12),
        itemBuilder: (_, i) => HolidayCardWidget(holiday: items[i]),
      );
    }
    return const SizedBox.shrink();
  }
}
