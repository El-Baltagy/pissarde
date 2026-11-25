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

  /// Opens a time picker and formats the chosen time as `HH:mm`.
  Future<void> _pickTime(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      controller.text =
          '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
      setState(() {});
    }
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
      requested_check_in_at:date+" "+ controllerCheckIn.text.trim(),
      requested_check_out_at:date+" "+ controllerCheckOut.text.trim(),
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
