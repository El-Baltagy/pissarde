part of 'check_in_for_employee_screen.dart';

abstract class CheckInForEmployeePageBaseState
    extends State<CheckInForEmployeePage> {
  late final HomeCubit homeCubit;
  final ValueNotifier<List<int>> selectedEmployeeNotifier =
      ValueNotifier<List<int>>([]);
  final ValueNotifier<bool> isLocatingNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<String> dutyReasonNotifier = ValueNotifier<String>('');
  final TextEditingController controllerDutyReason = TextEditingController();

  /// Tracks whether we have already reacted to the current checkInState so the
  /// BlocListener does not fire the same toast multiple times when the widget
  /// rebuilds while the state hasn't changed.
  BaseEmit? _lastHandledCheckInState;

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context: context);
    // Reset any leftover checkIn state from previous sessions.
    _resetCheckInState();
    context.read<EmployeesCubit>().getListEmployeesFunc(
          Init(),
          parameter: EmployeesListParam(page: 0),
        );
  }

  /// Resets the checkIn slice so stale Success/Error states from a
  /// previous screen visit don't re-trigger the listener.
  void _resetCheckInState() {
    homeCubit.resetCheckInState();
    _lastHandledCheckInState = null;
  }

  @override
  void dispose() {
    selectedEmployeeNotifier.dispose();
    isLocatingNotifier.dispose();
    dutyReasonNotifier.dispose();
    controllerDutyReason.dispose();
    super.dispose();
  }

  // ─── Permission + GPS gate ────────────────────────────────────────────────

  Future<bool> _ensureLocationReady() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (!mounted) return false;

    if (permission == LocationPermission.deniedForever) {
      await _showPermissionDeniedDialog();
      return false;
    }
    if (permission == LocationPermission.denied) {
      context.showToast('location_permission_required'.tr(), isSuccess: false);
      return false;
    }

    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!mounted) return false;

    if (!serviceEnabled) {
      await _showGpsDisabledDialog();
      return false;
    }
    return true;
  }

  Future<void> _showGpsDisabledDialog() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r16)),
        title: Row(
          spacing: AppSizes.s8,
          children: [
            Icon(Icons.location_off_rounded, color: AppColors.notificationRed, size: AppSizes.s24),
            Text('location_permission_required'.tr(), style: AppTextStyles.font16Bold),
          ],
        ),
        content: Text(
          'location_services_are_disabled_please_enable_gps_to_continue'.tr(),
          style: AppTextStyles.font14Regular.copyWith(color: AppColors.lightTextSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('cancel'.tr(),
                style: AppTextStyles.font14Medium.copyWith(color: AppColors.lightTextSecondary)),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              Navigator.of(ctx).pop();
              await Geolocator.openLocationSettings();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.primaryColor,
              foregroundColor: AppColors.roleSwitchSelectedBg,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r10)),
            ),
            icon: const Icon(Icons.settings_rounded, size: AppSizes.s18),
            label: Text('enable_location'.tr(),
                style: AppTextStyles.font14SemiBold.copyWith(color: AppColors.roleSwitchSelectedBg)),
          ),
        ],
      ),
    );
  }

  Future<void> _showPermissionDeniedDialog() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r16)),
        title: Row(
          spacing: AppSizes.s8,
          children: [
            Icon(Icons.location_disabled_rounded, color: AppColors.notificationRed, size: AppSizes.s24),
            Expanded(child: Text('location_permission_required'.tr(), style: AppTextStyles.font16Bold)),
          ],
        ),
        content: Text(
          'location_permission_denied_please_grant_location_access_from_app_settings'.tr(),
          style: AppTextStyles.font14Regular.copyWith(color: AppColors.lightTextSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('cancel'.tr(),
                style: AppTextStyles.font14Medium.copyWith(color: AppColors.lightTextSecondary)),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              Navigator.of(ctx).pop();
              await Geolocator.openAppSettings();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.primaryColor,
              foregroundColor: AppColors.roleSwitchSelectedBg,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r10)),
            ),
            icon: const Icon(Icons.app_settings_alt_rounded, size: AppSizes.s18),
            label: Text('grant_permission'.tr(),
                style: AppTextStyles.font14SemiBold.copyWith(color: AppColors.roleSwitchSelectedBg)),
          ),
        ],
      ),
    );
  }

  // ─── Main action ──────────────────────────────────────────────────────────

  Future<void> _onCheckInPressed(bool isLoading) async {
    if (isLoading) return;

    // Duty reason is required
    if (dutyReasonNotifier.value.isEmpty) return;

    final empState = context.read<EmployeesCubit>().state;
    final employees = empState is EmployeesLoaded &&
            empState.getListEmployeesState is Success<GetAllEmployeesRes>
        ? (empState.getListEmployeesState as Success<GetAllEmployeesRes>)
                .data
                ?.data ??
            <DataItem>[]
        : <DataItem>[];

    if (selectedEmployeeNotifier.value.isEmpty ||
        selectedEmployeeNotifier.value.first >= employees.length) {
      context.showToast('please_select_employee_first'.tr(), isSuccess: false);
      return;
    }

    final selectedEmployee = employees[selectedEmployeeNotifier.value.first];

    isLocatingNotifier.value = true;

    try {
      // 1. Gate: permission + GPS
      final bool ready = await _ensureLocationReady();
      if (!mounted || !ready) return;

      // 2. Fetch GPS
      final pos = await PositionHelper.instance.getLatLng();
      if (!mounted) return;

      if (pos == null) {
        context.showToast('location_unavailable'.tr(), isSuccess: false);
        return;
      }

      isLocatingNotifier.value = false;

      // 3. QR scan
      final scannedToken = await Navigator.of(context).push<String>(
        MaterialPageRoute(builder: (_) => const QrCameraScannerPage()),
      );
      if (!mounted || scannedToken == null) return;
      if (!validateQrToken(context, scannedToken)) return;

      isLocatingNotifier.value = true;

      // 4. Submit
      await homeCubit.checkInFunc(
        Reload(),
        parameter: CheckInReqParam(
          qr_token: scannedToken.trim(),
          latitude: pos.latitude.toString(),
          longitude: pos.longitude.toString(),
          target_user_id: selectedEmployee.id.toString(),
          duty_reason: dutyReasonNotifier.value,
        ),
      );
    } finally {
      if (mounted) isLocatingNotifier.value = false;
    }
  }

  // ─── Listener ─────────────────────────────────────────────────────────────

  /// Only react when [checkInState] actually transitions to a new value we
  /// haven't handled yet, preventing duplicate toasts on rebuilds.
  bool _shouldListen(HomeState prev, HomeState next) {
    if (next is! HomeLoaded) return false;
    final nextCheckIn = next.checkInState;
    if (nextCheckIn == _lastHandledCheckInState) return false;
    return nextCheckIn is Success<ChechInRes> || nextCheckIn is ErrorState;
  }

  void _listener(BuildContext context, HomeState state) {
    if (state is! HomeLoaded) return;
    final checkInState = state.checkInState;

    // De-duplicate: only handle each distinct state value once.
    if (checkInState == _lastHandledCheckInState) return;
    _lastHandledCheckInState = checkInState;

    if (checkInState is Success<ChechInRes>) {
      final res = checkInState.data;
      context.showToast(
        res?.message.isNotEmpty == true ? res!.message : 'btn_check_in_gps'.tr(),
      );
      // Reset form & check-in state after screen action
      selectedEmployeeNotifier.value = [];
      controllerDutyReason.clear();
      dutyReasonNotifier.value = '';
      _resetCheckInState();
      context.pop(true);
    } else if (checkInState is ErrorState) {
      context.showToast(checkInState.failure.message, isSuccess: false);
      // Reset so error doesn't persist across navigations
      _resetCheckInState();
    }
  }
}
