part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileLoaded extends ProfileState {
  ProfileLoaded({
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
      createShiftState, getListBranchesState, createBranchState, deleteShiftState, updateShiftState;
  final ProfileState? refreshOrInit;

  ProfileLoaded copyWith({
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
   }) {
    return ProfileLoaded(
      updateShiftState: updateShiftState ?? this.updateShiftState,
      deleteShiftState: deleteShiftState ?? this.deleteShiftState,
      createBranchState: createBranchState ?? this.createBranchState,
      getListBranchesState: getListBranchesState ?? this.getListBranchesState,
      createShiftState: createShiftState ?? this.createShiftState,
      getListShiftsState: getListShiftsState ?? this.getListShiftsState,
      createEmployeeState: createEmployeeState ?? this.createEmployeeState,
      getListEmployeesState: getListEmployeesState ?? this.getListEmployeesState,
      getListHolidaysState: getListHolidaysState ?? this.getListHolidaysState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
      allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}
