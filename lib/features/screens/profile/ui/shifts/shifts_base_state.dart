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
    }
  }


}
