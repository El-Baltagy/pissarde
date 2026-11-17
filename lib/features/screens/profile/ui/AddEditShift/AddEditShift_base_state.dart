part of 'AddEditShift_screen.dart';

abstract class AddEditShiftPageBaseState extends State<AddEditShiftPage> {
  late final ProfileCubit profileCubit;

  final formKey = GlobalKey<FormState>();

  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldName = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldCode = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldStartTime = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldEndTime = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldGrace = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldBreak = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldWindowStart = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldWindowEnd = (.new(), .new());

  final TextEditingController controllerName = .new();
  // final TextEditingController controllerCode = .new();
  final TextEditingController controllerStartTime = .new();
  final TextEditingController controllerEndTime = .new();
  final TextEditingController controllerGracePeriod = .new();
  final TextEditingController controllerBreakDuration = .new();
  final TextEditingController controllerWindowStart = .new();
  final TextEditingController controllerWindowEnd = .new();

  final ValueNotifier<List<int>> workingDaysNotifier = .new([0, 1, 2, 3, 4]);
  final ValueNotifier<bool> isOvernightNotifier = .new(false);
  final ValueNotifier<bool> isActiveNotifier = .new(true);
  late final ValueNotifier<bool> isLoadingNotifier;

  bool _isSuccessHandled = false;

  /// Whether we're editing an existing shift (true) or creating new (false).
  bool get _isEditMode => widget.args.shiftItem != null;

  @override
  void initState() {
    super.initState();
    isLoadingNotifier = .new(false);
    profileCubit = ProfileCubit.get(context: context);
    profileCubit.resetCreateShift();
    profileCubit.resetUpdateShift();

    final shift = widget.args.shiftItem;
    if (shift != null) {
      controllerName.text = shift.name;
      controllerStartTime.text = shift.start_time;
      controllerEndTime.text = shift.end_time;
      controllerGracePeriod.text = shift.grace_period_minutes.toString();
      controllerBreakDuration.text = shift.break_duration_minutes.toString();
      controllerWindowStart.text = shift.checkin_window_start_minutes.toString();
      controllerWindowEnd.text = shift.checkin_window_end_minutes.toString();
      isOvernightNotifier.value = shift.is_overnight;
      isActiveNotifier.value = shift.is_active;
      workingDaysNotifier.value = List<int>.from(shift.working_days);
    } else {
      controllerStartTime.text = '08:00';
      controllerEndTime.text = '16:00';
      controllerGracePeriod.text = '10';
      controllerBreakDuration.text = '60';
      controllerWindowStart.text = '30';
      controllerWindowEnd.text = '30';
    }
  }

  @override
  void dispose() {
    fieldName.$2?.dispose();
    fieldCode.$2?.dispose();
    fieldStartTime.$2?.dispose();
    fieldEndTime.$2?.dispose();
    fieldGrace.$2?.dispose();
    fieldBreak.$2?.dispose();
    fieldWindowStart.$2?.dispose();
    fieldWindowEnd.$2?.dispose();

    controllerName.dispose();
    controllerStartTime.dispose();
    controllerEndTime.dispose();
    controllerGracePeriod.dispose();
    controllerBreakDuration.dispose();
    controllerWindowStart.dispose();
    controllerWindowEnd.dispose();

    workingDaysNotifier.dispose();
    isOvernightNotifier.dispose();
    isActiveNotifier.dispose();
    isLoadingNotifier.dispose();

    super.dispose();
  }

  Future<void> createOrUpdateShift(bool isLoading) async {
    if (isLoading) return;

    if (await formKey.validateAndScroll(
      context,
      listRecorder: [fieldName, fieldCode, fieldStartTime, fieldEndTime],
    )) {
      final param = AddEditShiftReqParam(
        id: widget.args.shiftItem?.id,
        name: controllerName.text.trim(),

        start_time: DateTimeHelper.toHourMinute(controllerStartTime.text.trim()),
        end_time:DateTimeHelper.toHourMinute(controllerEndTime.text.trim()) ,
        is_overnight: isOvernightNotifier.value ? '1' : '0',
        grace_period_minutes: controllerGracePeriod.text.trim().isEmpty
            ? '10'
            : controllerGracePeriod.text.trim(),
        checkin_window_start_minutes: controllerWindowStart.text.trim().isEmpty
            ? '30'
            : controllerWindowStart.text.trim(),
        checkin_window_end_minutes: controllerWindowEnd.text.trim().isEmpty
            ? '30'
            : controllerWindowEnd.text.trim(),
        break_duration_minutes: controllerBreakDuration.text.trim().isEmpty
            ? '60'
            : controllerBreakDuration.text.trim(),
        working_days: workingDaysNotifier.value,
        is_active: isActiveNotifier.value ? '1' : '0',
      );

      if (_isEditMode) {
        await profileCubit.updateShiftFunc(Init(), parameter: param);
      } else {
        await profileCubit.createShiftFunc(Init(), parameter: param);
      }
    }
  }

  void createShiftListener(BuildContext context, ProfileState state) {
    if (state is ProfileLoaded) {
      // ── Create success ───────────────────────────────────────────────
      if (!_isEditMode &&
          state.createShiftState is Success &&
          !_isSuccessHandled) {
        _isSuccessHandled = true;
        final res = (state.createShiftState as Success).data;
        final message = res is ShiftCreatingRes
            ? res.message
            : 'shift_created_success'.tr();
        context.showToast(message);
        profileCubit.resetCreateShift();
        context.pop(true);
      } else if (!_isEditMode && state.createShiftState is ErrorState) {
        final err = state.createShiftState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }

      // ── Update success ───────────────────────────────────────────────
      if (_isEditMode &&
          state.updateShiftState is Success &&
          !_isSuccessHandled) {
        _isSuccessHandled = true;
        final res = (state.updateShiftState as Success).data;
        final message = res is ShiftCreatingRes
            ? res.message
            : 'shift_updated_success'.tr();
        context.showToast(message);
        profileCubit.resetUpdateShift();
        context.pop(true);
      } else if (_isEditMode && state.updateShiftState is ErrorState) {
        final err = state.updateShiftState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}

