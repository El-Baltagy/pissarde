import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/base/base_remote_repo.dart';
import 'package:newf/features/screens/login/data/model/login_res/login_res.dart';

import '../../../../../core/shared/methods/no_parameter.dart';
import '../model/login_req_param.dart';

/// Abstract contract for the login data layer.
abstract class BaseLoginRepo extends BaseRepo {
  Future<Either<Failure, LoginRes>> loginApi(
      LoginReqParam? parameter, {
    CancelToken? cancelToken,
  });



  /// Abstract contract — implemented by [LoginRemoteRepo].
  Future<Either<Failure, bool>> logoutApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [LoginRemoteRepo].
  Future<Either<Failure, User>> getProfileApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });
}
