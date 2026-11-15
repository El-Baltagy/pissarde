import 'package:newf/core/constants/app_constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/core/api_helper/response_handler.dart';
import 'package:newf/core/constants/app_api.dart';
import 'package:newf/features/screens/login/data/model/login_res/login_res.dart';
import 'package:newf/features/screens/login/data/repo/base_login_repo.dart';

import '../../../../../core/api_helper/caller_tag.dart';
import '../../../../../core/shared/methods/no_parameter.dart';
import '../model/login_req_param.dart';

/// Concrete remote implementation of [BaseLoginRepo].
class LoginRemoteRepo implements BaseLoginRepo {
  final DioHelper dio;
  LoginRemoteRepo(this.dio);

  @override
  Future<Either<Failure, LoginRes>> loginApi(
      LoginReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.login,
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag()
      ),
      asObject: LoginRes.fromJson,
    );
  }



  @override
  Future<Either<Failure, bool>> logoutApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.logout,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
    asObject: (json) =>   true,
    // asObject: (json) => json['status'] == true || json['success'] == true,
    );
  }

  @override
  Future<Either<Failure, User>> getProfileApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getProfile,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: (json) => User.fromJson(
        json.containsKey('user') && json['user'] is Map<String, dynamic>
            ? json['user'] as Map<String, dynamic>
            : json,
      ),
    );
  }
}
