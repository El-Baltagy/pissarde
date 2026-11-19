import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/base/base_remote_repo.dart';
import 'package:newf/features/screens/requests/data/model/accept_pending_leave_res/accept_pending_leave_res.dart';
import 'package:newf/features/screens/requests/data/model/cancel_leave_req_param.dart';
import 'package:newf/features/screens/requests/data/model/create_leave_request_req_param.dart';
import 'package:newf/features/screens/requests/data/model/get_leaves_balance_res/get_leaves_balance_res.dart';
import 'package:newf/features/screens/requests/data/model/get_leaves_types_res/get_leaves_types_res.dart';
import 'package:newf/features/screens/requests/data/model/get_my_leaves_requests_res/get_my_leaves_requests_res.dart';
import 'package:newf/features/screens/requests/data/model/get_pending_approval_leaves_res/get_pending_approval_leaves_res.dart';
import 'package:newf/features/screens/requests/data/model/leave_balances_req_param.dart';
import 'package:newf/features/screens/requests/data/model/my_leave_requests_req_param.dart';
import 'package:newf/features/screens/requests/data/model/review_leave_request_req_param.dart';

import '../../../../../core/shared/methods/no_parameter.dart';

/// Abstract contract for the requests data layer.
/// High-level modules (services) depend on this, not on concrete implementations.
abstract class BaseRequestsRepo extends BaseRepo {
  // TODO: declare repo method signatures here

  /// Abstract contract — implemented by [RequestsRemoteRepo].
  Future<Either<Failure, GetMyLeavesRequestsRes>> getMyLeaveRequestsApi(
    MyLeaveRequestsReqParam? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [RequestsRemoteRepo].
  Future<Either<Failure, GetLeavesTypesRes>> getLeaveTypesApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [RequestsRemoteRepo].
  Future<Either<Failure, GetLeavesBalanceRes>> getLeaveBalancesApi(
    LeaveBalancesReqParam? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [RequestsRemoteRepo].
  Future<Either<Failure, AcceptPendingLeaveRes>> createLeaveRequestApi(
    CreateLeaveRequestReqParam? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [RequestsRemoteRepo].
  Future<Either<Failure, AcceptPendingLeaveRes>> cancelLeaveRequestApi(
    CancelLeaveReqParam? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [RequestsRemoteRepo].
  Future<Either<Failure, AcceptPendingLeaveRes>> reviewLeaveRequestApi(
    ReviewLeaveRequestReqParam? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [RequestsRemoteRepo].
  Future<Either<Failure, GetPendingApprovalLeavesRes>> getPendingApprovalLeavesApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });
}
