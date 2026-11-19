part of 'profile_cubit.dart';

@immutable
  abstract class ProfileState {}

class ProfileLoaded extends ProfileState {
  ProfileLoaded({
    this.updateEmployeeState,
    this.deleteEmployeeState,

    this.deleteBranchState,
    this.updateShiftState,
    this.deleteShiftState,
    this.addEditBranchState,
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
      createShiftState, getListBranchesState, addEditBranchState, deleteShiftState, updateShiftState, deleteBranchState,   deleteEmployeeState, updateEmployeeState;
  final ProfileState? refreshOrInit;

  ProfileLoaded copyWith({
    BaseEmit? updateEmployeeState,
    BaseEmit? deleteEmployeeState,

    BaseEmit? deleteBranchState,
    BaseEmit? updateShiftState,
    BaseEmit? deleteShiftState,
    BaseEmit? addEditBranchState,
    BaseEmit? getListBranchesState,
    BaseEmit? createShiftState,
    BaseEmit? getListShiftsState,
    BaseEmit? createEmployeeState,
    BaseEmit? getListEmployeesState,
    BaseEmit? getListHolidaysState,
    BaseEmit? allWorkersEmit,
    ProfileState? refreshOrInit,
    ScreenTypeAction? screenTypeAction
    // bool clearCreateShift = false,
    // bool clearUpdateShift = false,
    // bool clearDeleteShift = false,
    // bool clearCreateBranch = false,
    // bool clearUpdateBranch = false,
    // bool clearDeleteBranch = false,
    // bool clearCreateEmployee = false,
    // bool clearUpdateEmployee = false,
    // bool clearDeleteEmployee = false,
   }) {
    return ProfileLoaded(
      updateEmployeeState: clearUpdateEmployee ? null : (updateEmployeeState ?? this.updateEmployeeState),
      deleteEmployeeState: clearDeleteEmployee ? null : (deleteEmployeeState ?? this.deleteEmployeeState),

      deleteBranchState: clearDeleteBranch ? null : (deleteBranchState ?? this.deleteBranchState),
      updateShiftState: clearUpdateShift ? null : (updateShiftState ?? this.updateShiftState),
      deleteShiftState: clearDeleteShift ? null : (deleteShiftState ?? this.deleteShiftState),
      addEditBranchState: clearCreateBranch ? null : (addEditBranchState ?? this.addEditBranchState),
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
