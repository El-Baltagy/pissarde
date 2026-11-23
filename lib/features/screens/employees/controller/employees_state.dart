part of 'employees_cubit.dart';

@immutable
abstract class EmployeesState {}

class EmployeesLoaded extends EmployeesState {
  EmployeesLoaded({
    this.getSupervisorsState,
    this.addEditEmployeeState,
    this.deleteEmployeeState,
    this.getListEmployeesState,
    this.allWorkersEmit,
    this.refreshOrInit,
  });

  final BaseEmit? allWorkersEmit,
      getListEmployeesState,
      addEditEmployeeState,
      deleteEmployeeState, getSupervisorsState;
  final EmployeesState? refreshOrInit;

  EmployeesLoaded copyWith({
    BaseEmit? getSupervisorsState,
    BaseEmit? addEditEmployeeState,
    BaseEmit? deleteEmployeeState,
    BaseEmit? getListEmployeesState,
    BaseEmit? allWorkersEmit,
    EmployeesState? refreshOrInit,
    bool resetMutationStates = false,
  }) {
    return EmployeesLoaded(
      getSupervisorsState: getSupervisorsState ?? this.getSupervisorsState,
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
