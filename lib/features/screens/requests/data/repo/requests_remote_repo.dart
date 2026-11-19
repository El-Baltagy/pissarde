import 'package:newf/core/api_helper/caller_tag.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/response_handler.dart';
import 'package:newf/core/constants/app_api.dart';
import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
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
import 'package:newf/features/screens/requests/data/repo/base_requests_repo.dart';

/// Concrete remote implementation of [BaseRequestsRepo].
class RequestsRemoteRepo implements BaseRequestsRepo {
  final DioHelper dio;
  RequestsRemoteRepo(this.dio);

  @override
  Future<Either<Failure, GetMyLeavesRequestsRes>> getMyLeaveRequestsApi(
    MyLeaveRequestsReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getMyLeaveRequests,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: GetMyLeavesRequestsRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, GetLeavesTypesRes>> getLeaveTypesApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getLeaveTypes,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: GetLeavesTypesRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, GetLeavesBalanceRes>> getLeaveBalancesApi(
    LeaveBalancesReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: '${EndPoints.getLeaveBalances}?year=${parameter?.year ?? DateTime.now().year}',
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: GetLeavesBalanceRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, AcceptPendingLeaveRes>> createLeaveRequestApi(
    CreateLeaveRequestReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.createLeaveRequest,
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: AcceptPendingLeaveRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, AcceptPendingLeaveRes>> cancelLeaveRequestApi(
    CancelLeaveReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.cancelLeaveRequest(parameter!.id),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: AcceptPendingLeaveRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, AcceptPendingLeaveRes>> reviewLeaveRequestApi(
    ReviewLeaveRequestReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.reviewLeaveRequest(parameter!.id),
        data: parameter.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: AcceptPendingLeaveRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, GetPendingApprovalLeavesRes>> getPendingApprovalLeavesApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getPendingApprovalLeaves,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: GetPendingApprovalLeavesRes.fromJson,
    );
  }
}
