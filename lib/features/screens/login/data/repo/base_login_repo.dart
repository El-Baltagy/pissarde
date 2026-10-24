import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/base/base_remote_repo.dart';
import 'package:newf/features/screens/login/data/model/forget_password_link/forget_password_link.dart';
import 'package:newf/features/screens/login/data/model/forget_password_parameter.dart';
import 'package:newf/features/screens/login/data/model/login_parameters.dart';
import 'package:newf/features/screens/login/data/model/login_res/login_res.dart';

/// Abstract contract for the login data layer.
abstract class BaseLoginRepo extends BaseRepo {
  Future<Either<Failure, LoginRes>> loginApi(
    LoginParameters? parameter, {
    CancelToken? cancelToken,
  });

  Future<Either<Failure, ForgetPasswordLink>> sendresetpwlinkApi(
    ForgetPasswordParameter? parameter, {
    CancelToken? cancelToken,
  });
}
