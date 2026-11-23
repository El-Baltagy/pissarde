import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/shifts/data/repo/base_shifts_repo.dart';
import 'package:newf/features/screens/shifts/service/base_shifts_service.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/get_all_shifts_res/get_all_shifts_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/creating_shift_res/shift_creating_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/delete_shift_res/delete_shift_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/1-create_shift_req_param.dart';

import '../../../../core/base/base_service.dart';
import '../../../../core/shared/methods/no_parameter.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/2-delete_shift_req_param.dart';

class ShiftsRemoteService implements BaseShiftsService {
  ShiftsRemoteService(this._remoteRepo, this._localRepo);

  final BaseShiftsRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  @override
  Future<void> getListShiftsServ(
    RequestCallbackObserver<GetAllShiftsRes, NoParameters> requestInfo,
  ) {
    const cacheKey = AppConstant.getListShiftsKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getListShiftsApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);
        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return GetAllShiftsRes.fromJson(tuple!.$2);
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
  Future<void> createShiftServ(
    RequestCallbackObserver<ShiftCreatingRes, AddEditShiftReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.createShiftApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }

  @override
  Future<void> updateShiftServ(
    RequestCallbackObserver<ShiftCreatingRes, AddEditShiftReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.updateShiftApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }

  @override
  Future<void> deleteShiftServ(
    RequestCallbackObserver<DeleteShiftRes, DeleteShiftReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.deleteShiftApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }
}
