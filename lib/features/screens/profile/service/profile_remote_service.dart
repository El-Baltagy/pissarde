import 'package:newf/core/constants/app_typedef.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/profile/data/repo/base_profile_repo.dart';
import 'package:newf/features/screens/profile/service/base_profile_service.dart';
import 'package:newf/features/screens/profile/data/model/employees/get_all_employees_res/get_all_employees_res.dart';
import 'package:newf/features/screens/profile/data/model/employees/create_employee_res/create_employee_res.dart';
import 'package:newf/features/screens/profile/data/model/employees/1-create_employee_req_param.dart';
import 'package:newf/features/screens/profile/data/model/shifts/get_all_shifts_res/get_all_shifts_res.dart';
import 'package:newf/features/screens/profile/data/model/shifts/creating_shift_res/shift_creating_res.dart';
import 'package:newf/features/screens/profile/data/model/shifts/delete_shift_res/delete_shift_res.dart';
import 'package:newf/features/screens/profile/data/model/shifts/1-create_shift_req_param.dart';
import 'package:newf/features/screens/profile/data/model/shifts/2-delete_shift_req_param.dart';
import 'package:newf/features/screens/profile/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/profile/data/model/branches/create_branch_res/create_branch_res.dart';
import 'package:newf/features/screens/profile/data/model/branches/1-create_branch_req_param.dart';
import 'package:newf/features/screens/profile/data/model/branches/2-delete_branch_req_param.dart';
import 'package:newf/features/screens/profile/data/model/branches/2-update_branch_req_param.dart';
import 'package:newf/features/screens/profile/data/model/get_avilable_holidays_res/get_avilable_holidays_res.dart';

import '../../../../core/base/base_service.dart';
import '../../../../core/shared/methods/no_parameter.dart';

/// Concrete implementation of [BaseProfileService].
/// Depends on [BaseProfileRepo] (abstraction), not on the remote repo directly.
class ProfileRemoteService implements BaseProfileService {
  ProfileRemoteService(this._remoteRepo, this._localRepo);

  final BaseProfileRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

   @override
  Future<void> getListHolidaysServ(
    RequestCallbackObserver<GetAvilableHolidaysRes, NoParameters> requestInfo,
  ) {
    const cacheKey = AppConstant.getListHolidaysKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getListHolidaysApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return GetAvilableHolidaysRes.fromJson(tuple!.$2);
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
  Future<void> getListEmployeesServ(
    RequestCallbackObserver<GetAllEmployeesRes, NoParameters> requestInfo,
  ) {
    const cacheKey = AppConstant.getListEmployeesKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getListEmployeesApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return GetAllEmployeesRes.fromJson(tuple!.$2);
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
  Future<void> createEmployeeServ(
    RequestCallbackObserver<CreateEmployeeRes, CreateEmployeeReqParam> requestInfo,
  ) {

    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.createEmployeeApi(
        requestInfo.parameter,
        cancelToken: token,
      )
    );
  }



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
      )
    );
  }




  @override
  Future<void> getListBranchesServ(
    RequestCallbackObserver<BranchesList, NoParameters> requestInfo,
  ) {
    const cacheKey = AppConstant.getListBranchesKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getListBranchesApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return BranchesList.fromJson(tuple!.$2);
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
  Future<void> createBranchServ(
    RequestCallbackObserver<CreateBranchRes, CreateBranchReqParam> requestInfo,
  ) {

    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.createBranchApi(
        requestInfo.parameter,
        cancelToken: token,
      )
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
  Future<void> deleteBranchServ(
    RequestCallbackObserver<CreateBranchRes, DeleteBranchReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.deleteBranchApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }

  @override
  Future<void> updateBranchServ(
    RequestCallbackObserver<CreateBranchRes, UpdateBranchReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.updateBranchApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }
}
