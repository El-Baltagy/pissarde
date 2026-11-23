part of 'AddEditEmloyee_screen.dart';

// Type aliases to disambiguate DataItem from different models that share the name.
typedef BranchesList = branches_model.BranchesList;
typedef DataItemBranch = branches_model.DataItem;
typedef GetAllEmployeesRes = employees_model.GetAllEmployeesRes;
typedef DataItemEmployee = employees_model.DataItem;
abstract class AddEditEmloyeePageBaseState extends State<AddEditEmloyeePage> {
  late final ProfileCubit profileCubit;

  final formKey = GlobalKey<FormState>();

  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldName = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldEmail = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldPassword = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldCode = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldPhone = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldBranch = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldShift = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldSupervisor = (.new(), .new());

  final TextEditingController controllerName = .new();
  final TextEditingController controllerEmail = .new();
  final TextEditingController controllerPassword = .new();
  final TextEditingController controllerCode = .new();
  final TextEditingController controllerPhone = .new();

  final ValueNotifier<bool> isActiveNotifier = .new(true);
  final ValueNotifier<bool> isPasswordVisibleNotifier = .new(false);
  late final ValueNotifier<bool> isLoadingNotifier;

  /// Holds the selected branch index (single-select → list of one index).
  final ValueNotifier<List<int>> selectedBranchNotifier = .new([]);

  /// Holds the selected shift index.
  final ValueNotifier<List<int>> selectedShiftNotifier = .new([]);

  /// Holds the selected supervisor index.
  final ValueNotifier<List<int>> selectedSupervisorNotifier = .new([]);

  bool _isSuccessHandled = false;

  /// Whether we're editing an existing employee (true) or creating new (false).
  bool get _isEditMode => widget.args.employeeItem != null;

  @override
  void initState() {
    super.initState();
    isLoadingNotifier = .new(false);
    profileCubit =
        widget.args.profileCubit ?? ProfileCubit.get(context: context);
    profileCubit.resetStateAfterSuccess(ScreenTypeAction.employee);

    final employee = widget.args.employeeItem;
    if (employee != null) {
      controllerName.text = employee.name;
      controllerEmail.text = employee.email;
      controllerCode.text = employee.employee_code;
      controllerPhone.text = employee.phone;
      isActiveNotifier.value = employee.is_active;

      // Pre-select branch, shift, supervisor when editing
      Future.delayed(const Duration(milliseconds: 300), () {
        _preselectBranch(employee);
        _preselectShift(employee);
        _preselectSupervisor(employee);
      });
    }
  }

  /// Pre-selects the branch that matches the employee's current branch.
  void _preselectBranch(DataItemEmployee employee) {
    final state = profileCubit.state;
    if (state is! ProfileLoaded) return;
    if (state.getListBranchesState is! Success<BranchesList>) return;
    final branches =
        (state.getListBranchesState as Success<BranchesList>).data?.data ?? [];
    final idx = branches.indexWhere((b) => b.id == employee.branch.id);
    if (idx != -1) selectedBranchNotifier.value = [idx];
  }

  /// Pre-selects the shift that matches the employee's current shift.
  void _preselectShift(DataItemEmployee employee) {
    final state = profileCubit.state;
    if (state is! ProfileLoaded) return;
    if (state.getListShiftsState is! Success<GetAllShiftsRes>) return;
    final shifts =
        (state.getListShiftsState as Success<GetAllShiftsRes>).data?.data ?? [];
    final idx = shifts.indexWhere((s) => s.id == employee.shift.id);
    if (idx != -1) selectedShiftNotifier.value = [idx];
  }

  /// Pre-selects the supervisor that matches the employee's current supervisor.
  void _preselectSupervisor(DataItemEmployee employee) {
    final supervisorId = employee.supervisor?.id;
    if (supervisorId == null) return;
    final state = profileCubit.state;
    if (state is! ProfileLoaded) return;
    if (state.getListEmployeesState is! Success<GetAllEmployeesRes>) return;
    final employees =
        (state.getListEmployeesState as Success<GetAllEmployeesRes>).data?.data ??
            [];
    final idx = employees.indexWhere((e) => e.id == supervisorId);
    if (idx != -1) selectedSupervisorNotifier.value = [idx];
  }

  @override
  void dispose() {
    fieldName.$2?.dispose();
    fieldEmail.$2?.dispose();
    fieldPassword.$2?.dispose();
    fieldCode.$2?.dispose();
    fieldPhone.$2?.dispose();
    fieldBranch.$2?.dispose();
    fieldShift.$2?.dispose();
    fieldSupervisor.$2?.dispose();

    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerCode.dispose();
    controllerPhone.dispose();

    isActiveNotifier.dispose();
    isPasswordVisibleNotifier.dispose();
    isLoadingNotifier.dispose();

    selectedBranchNotifier.dispose();
    selectedShiftNotifier.dispose();
    selectedSupervisorNotifier.dispose();

    super.dispose();
  }

  /// Returns the selected branch's id from [getListBranchesState], or empty string.
  String _selectedBranchId() {
    if (selectedBranchNotifier.value.isEmpty) return '';
    final state = profileCubit.state;
    if (state is! ProfileLoaded) return '';
    if (state.getListBranchesState is! Success<BranchesList>) return '';
    final branches =
        (state.getListBranchesState as Success<BranchesList>).data?.data ?? [];
    final idx = selectedBranchNotifier.value.first;
    if (idx < 0 || idx >= branches.length) return '';
    return branches[idx].id.toString();
  }

  /// Returns the selected shift's id from [getListShiftsState], or empty string.
  String _selectedShiftId() {
    if (selectedShiftNotifier.value.isEmpty) return '';
    final state = profileCubit.state;
    if (state is! ProfileLoaded) return '';
    if (state.getListShiftsState is! Success<GetAllShiftsRes>) return '';
    final shifts =
        (state.getListShiftsState as Success<GetAllShiftsRes>).data?.data ?? [];
    final idx = selectedShiftNotifier.value.first;
    if (idx < 0 || idx >= shifts.length) return '';
    return shifts[idx].id.toString();
  }

  /// Returns the selected supervisor's id from [getListEmployeesState], or empty string.
  String _selectedSupervisorId() {
    if (selectedSupervisorNotifier.value.isEmpty) return '';
    final state = profileCubit.state;
    if (state is! ProfileLoaded) return '';
    if (state.getListEmployeesState is! Success<GetAllEmployeesRes>) return '';
    final employees =
        (state.getListEmployeesState as Success<GetAllEmployeesRes>).data?.data ??
            [];
    final idx = selectedSupervisorNotifier.value.first;
    if (idx < 0 || idx >= employees.length) return '';
    return employees[idx].id.toString();
  }

  Future<void> createOrUpdateEmployee(bool isLoading) async {
    if (isLoading) return;

    final fieldsToValidate = _isEditMode
        ? [fieldName, fieldPhone]
        : [
            fieldName,
            fieldEmail,
            fieldPassword,
            fieldCode,
            fieldPhone,
            fieldBranch,
            fieldShift,
            fieldSupervisor,
          ];

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
          branch_id: _selectedBranchId(),
          supervisor_id: _selectedSupervisorId(),
          shift_id: _selectedShiftId(),
          is_active: isActiveNotifier.value ? '1' : '0',
        );
        await profileCubit.createEmployeeFunc(Init(), parameter: param);
      }
    }
  }

  void createEmployeeListener(BuildContext context, ProfileState state) {
    if (state is ProfileLoaded) {
      // ── Create / Update success ──────────────────────────────────────
      if (state.addEditEmployeeState is Success && !_isSuccessHandled) {
        _isSuccessHandled = true;
        final res = (state.addEditEmployeeState as Success).data;
        final message = res is CreateEmployeeRes
            ? res.message
            : (!_isEditMode
                ? 'employee_created_success'.tr()
                : 'employee_updated_success'.tr());
        context.showToast(message);
        profileCubit.resetStateAfterSuccess(.employee);
        context.pop(true);
      } else if (state.addEditEmployeeState is ErrorState) {
        final err = state.addEditEmployeeState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}
