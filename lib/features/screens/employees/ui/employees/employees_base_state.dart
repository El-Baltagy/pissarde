part of 'employees_screen.dart';

abstract class EmployeesPageBaseState extends State<EmployeesPage> {
  late final EmployeesCubit employeesCubit;
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    employeesCubit = EmployeesCubit.get(context: context);
    _loadData(Reload());
  }

  Future<void> _loadData([BaseRequestBackType? requestType]) async {
    await employeesCubit.getListEmployeesFunc(requestType ?? Init());
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  void _listener(BuildContext context, EmployeesState state) {
    if (state is EmployeesLoaded) {
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
