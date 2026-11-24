part of 'AddEditEmloyee_screen.dart';

// Type aliases to disambiguate DataItem from different models that share the name.
typedef BranchesList = branches_model.BranchesList;
typedef DataItemBranch = branches_model.DataItem;
typedef GetAllEmployeesRes = employees_model.GetAllEmployeesRes;
typedef DataItemEmployee = employees_model.DataItem;

abstract class AddEditEmloyeePageBaseState extends State<AddEditEmloyeePage> {
  late final EmployeesCubit employeesCubit;
  late final BranchesCubit branchesCubit;
  late final ShiftsCubit shiftsCubit;

  final formKey = GlobalKey<FormState>();
  late List<(GlobalKey<FormFieldState<dynamic>>, FocusNode?)> listFileds =
      List.generate(9, (index) => (.new(), .new()));

  final TextEditingController controllerName = .new();
  final TextEditingController controllerEmail = .new();
  final TextEditingController controllerPassword = .new();
  final TextEditingController controllerCode = .new();
  final TextEditingController controllerPhone = .new();

  final ValueNotifier<bool> isActiveNotifier = .new(true);
  late final ValueNotifier<bool> isLoadingNotifier;

  /// Holds the selected branch index (single-select → list of one index).
  final ValueNotifier<List<int>> selectedBranchNotifier = .new([]);

  /// Holds the selected shift index.
  final ValueNotifier<List<int>> selectedShiftNotifier = .new([]);

  /// Holds the selected supervisor index.
  final ValueNotifier<List<int>> selectedSupervisorNotifier = .new([]);
  final ValueNotifier<List<int>> selectedRoleNotifier = .new([]);
  final ValueNotifier<List<int>> selectedEmployeeTypeNotifier = .new([]);
  final ValueNotifier<List<int>> selectedWorkTypeNotifier = .new([]);

  /// Whether we're editing an existing employee (true) or creating new (false).
  bool get _isEditMode => widget.args.employeeItem != null;

  @override
  void initState() {
    super.initState();
    isLoadingNotifier = .new(false);
    employeesCubit = EmployeesCubit.get(context: context);
    branchesCubit = BranchesCubit.get(context: context);
    shiftsCubit = ShiftsCubit.get(context: context);
    employeesCubit.resetStateAfterSuccess();

    final employee = widget.args.employeeItem;
    if (employee != null) {
      controllerName.text = employee.name;
      controllerEmail.text = employee.email;
      controllerCode.text = employee.employee_code;
      controllerPhone.text = employee.phone;
      isActiveNotifier.value = employee.is_active;
    }
    Future.wait([
      branchesCubit.getListBranchesFunc(Init()),
      shiftsCubit.getListShiftsFunc(Init()),
      employeesCubit.getSupervisorsFunc(Reload()),
    ]);
  }

  @override
  void dispose() {
    for (int i = 0; i < listFileds.length; i++) {
      listFileds[i].$2?.dispose();
    }

    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerCode.dispose();
    controllerPhone.dispose();
     isActiveNotifier.dispose();
    isLoadingNotifier.dispose();
     selectedBranchNotifier.dispose();
    selectedShiftNotifier.dispose();
    selectedSupervisorNotifier.dispose();
    selectedRoleNotifier.dispose();
    selectedEmployeeTypeNotifier.dispose();
    selectedWorkTypeNotifier.dispose();

    super.dispose();
  }

  /// Returns the selected branch's id from [getListBranchesState], or empty string.
  String _selectedBranchId() {
    if (selectedBranchNotifier.value.isEmpty) return '';
    final state = branchesCubit.state;
    if (state is! BranchesLoaded) return '';
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
    final state = shiftsCubit.state;
    if (state is! ShiftsLoaded) return '';
    if (state.getListShiftsState is! Success<GetAllShiftsRes>) return '';
    final shifts =
        (state.getListShiftsState as Success<GetAllShiftsRes>).data?.data ?? [];
    final idx = selectedShiftNotifier.value.first;
    if (idx < 0 || idx >= shifts.length) return '';
    return shifts[idx].id.toString();
  }

  /// Returns the selected supervisor's id from [getListEmployeesState], or empty string.
  String? _selectedSupervisorId() {
    if (selectedSupervisorNotifier.value.isEmpty) return null;
    final state = employeesCubit.state;
    if (state is! EmployeesLoaded) return '';
    if (state.getListEmployeesState is! Success<GetAllEmployeesRes>) return '';
    final employees =
        (state.getListEmployeesState as Success<GetAllEmployeesRes>)
            .data
            ?.data ??
        [];
    final idx = selectedSupervisorNotifier.value.first;
    if (idx < 0 || idx >= employees.length) return '';
    return employees[idx].id.toString();
  }


  Future<void> createOrUpdateEmployee(bool isLoading) async {
    if (await formKey.validateAndScroll(context, listRecorder: listFileds)) {
      final param = CreateEmployeeReqParam(
        employee_id: widget.args.employeeItem?.id.toString(),
        name: controllerName.text.trim(),
        email: controllerEmail.text.trim(),
        password: controllerPassword.text.trim(),
        employee_code: controllerCode.text.trim(),
        phone: controllerPhone.text.trim(),
        role: RoleSelector.list[selectedRoleNotifier.value.first].$2.apiValue,
        employee_type:
            TypeSelector.list[selectedEmployeeTypeNotifier.value.first].apiValue,
        work_type: WorkTypeSelector.list[selectedWorkTypeNotifier.value.first].apiValue,

        branch_id:_selectedBranchId(),
        supervisor_id: _selectedSupervisorId(),
        shift_id: _selectedShiftId(),
        is_active: isActiveNotifier.value ? '1' : '0',
      );
      await employeesCubit.addEditEmployeeFunc(parameter: param);
    }
  }

  void addEditEmployeeListener(BuildContext context, EmployeesState state) {
    if (state is EmployeesLoaded) {
      // ── Create / Update success ──────────────────────────────────────
      if (state.addEditEmployeeState is Success) {
        final res = (state.addEditEmployeeState as Success).data;
        final message = res is CreateEmployeeRes
            ? res.message
            : (!_isEditMode
                  ? 'employee_created_success'.tr()
                  : 'employee_updated_success'.tr());
        context.showToast(message);
        // employeesCubit.resetStateAfterSuccess();
        context.pop();
      } else if (state.addEditEmployeeState is ErrorState) {
        final err = state.addEditEmployeeState as ErrorState;
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}
