import 'package:newf/core/base/base_service.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/base/base_local_repo.dart';
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
import 'package:newf/features/screens/requests/service/base_requests_service.dart';

/// Concrete implementation of [BaseRequestsService].
/// Depends on [BaseRequestsRepo] (abstraction), not on the remote repo directly.
class RequestsRemoteService implements BaseRequestsService {
  RequestsRemoteService(this._remoteRepo, this._localRepo);

  final BaseRequestsRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  @override
  Future<void> getMyLeaveRequestsServ(
    RequestCallbackObserver<GetMyLeavesRequestsRes, MyLeaveRequestsReqParam> requestInfo,
  ) {
    const cacheKey = AppConstant.getMyLeaveRequestsKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getMyLeaveRequestsApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return GetMyLeavesRequestsRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey, savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }

  @override
  Future<void> getLeaveTypesServ(
    RequestCallbackObserver<GetLeavesTypesRes, NoParameters> requestInfo,
  ) {
    const cacheKey = AppConstant.getLeaveTypesKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getLeaveTypesApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return GetLeavesTypesRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey, savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }

  @override
  Future<void> getLeaveBalancesServ(
    RequestCallbackObserver<GetLeavesBalanceRes, LeaveBalancesReqParam> requestInfo,
  ) {
    const cacheKey = AppConstant.getLeaveBalancesKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getLeaveBalancesApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return GetLeavesBalanceRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey, savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }

  @override
  Future<void> createLeaveRequestServ(
    RequestCallbackObserver<AcceptPendingLeaveRes, CreateLeaveRequestReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.createLeaveRequestApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async => null,
      saveLocal: (old, newData) async {},
      clearLocal: () async {},
    );
  }

  @override
  Future<void> cancelLeaveRequestServ(
    RequestCallbackObserver<AcceptPendingLeaveRes, CancelLeaveReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.cancelLeaveRequestApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async => null,
      saveLocal: (old, newData) async {},
      clearLocal: () async {},
    );
  }

  @override
  Future<void> reviewLeaveRequestServ(
    RequestCallbackObserver<AcceptPendingLeaveRes, ReviewLeaveRequestReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.reviewLeaveRequestApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async => null,
      saveLocal: (old, newData) async {},
      clearLocal: () async {},
    );
  }

  @override
  Future<void> getPendingApprovalLeavesServ(
    RequestCallbackObserver<GetPendingApprovalLeavesRes, NoParameters> requestInfo,
  ) {
    const cacheKey = AppConstant.getPendingApprovalLeavesKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getPendingApprovalLeavesApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return GetPendingApprovalLeavesRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey, savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }
}
