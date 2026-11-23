part of 'employees_cubit.dart';

@immutable
abstract class EmployeesState {}

class EmployeesLoaded extends EmployeesState {
  EmployeesLoaded({
    this.addEditEmployeeState,
    this.deleteEmployeeState,
    this.getListEmployeesState,
    this.allWorkersEmit,
    this.refreshOrInit,
  });

  final BaseEmit? allWorkersEmit,
      getListEmployeesState,
      addEditEmployeeState,
      deleteEmployeeState;
  final EmployeesState? refreshOrInit;

  EmployeesLoaded copyWith({
    BaseEmit? addEditEmployeeState,
    BaseEmit? deleteEmployeeState,
    BaseEmit? getListEmployeesState,
    BaseEmit? allWorkersEmit,
    EmployeesState? refreshOrInit,
    bool resetMutationStates = false,
  }) {
    return EmployeesLoaded(
      addEditEmployeeState: resetMutationStates
          ? null
          : (addEditEmployeeState ?? this.addEditEmployeeState),
      deleteEmployeeState: resetMutationStates
          ? null
          : (deleteEmployeeState ?? this.deleteEmployeeState),
      getListEmployeesState: getListEmployeesState ?? this.getListEmployeesState,
      allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
    );
  }
}
