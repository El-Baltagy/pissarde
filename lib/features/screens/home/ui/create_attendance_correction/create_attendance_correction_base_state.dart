part of 'create_attendance_correction_screen.dart';

abstract class CreateAttendanceCorrectionPageBaseState
    extends State<CreateAttendanceCorrectionPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController controllerDate = TextEditingController();
  final TextEditingController controllerCheckIn = TextEditingController();
  final TextEditingController controllerCheckOut = TextEditingController();
  final TextEditingController controllerReason = TextEditingController();

  bool _isSuccessHandled = false;

  @override
  void dispose() {
    controllerDate.dispose();
    controllerCheckIn.dispose();
    controllerCheckOut.dispose();
    controllerReason.dispose();
    super.dispose();
  }

  /// Opens a date picker and formats the chosen date as `yyyy-MM-dd`.
  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final initial = DateTime.tryParse(controllerDate.text) ?? now;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: now.subtract(const Duration(days: 365)),
      lastDate: now,
    );
    if (picked != null) {
      controllerDate.text =
          '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      setState(() {});
    }
  }

  TimeOfDay? _parseTime(String value) {
    final parts = value.trim().split(':');
    if (parts.length != 2) return null;
    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);
    if (hour == null || minute == null) return null;
    return TimeOfDay(hour: hour, minute: minute);
  }

  int _toMinutes(TimeOfDay time) => time.hour * 60 + time.minute;

  /// Opens a time picker and formats the chosen time as `HH:mm`.
  Future<void> _pickTime(
    BuildContext context,
    TextEditingController controller, {
    bool isCheckOut = false,
  }) async {
    TimeOfDay? checkInTime;
    if (isCheckOut) {
      checkInTime = _parseTime(controllerCheckIn.text);
      if (checkInTime == null) {
        context.showToast('please_select_check_in_first'.tr(), isSuccess: false);
        return;
      }
    }

    final initialTime = _parseTime(controller.text) ??
        (isCheckOut ? checkInTime! : TimeOfDay.now());

    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (picked == null) return;

    if (isCheckOut &&
        checkInTime != null &&
        _toMinutes(picked) <= _toMinutes(checkInTime)) {
      if (context.mounted) {
        context.showToast(
          'check_out_time_must_be_after_check_in_time'.tr(),
          isSuccess: false,
        );
      }
      return;
    }

    controller.text =
        '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';

    if (!isCheckOut) {
      final existingCheckOut = _parseTime(controllerCheckOut.text);
      if (existingCheckOut != null &&
          _toMinutes(existingCheckOut) <= _toMinutes(picked)) {
        controllerCheckOut.clear();
      }
    }

    setState(() {});
  }

  /// Validates the form and submits the attendance correction request.
  Future<void> _submit() async {
    final cubit = context.read<HomeCubit>();
    final state = cubit.state;
    if (state is HomeLoaded && state.createAttendanceCorrectionState is Loading) {
      return;
    }

    if (formKey.currentState?.validate() != true) return;
    final String date=controllerDate.text.trim();
    final param = CreateAttendanceCorrectionReqParam(
      date: date,
      requested_check_in_at: '$date ${controllerCheckIn.text.trim()}',
      requested_check_out_at: '$date ${controllerCheckOut.text.trim()}',
      reason: controllerReason.text.trim(),
    );
    await cubit.createAttendanceCorrectionFunc(Init(), parameter: param);
  }

  /// Handles submission feedback and pops on success.
  void _listener(BuildContext context, HomeState state) {
    if (state is HomeLoaded) {
      if (state.createAttendanceCorrectionState is Success &&
          !_isSuccessHandled) {
        _isSuccessHandled = true;
        context.showToast('attendance_correction_sent_successfully'.tr());
        context.pop(true);
      } else if (state.createAttendanceCorrectionState is ErrorState) {
        final err = state.createAttendanceCorrectionState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}
