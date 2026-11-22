part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

class NotificationsLoaded extends NotificationsState {

  NotificationsLoaded({
    this.getNotificationState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , getNotificationState;
  final NotificationsState? refreshOrInit;

  NotificationsLoaded copyWith({
    BaseEmit? getNotificationState,
    BaseEmit? allWorkersEmit, 
    NotificationsState? refreshOrInit,
  }) {
    return NotificationsLoaded(
      getNotificationState: getNotificationState ?? this.getNotificationState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
