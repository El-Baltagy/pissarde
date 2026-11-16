part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileLoaded extends ProfileState {
  ProfileLoaded({
    this.allWorkersEmit,
    this.refreshOrInit,
    this.listEmployeesEmit,
    this.createEmployeeEmit,
    this.listShiftsEmit,
    this.createShiftEmit,
    this.listBranchesEmit,
    this.createBranchEmit,
  });

  final BaseEmit? allWorkersEmit;
  final ProfileState? refreshOrInit;
  final BaseEmit? listEmployeesEmit;
  final BaseEmit? createEmployeeEmit;
  final BaseEmit? listShiftsEmit;
  final BaseEmit? createShiftEmit;
  final BaseEmit? listBranchesEmit;
  final BaseEmit? createBranchEmit;

  ProfileLoaded copyWith({
    BaseEmit? allWorkersEmit,
    ProfileState? refreshOrInit,
    BaseEmit? listEmployeesEmit,
    BaseEmit? createEmployeeEmit,
    BaseEmit? listShiftsEmit,
    BaseEmit? createShiftEmit,
    BaseEmit? listBranchesEmit,
    BaseEmit? createBranchEmit,
  }) {
    return ProfileLoaded(
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
