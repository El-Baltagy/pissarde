import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/employees/controller/employees_cubit.dart';
import 'package:newf/features/screens/employees/data/model/employees/get_all_employees_res/get_all_employees_res.dart';
import 'package:newf/features/screens/employees/ui/AddEditEmloyee/widgets/BottomSheetSelector.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Employee selector card styled with [BottomSheetSelector] and [Skeletonizer].
class CheckInEmployeeSelectorWidget extends StatelessWidget {
  const CheckInEmployeeSelectorWidget({
    super.key,
    required this.selectedNotifier,
  });

  final ValueNotifier<List<int>> selectedNotifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r14),
        border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
      ),
      child: BlocSelector<EmployeesCubit, EmployeesState, BaseEmit?>(
        selector: (state) =>
            state is EmployeesLoaded ? state.getListEmployeesState : null,
        builder: (context, empState) {
          final isLoading = empState is! Success<GetAllEmployeesRes>;
          final employees = empState is Success<GetAllEmployeesRes>
              ? empState.data?.data ?? []
              : <DataItem>[];
          final list = List<UIApiKeys<String>>.generate(
            employees.length,
            (i) => UIApiKeys(
              employees[i].name,
              employees[i].id.toString(),
              secUiTxt: employees[i].employee_code,
            ),
          );

          return Skeletonizer(
            enabled: isLoading,
            child: BottomSheetSelector(
              listChoices: list,
              selectedNotifier: selectedNotifier,
              isMultiSelect: false,
              title: 'employee'.tr(),
            ),
          );
        },
      ),
    );
  }
}
