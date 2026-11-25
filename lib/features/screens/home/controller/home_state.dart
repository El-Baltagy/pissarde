part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeLoaded extends HomeState {

  HomeLoaded({
    this.checkOutState,
    this.checkInState,
    this.attendanceTodayState,
    this.attendanceHistoryState,
    this.attendanceCorrectionsState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , attendanceTodayState, checkInState, checkOutState, attendanceHistoryState, attendanceCorrectionsState;
  final HomeState? refreshOrInit;

  HomeLoaded copyWith({
    BaseEmit? checkOutState,
    BaseEmit? checkInState,
    BaseEmit? attendanceTodayState,
    BaseEmit? attendanceHistoryState,
    BaseEmit? attendanceCorrectionsState,
    BaseEmit? allWorkersEmit, 
    HomeState? refreshOrInit,
  }) {
    return HomeLoaded(
      checkOutState: checkOutState ?? this.checkOutState,
      checkInState: checkInState ?? this.checkInState,
      attendanceTodayState: attendanceTodayState ?? this.attendanceTodayState,
      attendanceHistoryState: attendanceHistoryState ?? this.attendanceHistoryState,
      attendanceCorrectionsState: attendanceCorrectionsState ?? this.attendanceCorrectionsState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
