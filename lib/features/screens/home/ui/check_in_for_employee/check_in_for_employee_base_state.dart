part of 'check_in_for_employee_screen.dart';

abstract class CheckInForEmployeePageBaseState
    extends State<CheckInForEmployeePage> {
  late final HomeCubit homeCubit;
  final ValueNotifier<List<int>> selectedEmployeeNotifier =
      ValueNotifier<List<int>>([]);
  final ValueNotifier<bool> isLocatingNotifier = ValueNotifier<bool>(false);
  final TextEditingController controllerDutyReason = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context: context);
    context.read<EmployeesCubit>().getListEmployeesFunc(
          Init(),
          parameter: EmployeesListParam(page: 0),
        );
  }

  @override
  void dispose() {
    selectedEmployeeNotifier.dispose();
    isLocatingNotifier.dispose();
    controllerDutyReason.dispose();
    super.dispose();
  }

  /// Validates employee selection, scans the QR code, fetches GPS coordinates,
  /// and sends a check-in request on behalf of the selected employee.
  Future<void> _onCheckInPressed(bool isLoading) async {
    if (isLoading) return;

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

    final scannedToken = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const QrCameraScannerPage()),
    );

    if (!mounted || scannedToken == null || scannedToken.trim().isEmpty) {
      return;
    }

    isLocatingNotifier.value = true;
    try {
      final pos = await PositionHelper.instance.getLatLng();
      if (!mounted) return;

      await homeCubit.checkInFunc(
        Reload(),
        parameter: CheckInReqParam(
          qr_token: scannedToken.trim(),
          latitude: pos?.latitude.toString() ?? '0.0',
          longitude: pos?.longitude.toString() ?? '0.0',
          target_user_id: selectedEmployee.id.toString(),
          duty_reason: controllerDutyReason.text.trim(),
        ),
      );
    } finally {
      if (mounted) {
        isLocatingNotifier.value = false;
      }
    }
  }

  /// Displays check-in result feedback and pops back on success.
  void _listener(BuildContext context, HomeState state) {
    if (state is! HomeLoaded) return;

    if (state.checkInState is Success<ChechInRes>) {
      final res = (state.checkInState as Success<ChechInRes>).data;
      context.showToast(
        res?.message.isNotEmpty == true ? res!.message : 'btn_check_in_gps'.tr(),
      );
      context.pop(true);
    } else if (state.checkInState is ErrorState) {
      final err = state.checkInState as ErrorState;
      context.showToast(err.failure.message, isSuccess: false);
    }
  }
}
