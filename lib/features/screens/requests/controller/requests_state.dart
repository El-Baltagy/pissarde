part of 'requests_cubit.dart';

@immutable
abstract class RequestsState {}

class RequestsLoaded extends RequestsState {

  RequestsLoaded({
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit ;
  final RequestsState? refreshOrInit;

  RequestsLoaded copyWith({
    BaseEmit? allWorkersEmit, 
    RequestsState? refreshOrInit,
  }) {
    return RequestsLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
