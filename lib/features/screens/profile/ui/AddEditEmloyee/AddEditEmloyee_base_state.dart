part of 'AddEditEmloyee_screen.dart';

abstract class AddEditEmloyeePageBaseState extends State<AddEditEmloyeePage> {
  late final ProfileCubit profileCubit;

  final formKey = GlobalKey<FormState>();

  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldName = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldEmail = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldPassword = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldCode = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldPhone = (.new(), .new());

  final TextEditingController controllerName = .new();
  final TextEditingController controllerEmail = .new();
  final TextEditingController controllerPassword = .new();
  final TextEditingController controllerCode = .new();
  final TextEditingController controllerPhone = .new();

  final ValueNotifier<bool> isActiveNotifier = .new(true);
  final ValueNotifier<bool> isPasswordVisibleNotifier = .new(false);
  late final ValueNotifier<bool> isLoadingNotifier;

  bool _isSuccessHandled = false;

  /// Whether we're editing an existing employee (true) or creating new (false).
  bool get _isEditMode => widget.args.employeeItem != null;

  @override
  void initState() {
    super.initState();
    isLoadingNotifier = .new(false);
    profileCubit = widget.args.profileCubit ?? ProfileCubit.get(context: context);
    profileCubit.resetCreateEmployee();
    profileCubit.resetUpdateEmployee();

    final employee = widget.args.employeeItem;
    if (employee != null) {
      controllerName.text = employee.name;
      controllerEmail.text = employee.email;
      controllerCode.text = employee.employee_code;
      controllerPhone.text = employee.phone;
      isActiveNotifier.value = employee.is_active;
    }
  }

  @override
  void dispose() {
    fieldName.$2?.dispose();
    fieldEmail.$2?.dispose();
    fieldPassword.$2?.dispose();
    fieldCode.$2?.dispose();
    fieldPhone.$2?.dispose();

    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerCode.dispose();
    controllerPhone.dispose();

    isActiveNotifier.dispose();
    isPasswordVisibleNotifier.dispose();
    isLoadingNotifier.dispose();

    super.dispose();
  }

  Future<void> createOrUpdateEmployee(bool isLoading) async {
    if (isLoading) return;

    final fieldsToValidate = _isEditMode
        ? [fieldName, fieldPhone]
        : [fieldName, fieldEmail, fieldPassword, fieldCode, fieldPhone];

    if (await formKey.validateAndScroll(
      context,
      listRecorder: fieldsToValidate,
    )) {
      if (_isEditMode) {
        final param = UpdateEmployeeReqParam(
          id: widget.args.employeeItem?.id,
          name: controllerName.text.trim(),
          phone: controllerPhone.text.trim(),
          is_active: isActiveNotifier.value ? '1' : '0',
        );
        await profileCubit.updateEmployeeFunc(Init(), parameter: param);
      } else {
        final param = CreateEmployeeReqParam(
          name: controllerName.text.trim(),
          email: controllerEmail.text.trim(),
          password: controllerPassword.text.trim(),
          employee_code: controllerCode.text.trim(),
          phone: controllerPhone.text.trim(),
          role: 'employee',
          employee_type: 'full_time',
          work_type: 'office',
          branch_id: '1',
          supervisor_id: '1',
          shift_id: '1',
          is_active: isActiveNotifier.value ? '1' : '0',
        );
        await profileCubit.createEmployeeFunc(Init(), parameter: param);
      }
    }
  }

  void createEmployeeListener(BuildContext context, ProfileState state) {
    if (state is ProfileLoaded) {
      // ── Create success ───────────────────────────────────────────────
      if (!_isEditMode &&
          state.createEmployeeState is Success &&
          !_isSuccessHandled) {
        _isSuccessHandled = true;
        final res = (state.createEmployeeState as Success).data;
        final message = res is CreateEmployeeRes
            ? res.message
            : 'employee_created_success'.tr();
        context.showToast(message);
        profileCubit.resetCreateEmployee();
        context.pop(true);
      } else if (!_isEditMode && state.createEmployeeState is ErrorState) {
        final err = state.createEmployeeState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }

      // ── Update success ───────────────────────────────────────────────
      if (_isEditMode &&
          state.updateEmployeeState is Success &&
          !_isSuccessHandled) {
        _isSuccessHandled = true;
        final res = (state.updateEmployeeState as Success).data;
        final message = res is CreateEmployeeRes
            ? res.message
            : 'employee_updated_success'.tr();
        context.showToast(message);
        profileCubit.resetUpdateEmployee();
        context.pop(true);
      } else if (_isEditMode && state.updateEmployeeState is ErrorState) {
        final err = state.updateEmployeeState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}
