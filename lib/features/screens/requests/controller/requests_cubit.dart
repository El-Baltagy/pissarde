import 'package:newf/core/api_helper/cancel/cancel_manager.dart';
import 'package:newf/core/base/base_service.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/constants/app_constant.dart';
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
import 'package:newf/main.dart';
import 'package:newf/features/screens/requests/service/base_requests_service.dart';
part 'requests_state.dart';

class RequestsCubit extends BaseCubit<RequestsState> {
  RequestsCubit(this._service) : super(RequestsLoaded());

  /// Depends on the abstraction [BaseRequestsService], not on a concrete implementation.
  final BaseRequestsService _service;

  static RequestsCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  // Always holds the latest combined state — used by copyWith
  RequestsLoaded get _current =>
      state is RequestsLoaded ? state as RequestsLoaded : RequestsLoaded();

  int get getMyLeaveRequestsKeyCode => AppConstant.getMyLeaveRequestsKeyCode;
  int get getLeaveTypesKeyCode => AppConstant.getLeaveTypesKeyCode;
  int get getLeaveBalancesKeyCode => AppConstant.getLeaveBalancesKeyCode;
  int get createLeaveRequestKeyCode => AppConstant.createLeaveRequestKeyCode;
  int get cancelLeaveRequestKeyCode => AppConstant.cancelLeaveRequestKeyCode;
  int get reviewLeaveRequestKeyCode => AppConstant.reviewLeaveRequestKeyCode;
  int get getPendingApprovalLeavesKeyCode =>
      AppConstant.getPendingApprovalLeavesKeyCode;

  @override
  Future<void> init() async {}

  Future<void> getMyLeaveRequestsFunc(
    BaseRequestBackType baseRequestBackType, {
    MyLeaveRequestsReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(getMyLeaveRequestsKeyCode, (token) async {
      await _service.getMyLeaveRequestsServ(
        RequestCallbackObserver<GetMyLeavesRequestsRes, MyLeaveRequestsReqParam>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(getMyLeaveRequestsState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(getMyLeaveRequestsState: Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(_current.copyWith(getMyLeaveRequestsState: ErrorState(failure))),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    CancelManager.cancel(getPendingApprovalLeavesKeyCode);
    CancelManager.cancel(reviewLeaveRequestKeyCode);
    CancelManager.cancel(cancelLeaveRequestKeyCode);
    CancelManager.cancel(createLeaveRequestKeyCode);
    CancelManager.cancel(getLeaveBalancesKeyCode);
    CancelManager.cancel(getLeaveTypesKeyCode);
    CancelManager.cancel(getMyLeaveRequestsKeyCode);
    return super.close();
  }

  Future<void> getLeaveTypesFunc(
    BaseRequestBackType baseRequestBackType, {
    NoParameters? parameter,
  }) async {
    await CancelManager.runCancelableFun(getLeaveTypesKeyCode, (token) async {
      await _service.getLeaveTypesServ(
        RequestCallbackObserver<GetLeavesTypesRes, NoParameters>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(getLeaveTypesState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(getLeaveTypesState: Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(_current.copyWith(getLeaveTypesState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> getLeaveBalancesFunc(
    BaseRequestBackType baseRequestBackType, {
    LeaveBalancesReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(getLeaveBalancesKeyCode, (token) async {
      await _service.getLeaveBalancesServ(
        RequestCallbackObserver<GetLeavesBalanceRes, LeaveBalancesReqParam>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(getLeaveBalancesState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(getLeaveBalancesState: Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(_current.copyWith(getLeaveBalancesState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> createLeaveRequestFunc(
    BaseRequestBackType baseRequestBackType, {
    CreateLeaveRequestReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(createLeaveRequestKeyCode, (token) async {
      await _service.createLeaveRequestServ(
        RequestCallbackObserver<AcceptPendingLeaveRes, CreateLeaveRequestReqParam>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(createLeaveRequestState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(createLeaveRequestState: Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(_current.copyWith(createLeaveRequestState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> cancelLeaveRequestFunc(
    BaseRequestBackType baseRequestBackType, {
    CancelLeaveReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(cancelLeaveRequestKeyCode, (token) async {
      await _service.cancelLeaveRequestServ(
        RequestCallbackObserver<AcceptPendingLeaveRes, CancelLeaveReqParam>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(cancelLeaveRequestState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(cancelLeaveRequestState: Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(_current.copyWith(cancelLeaveRequestState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> reviewLeaveRequestFunc(
    BaseRequestBackType baseRequestBackType, {
    ReviewLeaveRequestReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(reviewLeaveRequestKeyCode, (token) async {
      await _service.reviewLeaveRequestServ(
        RequestCallbackObserver<AcceptPendingLeaveRes, ReviewLeaveRequestReqParam>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(reviewLeaveRequestState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(reviewLeaveRequestState: Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(_current.copyWith(reviewLeaveRequestState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> getPendingApprovalLeavesFunc(
    BaseRequestBackType baseRequestBackType, {
    NoParameters? parameter,
  }) async {
    await CancelManager.runCancelableFun(getPendingApprovalLeavesKeyCode, (token) async {
      await _service.getPendingApprovalLeavesServ(
        RequestCallbackObserver<GetPendingApprovalLeavesRes, NoParameters>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(getPendingApprovalLeavesState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(getPendingApprovalLeavesState: Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(_current.copyWith(getPendingApprovalLeavesState: ErrorState(failure))),
        ),
      );
    });
  }

  void resetCreateLeaveRequest() =>
      safeEmit(_current.copyWith(clearCreateLeaveRequest: true));
  void resetCancelLeaveRequest() =>
      safeEmit(_current.copyWith(clearCancelLeaveRequest: true));
  void resetReviewLeaveRequest() =>
      safeEmit(_current.copyWith(clearReviewLeaveRequest: true));
}
