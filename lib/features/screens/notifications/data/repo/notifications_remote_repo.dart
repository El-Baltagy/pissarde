import 'package:newf/core/shared/methods/print.dart';
import 'package:newf/core/constants/app_api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newf/core/api_helper/caller_tag.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/core/api_helper/response_handler.dart';
import 'package:newf/features/screens/notifications/data/repo/base_notifications_repo.dart';

/// Concrete remote implementation of [BaseNotificationsRepo].
class NotificationsRemoteRepo implements BaseNotificationsRepo {
  final DioHelper dio;
  NotificationsRemoteRepo(this.dio);
}
