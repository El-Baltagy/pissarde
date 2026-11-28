part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded({
    this.attendanceSummaryState,
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

  final BaseEmit? allWorkersEmit,
      attendanceTodayState,
      checkInState,
      checkOutState,
      attendanceHistoryState,
      attendanceCorrectionsState,
      createAttendanceCorrectionState,
      verifyBranchQrState,
      rotateBranchQrState, attendanceSummaryState;
  final HomeState? refreshOrInit;

  HomeLoaded copyWith({
    BaseEmit? attendanceSummaryState,
    BaseEmit? rotateBranchQrState,
    BaseEmit? checkOutState,
    BaseEmit? checkInState,
    bool resetCheckOut = false,
    bool resetCheckIn = false,
    BaseEmit? attendanceTodayState,
    BaseEmit? attendanceHistoryState,
    BaseEmit? attendanceCorrectionsState,
    BaseEmit? createAttendanceCorrectionState,
    BaseEmit? verifyBranchQrState,
    BaseEmit? allWorkersEmit,
    HomeState? refreshOrInit,
  }) {
    return HomeLoaded(
      attendanceSummaryState: attendanceSummaryState ?? this.attendanceSummaryState,
      rotateBranchQrState: rotateBranchQrState ?? this.rotateBranchQrState,
      checkOutState: resetCheckOut ? null : (checkOutState ?? this.checkOutState),
      checkInState: resetCheckIn ? null : (checkInState ?? this.checkInState),
      attendanceTodayState: attendanceTodayState ?? this.attendanceTodayState,
      attendanceHistoryState: attendanceHistoryState ?? this.attendanceHistoryState,
      attendanceCorrectionsState: attendanceCorrectionsState ?? this.attendanceCorrectionsState,
      createAttendanceCorrectionState:
          createAttendanceCorrectionState ?? this.createAttendanceCorrectionState,
      verifyBranchQrState: verifyBranchQrState ?? this.verifyBranchQrState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
      allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
    );
  }
}
