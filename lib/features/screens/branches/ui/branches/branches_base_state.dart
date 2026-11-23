part of 'branches_screen.dart';

abstract class BranchesPageBaseState extends State<BranchesPage> {
  late final BranchesCubit branchesCubit;

  @override
  void initState() {
    branchesCubit = BranchesCubit.get(context: context);
    super.initState();

    branchesCubit.getListBranchesFunc(Init());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener(BuildContext context, BranchesState state) {
    if (state is BranchesLoaded) {
      // ── Delete Branch listener ──
      if (state.deleteBranchState is Success) {
        branchesCubit.resetStateAfterSuccess();
        branchesCubit.getListBranchesFunc(Reload());
        context.showToast('branch_deleted_success'.tr());
      }
      if (state.deleteBranchState is ErrorState) {
        final err = state.deleteBranchState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}
