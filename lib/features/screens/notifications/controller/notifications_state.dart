part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

class NotificationsLoaded extends NotificationsState {

  NotificationsLoaded({
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit ;
  final NotificationsState? refreshOrInit;

  NotificationsLoaded copyWith({
    BaseEmit? allWorkersEmit, 
    NotificationsState? refreshOrInit,
  }) {
    return NotificationsLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
