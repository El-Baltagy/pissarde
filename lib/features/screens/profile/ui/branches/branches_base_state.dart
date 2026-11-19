part of 'branches_screen.dart';

abstract class BranchesPageBaseState extends State<BranchesPage> {
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = ProfileCubit.get(context: context);
    profileCubit.getListBranchesFunc(Init());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener(BuildContext context, ProfileState state) {
    if (state is ProfileLoaded) {


      // ── Delete Branch listener ──
      if (state.deleteBranchState is Success) {
        profileCubit.resetDeleteBranch();
        profileCubit.getListBranchesFunc(Reload());
        context.showToast('branch_deleted_success'.tr());
      }
      if (state.deleteBranchState is ErrorState) {
        final err = state.deleteBranchState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}
