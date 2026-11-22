import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/constants/app_api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newf/core/api_helper/caller_tag.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/core/api_helper/response_handler.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
import 'package:newf/features/screens/notifications/data/model/get_notifications_res/get_notifications_res.dart';
import 'package:newf/features/screens/notifications/data/repo/base_notifications_repo.dart';

import '../model/send_fcm_parameter.dart';

/// Concrete remote implementation of [BaseNotificationsRepo].
class NotificationsRemoteRepo implements BaseNotificationsRepo {
  final DioHelper dio;
  NotificationsRemoteRepo(this.dio);

  @override
  Future<Either<Failure, GetNotificationsRes>> getNotificationApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getNotification,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: GetNotificationsRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, bool>> setFcmTokenIntoDBApi(
    SendFcmParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.setFcmTokenIntoDB,
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject:  (map) => map['success']==true  ,
    );
  }
}
