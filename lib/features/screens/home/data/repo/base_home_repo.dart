import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/base/base_remote_repo.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
import 'package:newf/features/screens/home/data/model/chech_in_status/chech_in_status.dart';
import 'package:newf/features/screens/home/data/model/chech_in_res/chech_in_res.dart';
import 'package:newf/features/screens/home/data/model/check_in_req_param.dart';
import 'package:newf/features/screens/home/data/model/check_out_req_param.dart';

/// Abstract contract for the home data layer.
/// High-level modules (services) depend on this, not on concrete implementations.
abstract class BaseHomeRepo extends BaseRepo {
  // TODO: declare repo method signatures here

  /// Abstract contract — implemented by [HomeRemoteRepo].
  Future<Either<Failure, ChechInStatus>> attendanceTodayApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [HomeRemoteRepo].
  Future<Either<Failure, ChechInRes>> checkInApi(
    CheckInReqParam? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [HomeRemoteRepo].
  Future<Either<Failure, ChechInRes>> checkOutApi(
    CheckOutReqParam? parameter, {
    CancelToken? cancelToken,
  });
}
