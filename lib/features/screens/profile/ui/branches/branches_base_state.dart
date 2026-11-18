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
      // ── Create Branch listener ──
      if (state.createBranchState is Success) {
        profileCubit.resetCreateBranch();
        profileCubit.getListBranchesFunc(Reload());
        context.showToast('branch_created_success'.tr());
      }
      if (state.createBranchState is ErrorState) {
        final err = state.createBranchState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }

      // ── Update Branch listener ──
      if (state.updateBranchState is Success) {
        profileCubit.resetUpdateBranch();
        profileCubit.getListBranchesFunc(Reload());
        context.showToast('branch_updated_success'.tr());
      }
      if (state.updateBranchState is ErrorState) {
        final err = state.updateBranchState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }

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
