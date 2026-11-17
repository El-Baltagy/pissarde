part of 'shifts_screen.dart';

abstract class ShiftsPageBaseState extends State<ShiftsPage> {
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = ProfileCubit.get(context: context);
    profileCubit.getListShiftsFunc(Init()) ;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener(BuildContext context, ProfileState state) {
    if (state is ProfileLoaded) {
      if (state.createShiftState is Success) {
        profileCubit.getListShiftsFunc(Reload());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('shift_created_success'.tr()),
            backgroundColor: AppColors.contractorGreen,
          ),
        );
      }
      if (state.createShiftState is ErrorState) {
        final err = state.createShiftState as ErrorState;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(err.failure.message),
            backgroundColor: AppColors.primaryActionRed,
          ),
        );
      }
    }
  }

  void _showAddShiftSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: profileCubit,
        child: const AddShiftBottomSheet(),
      ),
    );
  }
}
