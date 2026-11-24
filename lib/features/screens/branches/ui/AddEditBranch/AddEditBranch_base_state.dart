part of 'AddEditBranch_screen.dart';

abstract class AddEditBranchPageBaseState extends State<AddEditBranchPage> {
  late final BranchesCubit branchesCubit;

  final formKey = GlobalKey<FormState>();

  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldName = (.new(), .new());
  // (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldCode = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldAddress = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldLocation = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldRadius = (.new(), .new());

  final TextEditingController controllerName = .new();
  // final TextEditingController controllerCode = .new();
  final TextEditingController controllerAddress = .new();
  final TextEditingController controllerLocation = .new();
  final TextEditingController controllerLat = .new();
  final TextEditingController controllerLng = .new();
  final TextEditingController controllerRadius = .new();

  final ValueNotifier<bool> isActiveNotifier = .new(true);
  late final ValueNotifier<bool> isLoadingNotifier;

  bool _isSuccessHandled = false;

  /// Whether we're editing an existing branch (true) or creating new (false).
  bool get _isEditMode => widget.args.branchItem != null;

  @override
  void initState() {
    super.initState();
    isLoadingNotifier = .new(false);
    branchesCubit = BranchesCubit.get(context: context);
    branchesCubit.resetStateAfterSuccess();

    final branch = widget.args.branchItem;
    if (branch != null) {
      controllerName.text = branch.name;
      // controllerCode.text = branch.code;
      controllerAddress.text = branch.address;
      controllerLat.text = branch.latitude.toString();
      controllerLng.text = branch.longitude.toString();
      controllerLocation.text = '${branch.latitude}, ${branch.longitude}';
      controllerRadius.text = branch.geofence_radius_meters.toString();
      isActiveNotifier.value = branch.is_active;
    } else {
      controllerRadius.text = '100';
    }
  }

  @override
  void dispose() {
    fieldName.$2?.dispose();
    // fieldCode.$2?.dispose();
    fieldAddress.$2?.dispose();
    fieldLocation.$2?.dispose();
    fieldRadius.$2?.dispose();

    controllerName.dispose();
    // controllerCode.dispose();
    controllerAddress.dispose();
    controllerLocation.dispose();
    controllerLat.dispose();
    controllerLng.dispose();
    controllerRadius.dispose();

    isActiveNotifier.dispose();
    isLoadingNotifier.dispose();

    super.dispose();
  }

  Future<void> onPickLocationOnMap() async {
    final double? currentLat = double.tryParse(controllerLat.text.trim());
    final double? currentLng = double.tryParse(controllerLng.text.trim());

    final LocationPickResult? result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => OpenMapLocationPickerScreen(
          initialLatitude: currentLat,
          initialLongitude: currentLng,
        ),
      ),
    );

    if (result != null) {
      controllerLat.text = result.latitude.toString();
      controllerLng.text = result.longitude.toString();
      controllerLocation.text =
          '${result.latitude.toStringAsFixed(6)}, ${result.longitude.toStringAsFixed(6)}';

      if (result.address != null && result.address!.trim().isNotEmpty) {
        controllerAddress.text = result.address!;
      }
    }
  }

  Future<void> createOrUpdateBranch(bool isLoading) async {
    if (isLoading) return;

    if (await formKey.validateAndScroll(
      context,
      listRecorder: [
        fieldName,
        // fieldCode,
        fieldLocation,
        fieldAddress,
         fieldRadius,
      ],
    )) {
      if (_isEditMode) {
        final param = UpdateBranchReqParam(
          id: widget.args.branchItem?.id,
          name: controllerName.text.trim(),
          // code: controllerCode.text.trim(),
          address: controllerAddress.text.trim(),
          latitude: controllerLat.text.trim(),
          longitude: controllerLng.text.trim(),
          geofence_radius_meters: controllerRadius.text.trim().isEmpty
              ? '100'
              : controllerRadius.text.trim(),
          is_active: isActiveNotifier.value ? '1' : '0',
        );
        await branchesCubit.updateBranchFunc(  parameter: param);
      } else {
        final param = CreateBranchReqParam(
          name: controllerName.text.trim(),
          // code: controllerCode.text.trim(),
          address: controllerAddress.text.trim(),
          latitude: controllerLat.text.trim(),
          longitude: controllerLng.text.trim(),
          geofence_radius_meters: controllerRadius.text.trim().isEmpty
              ? '100'
              : controllerRadius.text.trim(),
          is_active: isActiveNotifier.value ? '1' : '0',
        );
        await branchesCubit.createBranchFunc(  parameter: param);
      }
    }
  }

  void createBranchListener(BuildContext context, BranchesState state) {
    if (state is BranchesLoaded) {
      // ── Create success ───────────────────────────────────────────────
      if (
          state.addEditBranchState is Success &&
          !_isSuccessHandled) {
        _isSuccessHandled = true;

        final res = (state.addEditBranchState as Success).data;
        final message = res is CreateBranchRes
            ? res.message
            : (!_isEditMode?'branch_created_success'.tr():'branch_updated_success'.tr());
        context.showToast(message);
        branchesCubit.resetStateAfterSuccess();
        context.pop(true);
      } else if (  state.addEditBranchState is ErrorState) {
        final err = state.addEditBranchState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }

    }
  }
}
