part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

class NotificationsLoaded extends NotificationsState {

  NotificationsLoaded({
    this.setFcmTokenIntoDBState,
    this.getNotificationState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , getNotificationState, setFcmTokenIntoDBState;
  final NotificationsState? refreshOrInit;

  NotificationsLoaded copyWith({
    BaseEmit? setFcmTokenIntoDBState,
    BaseEmit? getNotificationState,
    BaseEmit? allWorkersEmit, 
    NotificationsState? refreshOrInit,
  }) {
    return NotificationsLoaded(
      setFcmTokenIntoDBState: setFcmTokenIntoDBState ?? this.setFcmTokenIntoDBState,
      getNotificationState: getNotificationState ?? this.getNotificationState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
