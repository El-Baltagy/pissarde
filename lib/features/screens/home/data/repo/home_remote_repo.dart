import 'package:newf/core/api_helper/caller_tag.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/api_helper/response_handler.dart';
import 'package:newf/core/constants/app_api.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
import 'package:newf/features/screens/home/data/model/chech_in_status/chech_in_status.dart';
import 'package:newf/features/screens/home/data/model/chech_in_res/chech_in_res.dart';
import 'package:newf/features/screens/home/data/model/check_in_req_param.dart';
import 'package:newf/features/screens/home/data/model/check_out_req_param.dart';
import 'package:newf/features/screens/home/data/repo/base_home_repo.dart';

/// Concrete remote implementation of [BaseHomeRepo].
class HomeRemoteRepo implements BaseHomeRepo {
  final DioHelper dio;
  HomeRemoteRepo(this.dio);

  @override
  Future<Either<Failure, ChechInStatus>> attendanceTodayApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.attendanceToday,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: ChechInStatus.fromJson,
    );
  }

  @override
  Future<Either<Failure, ChechInRes>> checkInApi(
    CheckInReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.checkIn,
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: ChechInRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, ChechInRes>> checkOutApi(
    CheckOutReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.checkOut,
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: ChechInRes.fromJson,
    );
  }
}
