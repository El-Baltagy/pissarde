part of 'employees_screen.dart';

abstract class EmployeesPageBaseState extends State<EmployeesPage> {
  late final EmployeesCubit employeesCubit;

  @override
  void initState() {
    employeesCubit = EmployeesCubit.get(context: context);
    super.initState();
    employeesCubit.getListEmployeesFunc(Init());

  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener(BuildContext context, EmployeesState state) {
    if (state is EmployeesLoaded) {
      // ── Create Employee listener ──
      // if (state.createEmployeeState is Success) {
      //   employeesCubit.resetStateAfterSuccess();
      //   employeesCubit.getListEmployeesFunc(Reload());
      //   context.showToast('employee_created_success'.tr());
      // }
      // if (state.createEmployeeState is ErrorState) {
      //   final err = state.createEmployeeState as ErrorState;
      //   context.showToast(err.failure.message, isSuccess: false);
      // }


      // ── Delete Employee listener ──
      if (state.deleteEmployeeState is Success) {
        employeesCubit.resetStateAfterSuccess();
        employeesCubit.getListEmployeesFunc(Reload());
        context.showToast('employee_deleted_success'.tr());
      }
      if (state.deleteEmployeeState is ErrorState) {
        final err = state.deleteEmployeeState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}
