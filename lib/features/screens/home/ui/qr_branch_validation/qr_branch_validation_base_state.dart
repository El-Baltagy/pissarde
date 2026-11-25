part of 'qr_branch_validation_screen.dart';

abstract class QrBranchValidationPageBaseState
    extends State<QrBranchValidationPage> {
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

  /// Validates branch selection, opens the QR camera scanner, and submits
  /// the scanned token for verification.
  Future<void> _onVerifyPressed(bool isLoading) async {
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

    final scannedToken = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const QrCameraScannerPage()),
    );

    if (!mounted || scannedToken == null) {
      return;
    }

    if (!validateQrToken(context, scannedToken)) {
      return;
    }

    await homeCubit.verifyBranchQrFunc(
      Init(),
      parameter: VerifyBranchQrParam(
        branch_id: selectedBranch.id.toString(),
        branch_token: scannedToken.trim(),
      ),
    );
  }

  /// Displays toast feedback when QR verification completes or fails.
  void _listener(BuildContext context, HomeState state) {
    if (state is HomeLoaded) {
      if (state.verifyBranchQrState is Success) {
        final res = (state.verifyBranchQrState as Success).data;
        bool isValid= res is VerifyBranchQrCodeRes ? res.valid : false;
        final msg =  isValid?'valid'.tr() : (res.reason??'invalid'.tr()) ;
        context.showToast(
          msg,
          isSuccess:isValid,
        );
      } else if (state.verifyBranchQrState is ErrorState) {
        final err = state.verifyBranchQrState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}
