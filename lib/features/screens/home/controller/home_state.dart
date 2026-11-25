part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeLoaded extends HomeState {

  HomeLoaded({
    this.rotateBranchQrState,
    this.checkOutState,
    this.checkInState,
    this.attendanceTodayState,
    this.attendanceHistoryState,
    this.attendanceCorrectionsState,
    this.createAttendanceCorrectionState,
    this.verifyBranchQrState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , attendanceTodayState, checkInState, checkOutState, attendanceHistoryState, attendanceCorrectionsState, createAttendanceCorrectionState, verifyBranchQrState, rotateBranchQrState;
  final HomeState? refreshOrInit;

  HomeLoaded copyWith({
    BaseEmit? rotateBranchQrState,
    BaseEmit? checkOutState,
    BaseEmit? checkInState,
    BaseEmit? attendanceTodayState,
    BaseEmit? attendanceHistoryState,
    BaseEmit? attendanceCorrectionsState,
    BaseEmit? createAttendanceCorrectionState,
    BaseEmit? verifyBranchQrState,
    BaseEmit? allWorkersEmit, 
    HomeState? refreshOrInit,
  }) {
    return HomeLoaded(
      rotateBranchQrState: rotateBranchQrState ?? this.rotateBranchQrState,
      checkOutState: checkOutState ?? this.checkOutState,
      checkInState: checkInState ?? this.checkInState,
      attendanceTodayState: attendanceTodayState ?? this.attendanceTodayState,
      attendanceHistoryState: attendanceHistoryState ?? this.attendanceHistoryState,
      attendanceCorrectionsState: attendanceCorrectionsState ?? this.attendanceCorrectionsState,
      createAttendanceCorrectionState: createAttendanceCorrectionState ?? this.createAttendanceCorrectionState,
      verifyBranchQrState: verifyBranchQrState ?? this.verifyBranchQrState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
