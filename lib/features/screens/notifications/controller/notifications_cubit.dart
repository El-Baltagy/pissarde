import 'package:newf/core/api_helper/cancel/cancel_manager.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_service.dart';   
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/features/screens/notifications/data/model/get_notifications_res/get_notifications_res.dart';
import 'package:newf/features/screens/notifications/data/model/pagination.dart';
import 'package:newf/features/screens/notifications/data/model/notifications_list_param.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/notifications/service/base_notifications_service.dart';

import '../data/model/send_fcm_parameter.dart';
part 'notifications_state.dart';

class NotificationsCubit extends BaseCubit<NotificationsState> {
  NotificationsCubit(this._service) : super(NotificationsLoaded()) {
    instance = this;
  }

  static NotificationsCubit? instance;

  /// Depends on the abstraction [BaseNotificationsService], not on a concrete implementation.
  final BaseNotificationsService _service;
  
  static NotificationsCubit get({BuildContext? context, bool listen = false}) =>
      instance ?? BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);
  
  // Always holds the latest combined state — used by copyWith
  NotificationsLoaded get _current => state is NotificationsLoaded
      ? state as NotificationsLoaded
      : NotificationsLoaded();
      
  int get getNotificationKeyCode => AppConstant.getNotificationKeyCode;

    int get setFcmTokenIntoDBKeyCode => AppConstant.setFcmTokenIntoDBKeyCode;

  @override
  Future<void> init() async {
    await getNotificationFunc(Reload());
  }

  Future<void> getNotificationFunc(BaseRequestBackType baseRequestBackType, {NotificationsListParam? parameter}) async {
    await CancelManager.runCancelableFun(getNotificationKeyCode, (token) async {
      await _service.getNotificationServ(
        RequestCallbackObserver<GetNotificationsRes, NotificationsListParam>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(
            _current.copyWith(
              getNotificationState: (baseRequestBackType is Reload)
                  ? Loading<GetNotificationsRes>()
                  : Loading<GetNotificationsRes>(
                      _current.getNotificationState is Success<GetNotificationsRes>
                          ? (_current.getNotificationState as Success<GetNotificationsRes>).data
                          : null,
                    ),
            ),
          ),
          onRightCallback: (data) => safeEmit(
            _current.copyWith(getNotificationState: Success(data, baseRequestBackType)),
          ),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(getNotificationState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(setFcmTokenIntoDBKeyCode);

    if (instance == this) {
      instance = null;
    }
    CancelManager.cancel(getNotificationKeyCode);
    return super.close();
  }

  Future<void> setFcmTokenIntoDBFunc( SendFcmParameter  parameter ) async {
    await CancelManager.runCancelableFun(setFcmTokenIntoDBKeyCode, (token) async {
      await _service.setFcmTokenIntoDBServ(
        RequestCallbackObserver<bool, SendFcmParameter>(
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(setFcmTokenIntoDBState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(setFcmTokenIntoDBState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(setFcmTokenIntoDBState: ErrorState(failure))),
        ),
      );
    });
  }
}
