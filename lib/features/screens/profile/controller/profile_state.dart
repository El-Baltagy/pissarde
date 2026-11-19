part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileLoaded extends ProfileState {
  ProfileLoaded({
    this.addEditEmployeeState,
    this.deleteEmployeeState,

    this.deleteBranchState,
     this.deleteShiftState,
    this.addEditBranchState,
    this.getListBranchesState,
    this.addEditShiftState,
    this.getListShiftsState,
    this.getListEmployeesState,
    this.getListHolidaysState,
    this.allWorkersEmit,
    this.refreshOrInit,
  });

  final BaseEmit? allWorkersEmit,
      getListHolidaysState,
      getListEmployeesState,
      // createEmployeeState,
      getListShiftsState,
      addEditShiftState,
      getListBranchesState,
      addEditBranchState,
      deleteShiftState,
       deleteBranchState,
      deleteEmployeeState,
      addEditEmployeeState;
  final ProfileState? refreshOrInit;

  /// Returns a copy of this state with the given fields replaced.
  ///
  /// When [screenTypeAction] is provided, the mutation (create / update /
  /// delete) states belonging to that screen are cleared. This is how the
  /// cubit and the screens reset stale `Success` / `ErrorState` results so a
  /// listener is not triggered again on a later, unrelated emit.
  /// List states are intentionally kept.
  ProfileLoaded copyWith({
    BaseEmit? addEditEmployeeState,
    BaseEmit? deleteEmployeeState,

    BaseEmit? deleteBranchState,
     BaseEmit? deleteShiftState,
    BaseEmit? addEditBranchState,
    BaseEmit? getListBranchesState,
    BaseEmit? addEditShiftState,
    BaseEmit? getListShiftsState,
    BaseEmit? getListEmployeesState,
    BaseEmit? getListHolidaysState,
    BaseEmit? allWorkersEmit,
    ProfileState? refreshOrInit,
    ScreenTypeAction? screenTypeAction,
  }) {
    final bool resetShift = screenTypeAction == ScreenTypeAction.shift;
    final bool resetBranch = screenTypeAction == ScreenTypeAction.branch;
    final bool resetEmployee = screenTypeAction == ScreenTypeAction.employee;

    return ProfileLoaded(
      addEditEmployeeState: resetEmployee
          ? null
          : (addEditEmployeeState ?? this.addEditEmployeeState),
      deleteEmployeeState: resetEmployee
          ? null
          : (deleteEmployeeState ?? this.deleteEmployeeState),


      addEditShiftState: resetShift
          ? null
          : (addEditShiftState ?? this.addEditShiftState),
      deleteShiftState: resetShift
          ? null
          : (deleteShiftState ?? this.deleteShiftState),


      addEditBranchState: resetBranch
          ? null
          : (addEditBranchState ?? this.addEditBranchState),
      deleteBranchState: resetBranch
          ? null
          : (deleteBranchState ?? this.deleteBranchState),




      getListShiftsState: getListShiftsState ?? this.getListShiftsState,
      getListBranchesState: getListBranchesState ?? this.getListBranchesState,
      getListEmployeesState:
          getListEmployeesState ?? this.getListEmployeesState,
      getListHolidaysState: getListHolidaysState ?? this.getListHolidaysState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
      allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
    );
  }
}
