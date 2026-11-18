    import 'package:newf/core/shared/methods/print.dart';
    import 'package:newf/core/constants/app_constant.dart';
 import 'package:newf/core/base/base_state.dart';
 import 'package:newf/core/base/base_service.dart';   
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/notifications/service/base_notifications_service.dart';
part 'notifications_state.dart';

class NotificationsCubit extends BaseCubit<NotificationsState> {
   NotificationsCubit(this._service) : super(NotificationsLoaded()) ;

  /// Depends on the abstraction [BaseNotificationsService], not on a concrete implementation.
  final BaseNotificationsService _service;
  
     static NotificationsCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
    // Always holds the latest combined state — used by copyWith
   NotificationsLoaded get _current => state is NotificationsLoaded
       ? state as NotificationsLoaded
       : NotificationsLoaded();
       
    Future<void> init() async {
     // TODO: implement init

   }
  
}
