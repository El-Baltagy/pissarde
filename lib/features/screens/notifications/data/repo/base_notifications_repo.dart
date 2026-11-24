import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/base/base_remote_repo.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
import 'package:newf/features/screens/notifications/data/model/get_notifications_res/get_notifications_res.dart';
import 'package:newf/features/screens/notifications/data/model/notifications_list_param.dart';

import '../model/send_fcm_parameter.dart';

/// Abstract contract for the notifications data layer.
/// High-level modules (services) depend on this, not on concrete implementations.
abstract class BaseNotificationsRepo extends BaseRepo {
  // TODO: declare repo method signatures here

  /// Abstract contract — implemented by [NotificationsRemoteRepo].
  Future<Either<Failure, GetNotificationsRes>> getNotificationApi(
    NotificationsListParam? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [NotificationsRemoteRepo].
  Future<Either<Failure, bool>> setFcmTokenIntoDBApi(
    SendFcmParameter? parameter, {
    CancelToken? cancelToken,
  });
}
