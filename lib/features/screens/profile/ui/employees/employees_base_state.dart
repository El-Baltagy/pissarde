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
      if (state.createEmployeeState is Success) {
        profileCubit.getListEmployeesFunc(Reload());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('employee_created_success'.tr()),
            backgroundColor: AppColors.contractorGreen,
          ),
        );
      }
      if (state.createEmployeeState is ErrorState) {
        final err = state.createEmployeeState as ErrorState;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(err.failure.message),
            backgroundColor: AppColors.primaryActionRed,
          ),
        );
      }
    }
  }


}
