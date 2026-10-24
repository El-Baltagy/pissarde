import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/core/api_helper/response_handler.dart';
import 'package:newf/core/constants/app_api.dart';
import 'package:newf/features/screens/login/data/model/forget_password_link/forget_password_link.dart';
import 'package:newf/features/screens/login/data/model/forget_password_parameter.dart';
import 'package:newf/features/screens/login/data/model/login_parameters.dart';
import 'package:newf/features/screens/login/data/model/login_res/login_res.dart';
import 'package:newf/features/screens/login/data/repo/base_login_repo.dart';

/// Concrete remote implementation of [BaseLoginRepo].
class LoginRemoteRepo implements BaseLoginRepo {
  final DioHelper dio;
  LoginRemoteRepo(this.dio);

  @override
  Future<Either<Failure, LoginRes>> loginApi(
    LoginParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.login,
        data: parameter?.toJson(),
        cancelToken: cancelToken,
      ),
      asObject: LoginRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, ForgetPasswordLink>> sendresetpwlinkApi(
    ForgetPasswordParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        data: parameter?.toJson(),
        uri: EndPoints.sendResetPWLink,
        cancelToken: cancelToken,
      ),
      asObject: ForgetPasswordLink.fromJson,
    );
  }
}
