part of 'shifts_screen.dart';

abstract class ShiftsPageBaseState extends State<ShiftsPage> {
  late final ShiftsCubit shiftsCubit;

  @override
  void initState() {
    shiftsCubit = ShiftsCubit.get(context: context);
    super.initState();
    shiftsCubit.getListShiftsFunc(Init()) ;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener(BuildContext context, ShiftsState state) {
    if (state is ShiftsLoaded) {
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
        shiftsCubit.resetStateAfterSuccess();
        shiftsCubit.getListShiftsFunc(Reload());
        context.showToast('shift_deleted_success'.tr());
      } else if (state.deleteShiftState is ErrorState) {
        final err = state.deleteShiftState as ErrorState;
        shiftsCubit.resetStateAfterSuccess();
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }


}
