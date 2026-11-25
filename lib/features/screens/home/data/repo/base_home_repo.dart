import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/base/base_remote_repo.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
 import 'package:newf/features/screens/home/data/model/chech_in_res/chech_in_res.dart';
import 'package:newf/features/screens/home/data/model/check_in_req_param.dart';
import 'package:newf/features/screens/home/data/model/check_out_req_param.dart';

import '../model/check_in_today_status_res/check_in_today_status_res.dart';
import '../model/verify_branch_qr_code_res/verify_branch_qr_code_res.dart';
import '../model/verify_branch_qr_param.dart';
import '../model/history_attendacne_res/history_attendacne_res.dart';
import '../model/list_attendance_corrections_res/list_attendance_corrections_res.dart';
import '../model/attendance_correction_request_res/attendance_correction_request_res.dart';
import '../model/attendance_history_req_param.dart';
import '../model/attendance_corrections_param.dart';
import '../model/create_attendance_correction_req_param.dart';

/// Abstract contract for the home data layer.
/// High-level modules (services) depend on this, not on concrete implementations.
abstract class BaseHomeRepo extends BaseRepo {
  // TODO: declare repo method signatures here

  /// Abstract contract — implemented by [HomeRemoteRepo].
  Future<Either<Failure, CheckInTodayStatusRes>> attendanceTodayApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [HomeRemoteRepo].
  Future<Either<Failure, HistoryAttendacneRes>> getAttendanceHistoryApi(
    AttendanceHistoryReqParam? parameter, {
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

  /// Abstract contract — implemented by [HomeRemoteRepo].
  Future<Either<Failure, VerifyBranchQrCodeRes>> verifyBranchQrApi(
    VerifyBranchQrParam? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [HomeRemoteRepo].
  Future<Either<Failure, AttendanceCorrectionRequestRes>> createAttendanceCorrectionApi(
    CreateAttendanceCorrectionReqParam? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [HomeRemoteRepo].
  Future<Either<Failure, ListAttendanceCorrectionsRes>> getAttendanceCorrectionsApi(
    AttendanceCorrectionsParam? parameter, {
    CancelToken? cancelToken,
  });
}
