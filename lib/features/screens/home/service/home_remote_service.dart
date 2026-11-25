import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/core/base/base_service.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
 import 'package:newf/features/screens/home/data/model/chech_in_res/chech_in_res.dart';
import 'package:newf/features/screens/home/data/model/check_in_req_param.dart';
import 'package:newf/features/screens/home/data/model/check_out_req_param.dart';
import 'package:newf/features/screens/home/data/repo/base_home_repo.dart';
import 'package:newf/features/screens/home/service/base_home_service.dart';

import '../data/model/check_in_today_status_res/check_in_today_status_res.dart';
import '../data/model/history_attendacne_res/history_attendacne_res.dart';
import '../data/model/list_attendance_corrections_res/list_attendance_corrections_res.dart';
import '../data/model/attendance_history_req_param.dart';
import '../data/model/attendance_corrections_param.dart';
import '../data/model/history_pagination.dart';
import '../data/model/corrections_pagination.dart';
import 'package:newf/core/base/base_cubit.dart';

/// Concrete implementation of [BaseHomeService].
/// Depends on [BaseHomeRepo] (abstraction), not on the remote repo directly.
class HomeRemoteService implements BaseHomeService {
  HomeRemoteService(this._remoteRepo, this._localRepo);

  final BaseHomeRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  @override
  Future<void> attendanceTodayServ(
    RequestCallbackObserver<CheckInTodayStatusRes, NoParameters> requestInfo,
  ) {
    const cacheKey = AppConstant.attendanceTodayKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.attendanceTodayApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return CheckInTodayStatusRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey, savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearDataToKey(cacheKey),
    );
  }

  @override
  Future<void> getAttendanceHistoryServ(
    RequestCallbackObserver<HistoryAttendacneRes, AttendanceHistoryReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getAttendanceHistoryApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        if (requestInfo.baseRequestBackType is PaginationInfo) {
          return (requestInfo.baseRequestBackType
                  as PaginationInfo<HistoryAttendacneRes>)
              .oldDataToCombine;
        }
        return null;
      },
      combinePagination: (oldData, newData) {
        return newData.copyWith(
          data: [...oldData.data, ...newData.data],
        );
      },
    );
  }

  @override
  Future<void> getAttendanceCorrectionsServ(
    RequestCallbackObserver<ListAttendanceCorrectionsRes, AttendanceCorrectionsParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getAttendanceCorrectionsApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        if (requestInfo.baseRequestBackType is PaginationInfo) {
          return (requestInfo.baseRequestBackType
                  as PaginationInfo<ListAttendanceCorrectionsRes>)
              .oldDataToCombine;
        }
        return null;
      },
      combinePagination: (oldData, newData) {
        return newData.copyWith(
          data: [...oldData.data, ...newData.data],
        );
      },
    );
  }

  @override
  Future<void> checkInServ(
    RequestCallbackObserver<ChechInRes, CheckInReqParam> requestInfo,
  ) {
    const cacheKey = AppConstant.checkInKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.checkInApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return ChechInRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey, savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearDataToKey(cacheKey),
    );
  }

  @override
  Future<void> checkOutServ(
    RequestCallbackObserver<ChechInRes, CheckOutReqParam> requestInfo,
  ) {
    const cacheKey = AppConstant.checkOutKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.checkOutApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return ChechInRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey, savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearDataToKey(cacheKey),
    );
  }
}
