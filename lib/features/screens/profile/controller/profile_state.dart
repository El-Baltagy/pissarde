part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileLoaded extends ProfileState {
  ProfileLoaded({
    this.createBranchState,
    this.getListBranchesState,
    this.createShiftState,
    this.getListShiftsState,
    this.createEmployeeState,
    this.getListEmployeesState,
    this.getListHolidaysState,
    this.allWorkersEmit,
    this.refreshOrInit,
    this.listEmployeesEmit,
    this.createEmployeeEmit,
    this.listShiftsEmit,
    this.createShiftEmit,
    this.listBranchesEmit,
    this.createBranchEmit,
   });

  final BaseEmit? allWorkersEmit, getListHolidaysState, getListEmployeesState, createEmployeeState, getListShiftsState, createShiftState, getListBranchesState, createBranchState;
  final ProfileState? refreshOrInit;
  final BaseEmit? listEmployeesEmit;
  final BaseEmit? createEmployeeEmit;
  final BaseEmit? listShiftsEmit;
  final BaseEmit? createShiftEmit;
  final BaseEmit? listBranchesEmit;
  final BaseEmit? createBranchEmit;

  ProfileLoaded copyWith({
    BaseEmit? createBranchState,
    BaseEmit? getListBranchesState,
    BaseEmit? createShiftState,
    BaseEmit? getListShiftsState,
    BaseEmit? createEmployeeState,
    BaseEmit? getListEmployeesState,
    BaseEmit? getListHolidaysState,
    BaseEmit? allWorkersEmit,
    ProfileState? refreshOrInit,
    BaseEmit? listEmployeesEmit,
    BaseEmit? createEmployeeEmit,
    BaseEmit? listShiftsEmit,
    BaseEmit? createShiftEmit,
    BaseEmit? listBranchesEmit,
    BaseEmit? createBranchEmit,
    // BaseEmit? listHolidaysEmit,
  }) {
    return ProfileLoaded(
      createBranchState: createBranchState ?? this.createBranchState,
      getListBranchesState: getListBranchesState ?? this.getListBranchesState,
      createShiftState: createShiftState ?? this.createShiftState,
      getListShiftsState: getListShiftsState ?? this.getListShiftsState,
      createEmployeeState: createEmployeeState ?? this.createEmployeeState,
      getListEmployeesState: getListEmployeesState ?? this.getListEmployeesState,
      getListHolidaysState: getListHolidaysState ?? this.getListHolidaysState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
      allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
      listEmployeesEmit: listEmployeesEmit ?? this.listEmployeesEmit,
      createEmployeeEmit: createEmployeeEmit ?? this.createEmployeeEmit,
      listShiftsEmit: listShiftsEmit ?? this.listShiftsEmit,
      createShiftEmit: createShiftEmit ?? this.createShiftEmit,
      listBranchesEmit: listBranchesEmit ?? this.listBranchesEmit,
      createBranchEmit: createBranchEmit ?? this.createBranchEmit,
     );
  }
}
