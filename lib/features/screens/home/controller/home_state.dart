part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeLoaded extends HomeState {

  HomeLoaded({
    this.checkOutState,
    this.checkInState,
    this.attendanceTodayState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , attendanceTodayState, checkInState, checkOutState;
  final HomeState? refreshOrInit;

  HomeLoaded copyWith({
    BaseEmit? checkOutState,
    BaseEmit? checkInState,
    BaseEmit? attendanceTodayState,
    BaseEmit? allWorkersEmit, 
    HomeState? refreshOrInit,
  }) {
    return HomeLoaded(
      checkOutState: checkOutState ?? this.checkOutState,
      checkInState: checkInState ?? this.checkInState,
      attendanceTodayState: attendanceTodayState ?? this.attendanceTodayState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
