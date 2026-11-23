part of 'AddLeaveRequest_screen.dart';

abstract class AddLeaveRequestPageBaseState extends State<AddLeaveRequestPage> {
  late final RequestsCubit requestsCubit;
  final formKey = GlobalKey<FormState>();

  int? selectedLeaveTypeId;

  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldStartDate = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldEndDate = (.new(), .new());

  final TextEditingController controllerStartDate = TextEditingController();
  final TextEditingController controllerEndDate = TextEditingController();
  final TextEditingController controllerReason = TextEditingController();
  final TextEditingController controllerEmergencyPhone = TextEditingController();

  bool _isSuccessHandled = false;

  @override
  void initState() {
    super.initState();
    requestsCubit = widget.args.requestsCubit;
    requestsCubit.resetCreateLeaveRequest();
  }

  @override
  void dispose() {
    fieldStartDate.$2?.dispose();
    fieldEndDate.$2?.dispose();
    controllerStartDate.dispose();
    controllerEndDate.dispose();
    controllerReason.dispose();
    controllerEmergencyPhone.dispose();
    super.dispose();
  }

  Future<void> _pickDate(
    BuildContext context,
    TextEditingController controller, {
    bool isEnd = false,
  }) async {
    final firstDate = isEnd && controllerStartDate.text.isNotEmpty
        ? DateTime.tryParse(controllerStartDate.text) ?? DateTime.now()
        : DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: firstDate,
      firstDate: firstDate,
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      final formatted =
          '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      controller.text = formatted;
      setState(() {});
    }
  }

  Future<void> _submit() async {
    final state = requestsCubit.state;
    if (state is RequestsLoaded && state.createLeaveRequestState is Loading) {
      return;
    }

    if (formKey.currentState?.validate() != true) return;
    if (selectedLeaveTypeId == null) {
      context.showToast('leave_type_required'.tr(), isSuccess: false);
      return;
    }

    // Check date range
    final start = DateTime.tryParse(controllerStartDate.text);
    final end = DateTime.tryParse(controllerEndDate.text);
    if (start != null && end != null && end.isBefore(start)) {
      context.showToast('invalid_date_range'.tr(), isSuccess: false);
      return;
    }

    final param = CreateLeaveRequestReqParam(
      leave_type_id: selectedLeaveTypeId.toString(),
      start_date: controllerStartDate.text,
      end_date: controllerEndDate.text,
      reason: controllerReason.text.trim(),
      emergency_phone: controllerEmergencyPhone.text.trim(),
    );
    await requestsCubit.createLeaveRequestFunc(Init(), parameter: param);
  }

  void _listener(BuildContext context, RequestsState state) {
    if (state is RequestsLoaded) {
      if (state.createLeaveRequestState is Success && !_isSuccessHandled) {
        _isSuccessHandled = true;
        requestsCubit.resetCreateLeaveRequest();
        context.showToast('leave_created_success'.tr());
        context.pop(true);
      } else if (state.createLeaveRequestState is ErrorState) {
        final err = state.createLeaveRequestState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}
