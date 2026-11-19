import 'package:newf/core/base/base_service.dart';
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

/// Abstract contract for the requests service layer.
/// The cubit depends on this, not on a concrete implementation.
abstract class BaseRequestsService extends BaseService {
  /// Abstract contract — implemented by [RequestsRemoteService].
  Future<void> getMyLeaveRequestsServ(
    RequestCallbackObserver<GetMyLeavesRequestsRes, MyLeaveRequestsReqParam> requestInfo,
  );

  /// Abstract contract — implemented by [RequestsRemoteService].
  Future<void> getLeaveTypesServ(
    RequestCallbackObserver<GetLeavesTypesRes, NoParameters> requestInfo,
  );

  /// Abstract contract — implemented by [RequestsRemoteService].
  Future<void> getLeaveBalancesServ(
    RequestCallbackObserver<GetLeavesBalanceRes, LeaveBalancesReqParam> requestInfo,
  );

  /// Abstract contract — implemented by [RequestsRemoteService].
  Future<void> createLeaveRequestServ(
    RequestCallbackObserver<AcceptPendingLeaveRes, CreateLeaveRequestReqParam> requestInfo,
  );

  /// Abstract contract — implemented by [RequestsRemoteService].
  Future<void> cancelLeaveRequestServ(
    RequestCallbackObserver<AcceptPendingLeaveRes, CancelLeaveReqParam> requestInfo,
  );

  /// Abstract contract — implemented by [RequestsRemoteService].
  Future<void> reviewLeaveRequestServ(
    RequestCallbackObserver<AcceptPendingLeaveRes, ReviewLeaveRequestReqParam> requestInfo,
  );

  /// Abstract contract — implemented by [RequestsRemoteService].
  Future<void> getPendingApprovalLeavesServ(
    RequestCallbackObserver<GetPendingApprovalLeavesRes, NoParameters> requestInfo,
  );
}
