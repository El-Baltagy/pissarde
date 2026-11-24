import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/core/extension/context.dart';
 import 'package:newf/features/screens/employees/controller/employees_cubit.dart';
import 'package:newf/features/screens/employees/data/model/employees/get_all_employees_res/get_all_employees_res.dart';
import 'package:newf/features/screens/employees/data/model/pagination.dart';
import 'package:newf/features/screens/employees/data/model/list_employees_param.dart';
import 'package:newf/features/screens/employees/ui/employees/widgets/employee_card_widget.dart';

part 'employees_base_state.dart';

@RoutePage()
class EmployeesPage extends StatefulWidget implements AutoRouteWrapper {
  const EmployeesPage({super.key, required this.args});

  final EmployeesRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.employeesCubit, child: this);
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
        floatingActionButton: FloatingActionButton(heroTag: null, 
          backgroundColor: context.theme.primaryColor,
          onPressed: () async=>await context.push(
            AddEditEmloyeeRoute(
              args: AddEditEmloyeeRouteArgs(
                employeesCubit: employeesCubit,
              ),
            ),
          ),
          child:
          const Icon(Icons.add, color: AppColors.roleSwitchSelectedBg),
        ),
        body: Semantics(
          label: 'Employees list',
          child: BlocSelector<EmployeesCubit, EmployeesState, BaseEmit?>(
            selector: (state) =>
            state is EmployeesLoaded ? state.getListEmployeesState : null,
            builder: (context, emit) {
              GetAllEmployeesRes? data;
              if (emit is Success<GetAllEmployeesRes>) {
                data = emit.data;
              } else if (emit is Loading<GetAllEmployeesRes>) {
                data = emit.item;
              }
              final pagination = data?.pagination;
              final items = data?.data ?? [];
              final isInitialLoading = data == null;

              return SmartRefresher(
                controller: refreshController,
                onRefresh: () async =>
                await _loadData(Reload()).whenComplete(() {
                  refreshController.loadComplete();
                  refreshController.refreshCompleted();
                }),
                onLoading: () async {
                  if (pagination == null) {
                    refreshController.loadComplete();
                    return;
                  }
                  await employeesCubit.getListEmployeesFunc(
                    pagination.toGetPaginationInfo(data),
                    parameter: EmployeesListParam(
                        page: pagination.current_page),
                  );
                  refreshController.loadComplete();
                },
                enablePullUp: (pagination != null &&
                    pagination.current_page < pagination.last_page),
                footer: CustomFooter(
                  height: 50,
                  builder: (BuildContext context, LoadStatus? mode) {
                    if (mode == LoadStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return const SizedBox.shrink();
                  },
                ),
                child: isInitialLoading
                    ? const Center(child: CircularProgressIndicator())
                    : (emit is ErrorState)
                    ? Center(
                  child: Text(
                    (emit).failure.message,
                    style: AppTextStyles.font14Regular.copyWith(
                        color: AppColors.primaryActionRed),
                    textAlign: TextAlign.center,
                  ),
                )
                    : (items.isEmpty)
                    ? Center(
                  child: Text('no_employees'.tr(),
                      style: AppTextStyles.font14Regular),
                )
                    : ListView.separated(
                  padding:
                  const EdgeInsets.all(AppPadding.p16),
                  itemCount: items.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(height: AppSizes.s12),
                  itemBuilder: (_, i) =>
                      EmployeeCardWidget(
                        employee: items[i],
                        employeesCubit: employeesCubit,
                      ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
