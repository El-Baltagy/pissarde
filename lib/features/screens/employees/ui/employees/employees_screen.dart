import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/employees/controller/employees_cubit.dart';
import 'package:newf/features/screens/employees/ui/employees/widgets/employees_list_widget.dart';
import 'package:newf/core/extension/context.dart';

part 'employees_base_state.dart';

@RoutePage()
class EmployeesPage extends StatefulWidget implements AutoRouteWrapper {
  const EmployeesPage({super.key, required this.args});

  final EmployeesRouteArgs args;
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<EmployeesCubit>(create: (context) =>AppLocator()()(), child: this);
  }

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends EmployeesPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<EmployeesCubit, EmployeesState>(
      listener: _listener,
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          backgroundColor: context.theme.primaryColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.roleSwitchSelectedBg),
          title: Text(
            'employees'.tr(),
            style: AppTextStyles.font18Bold
                .copyWith(color: AppColors.roleSwitchSelectedBg),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.theme.primaryColor,
          onPressed: () async {
            final res = await context.push(
              AddEditEmloyeeRoute(
                args: AddEditEmloyeeRouteArgs(
                  employeesCubit: employeesCubit,
                ),
              ),
            );
            if (res == true) {
              await employeesCubit.getListEmployeesFunc(Reload());
            }
          },
          child:
              const Icon(Icons.add, color: AppColors.roleSwitchSelectedBg),
        ),
        body: Semantics(
          label: 'Employees list',
          child: BlocSelector<EmployeesCubit, EmployeesState, BaseEmit?>(
            selector: (state) =>
                state is EmployeesLoaded ? state.getListEmployeesState : null,
            builder: (context, emit) => EmployeesListWidget(
              emit: emit,
              employeesCubit: employeesCubit,
            ),
          ),
        ),
      ),
    );
  }
}
