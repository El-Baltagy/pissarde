import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/data/model/employees/get_all_employees_res/get_all_employees_res.dart';

import 'employee_card_widget.dart';

/// Renders the employees list, handling loading / error / empty / success states.
class EmployeesListWidget extends StatelessWidget {
  const EmployeesListWidget({
    super.key,
    required this.emit,
    required this.profileCubit,
  });

  final BaseEmit? emit;
  final ProfileCubit profileCubit;

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
    if (emit is Success<GetAllEmployeesRes>) {
      final items = (emit as Success<GetAllEmployeesRes>).data?.data ?? [];
      if (items.isEmpty) {
        return Center(
          child: Text('no_employees'.tr(),
              style: AppTextStyles.font14Regular),
        );
      }
      return ListView.separated(
        padding: const EdgeInsets.all(AppPadding.p16),
        itemCount: items.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: AppSizes.s12),
        itemBuilder: (_, i) => EmployeeCardWidget(
          employee: items[i],
          profileCubit: profileCubit,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
