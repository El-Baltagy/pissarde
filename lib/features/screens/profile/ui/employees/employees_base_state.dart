part of 'employees_screen.dart';

abstract class EmployeesPageBaseState extends State<EmployeesPage> {
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = widget.args.profileCubit;
    profileCubit.listEmployeesFunc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener(BuildContext context, ProfileState state) {
    if (state is ProfileLoaded) {
      if (state.createEmployeeEmit is Success) {
        profileCubit.listEmployeesFunc();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('employee_created_success'.tr()),
            backgroundColor: AppColors.contractorGreen,
          ),
        );
      }
      if (state.createEmployeeEmit is ErrorState) {
        final err = state.createEmployeeEmit as ErrorState;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(err.failure.message),
            backgroundColor: AppColors.primaryActionRed,
          ),
        );
      }
    }
  }

  void _showAddEmployeeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: profileCubit,
        child: const AddEmployeeBottomSheet(),
      ),
    );
  }
}
