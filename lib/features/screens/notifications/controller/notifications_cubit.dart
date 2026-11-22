import 'package:newf/core/api_helper/cancel/cancel_manager.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_service.dart';   
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/features/screens/notifications/data/model/get_notifications_res/get_notifications_res.dart';
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
       
      int get getNotificationKeyCode => AppConstant.getNotificationKeyCode;

  @override
  Future<void> init() async {
    await getNotificationFunc(Init());
  }
  

  Future<void> getNotificationFunc(BaseRequestBackType baseRequestBackType,{NoParameters? parameter}) async {
    await CancelManager.runCancelableFun(getNotificationKeyCode, (token) async {
      await _service.getNotificationServ(
        RequestCallbackObserver<GetNotificationsRes, NoParameters>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(getNotificationState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(getNotificationState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(getNotificationState: ErrorState(failure))),
        ),
      );
    });
  }
  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(getNotificationKeyCode);
    return super.close();
  }
}
