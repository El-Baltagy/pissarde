part of 'branches_screen.dart';

abstract class BranchesPageBaseState extends State<BranchesPage> {
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = ProfileCubit.get(context: context);
    profileCubit.listBranchesFunc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener(BuildContext context, ProfileState state) {
    if (state is ProfileLoaded) {
      if (state.createBranchEmit is Success) {
        profileCubit.listBranchesFunc();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('branch_created_success'.tr()),
            backgroundColor: AppColors.contractorGreen,
          ),
        );
      }
      if (state.createBranchEmit is ErrorState) {
        final err = state.createBranchEmit as ErrorState;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(err.failure.message),
            backgroundColor: AppColors.primaryActionRed,
          ),
        );
      }
    }
  }

  void _showAddBranchSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: profileCubit,
        child: const AddBranchBottomSheet(),
      ),
    );
  }
}
