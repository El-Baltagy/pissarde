import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/shifts/controller/shifts_cubit.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/get_all_shifts_res/get_all_shifts_res.dart';

import 'shift_card_widget.dart';

/// Renders the shifts list, handling loading / error / empty / success states.
class ShiftsListWidget extends StatelessWidget {
  const ShiftsListWidget({super.key, required this.emit, required this.shiftsCubit});

  final BaseEmit? emit;
  final ShiftsCubit shiftsCubit;

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
    if (emit is Success<GetAllShiftsRes>) {
      final items = (emit as Success<GetAllShiftsRes>).data?.data ?? [];
      if (items.isEmpty) {
        return Center(
            child: Text('no_shifts'.tr(),
                style: AppTextStyles.font14Regular));
      }
      return ListView.separated(
        padding: const EdgeInsets.all(AppPadding.p16),
        itemCount: items.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: AppSizes.s12),
        itemBuilder: (_, i) => ShiftCardWidget(
          shift: items[i],
          shiftsCubit: shiftsCubit,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

