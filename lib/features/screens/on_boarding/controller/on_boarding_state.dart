part of 'on_boarding_cubit.dart';

@immutable
abstract class OnBoardingState {}

class OnBoardingLoaded extends OnBoardingState {

  OnBoardingLoaded({
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit ;
  final OnBoardingState? refreshOrInit;

  OnBoardingLoaded copyWith({
    BaseEmit? allWorkersEmit, 
    OnBoardingState? refreshOrInit,
  }) {
    return OnBoardingLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
