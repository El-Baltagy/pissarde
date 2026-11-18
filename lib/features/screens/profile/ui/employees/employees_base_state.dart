part of 'employees_screen.dart';

abstract class EmployeesPageBaseState extends State<EmployeesPage> {
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = widget.args.profileCubit;
    profileCubit.getListEmployeesFunc(Init());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener(BuildContext context, ProfileState state) {
    if (state is ProfileLoaded) {
      // ── Create Employee listener ──
      if (state.createEmployeeState is Success) {
        profileCubit.resetCreateEmployee();
        profileCubit.getListEmployeesFunc(Reload());
        context.showToast('employee_created_success'.tr());
      }
      if (state.createEmployeeState is ErrorState) {
        final err = state.createEmployeeState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }

      // ── Update Employee listener ──
      if (state.updateEmployeeState is Success) {
        profileCubit.resetUpdateEmployee();
        profileCubit.getListEmployeesFunc(Reload());
        context.showToast('employee_updated_success'.tr());
      }
      if (state.updateEmployeeState is ErrorState) {
        final err = state.updateEmployeeState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }

      // ── Delete Employee listener ──
      if (state.deleteEmployeeState is Success) {
        profileCubit.resetDeleteEmployee();
        profileCubit.getListEmployeesFunc(Reload());
        context.showToast('employee_deleted_success'.tr());
      }
      if (state.deleteEmployeeState is ErrorState) {
        final err = state.deleteEmployeeState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}
