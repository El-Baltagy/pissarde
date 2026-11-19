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
      if (state.getListShiftsState is ErrorState) {
        final err = state.getListShiftsState as ErrorState;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(err.failure.message),
            backgroundColor: AppColors.primaryActionRed,
          ),
        );
      }
      // Handle delete success
      if (state.deleteShiftState is Success) {
        profileCubit.resetStateAfterSuccess(ScreenTypeAction.shift);
        profileCubit.getListShiftsFunc(Reload());
        context.showToast('shift_deleted_success'.tr());
      } else if (state.deleteShiftState is ErrorState) {
        final err = state.deleteShiftState as ErrorState;
        profileCubit.resetStateAfterSuccess(ScreenTypeAction.shift);
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }


}
