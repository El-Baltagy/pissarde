part of 'rotate_branch_qr_screen.dart';

abstract class RotateBranchQrPageBaseState extends State<RotateBranchQrPage> {
  late final HomeCubit homeCubit;
  final ValueNotifier<List<int>> selectedBranchNotifier =
      ValueNotifier<List<int>>([]);

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context: context);
    context.read<BranchesCubit>().getListBranchesFunc(Init());
  }

  @override
  void dispose() {
    selectedBranchNotifier.dispose();
    super.dispose();
  }

  /// Validates branch selection and sends the rotate QR code request.
  Future<void> _onRotatePressed(bool isLoading) async {
    if (isLoading) return;

    final branchesState = context.read<BranchesCubit>().state;
    final branches = branchesState is BranchesLoaded &&
            branchesState.getListBranchesState is Success<BranchesList>
        ? (branchesState.getListBranchesState as Success<BranchesList>)
                .data
                ?.data ??
            <DataItem>[]
        : <DataItem>[];

    if (selectedBranchNotifier.value.isEmpty ||
        selectedBranchNotifier.value.first >= branches.length) {
      context.showToast('please_select_branch_first'.tr(), isSuccess: false);
      return;
    }

    final selectedBranch = branches[selectedBranchNotifier.value.first];

    await homeCubit.rotateBranchQrFunc(
      parameter: RotateBranchQrParam(branchId: selectedBranch.id.toString()),
    );
  }

  /// Displays toast feedback when QR rotation completes or fails.
  void _listener(BuildContext context, HomeState state) {
    if (state is HomeLoaded) {
      if (state.rotateBranchQrState is Success<RotateBranchQrCodeRes>) {
        final res =
            (state.rotateBranchQrState as Success<RotateBranchQrCodeRes>).data;
        if (res != null && res.message.isNotEmpty) {
          context.showToast(res.message, isSuccess: res.success);
        }
      } else if (state.rotateBranchQrState is ErrorState) {
        final err = state.rotateBranchQrState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}
