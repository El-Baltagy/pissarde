part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeLoaded extends HomeState {

  HomeLoaded({
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit ;
  final HomeState? refreshOrInit;

  HomeLoaded copyWith({
    BaseEmit? allWorkersEmit, 
    HomeState? refreshOrInit,
  }) {
    return HomeLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
