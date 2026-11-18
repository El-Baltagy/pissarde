part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileLoaded extends ProfileState {
  ProfileLoaded({
    this.updateEmployeeState,
    this.deleteEmployeeState,
    this.updateBranchState,
    this.deleteBranchState,
    this.updateShiftState,
    this.deleteShiftState,
    this.createBranchState,
    this.getListBranchesState,
    this.createShiftState,
    this.getListShiftsState,
    this.createEmployeeState,
    this.getListEmployeesState,
    this.getListHolidaysState,
    this.allWorkersEmit,
    this.refreshOrInit,
   });

  final BaseEmit? allWorkersEmit, getListHolidaysState, getListEmployeesState, createEmployeeState, getListShiftsState,
      createShiftState, getListBranchesState, createBranchState, deleteShiftState, updateShiftState, deleteBranchState, updateBranchState, deleteEmployeeState, updateEmployeeState;
  final ProfileState? refreshOrInit;

  ProfileLoaded copyWith({
    BaseEmit? updateEmployeeState,
    BaseEmit? deleteEmployeeState,
    BaseEmit? updateBranchState,
    BaseEmit? deleteBranchState,
    BaseEmit? updateShiftState,
    BaseEmit? deleteShiftState,
    BaseEmit? createBranchState,
    BaseEmit? getListBranchesState,
    BaseEmit? createShiftState,
    BaseEmit? getListShiftsState,
    BaseEmit? createEmployeeState,
    BaseEmit? getListEmployeesState,
    BaseEmit? getListHolidaysState,
    BaseEmit? allWorkersEmit,
    ProfileState? refreshOrInit,
    bool clearCreateShift = false,
    bool clearUpdateShift = false,
    bool clearDeleteShift = false,
    bool clearCreateBranch = false,
    bool clearUpdateBranch = false,
    bool clearDeleteBranch = false,
    bool clearCreateEmployee = false,
    bool clearUpdateEmployee = false,
    bool clearDeleteEmployee = false,
   }) {
    return ProfileLoaded(
      updateEmployeeState: clearUpdateEmployee ? null : (updateEmployeeState ?? this.updateEmployeeState),
      deleteEmployeeState: clearDeleteEmployee ? null : (deleteEmployeeState ?? this.deleteEmployeeState),
      updateBranchState: clearUpdateBranch ? null : (updateBranchState ?? this.updateBranchState),
      deleteBranchState: clearDeleteBranch ? null : (deleteBranchState ?? this.deleteBranchState),
      updateShiftState: clearUpdateShift ? null : (updateShiftState ?? this.updateShiftState),
      deleteShiftState: clearDeleteShift ? null : (deleteShiftState ?? this.deleteShiftState),
      createBranchState: clearCreateBranch ? null : (createBranchState ?? this.createBranchState),
      getListBranchesState: getListBranchesState ?? this.getListBranchesState,
      createShiftState: clearCreateShift ? null : (createShiftState ?? this.createShiftState),
      getListShiftsState: getListShiftsState ?? this.getListShiftsState,
      createEmployeeState: clearCreateEmployee ? null : (createEmployeeState ?? this.createEmployeeState),
      getListEmployeesState: getListEmployeesState ?? this.getListEmployeesState,
      getListHolidaysState: getListHolidaysState ?? this.getListHolidaysState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
      allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}
