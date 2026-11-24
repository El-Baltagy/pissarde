import 'package:newf/core/constants/app_typedef.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/employees/data/repo/base_employees_repo.dart';
import 'package:newf/features/screens/employees/service/base_employees_service.dart';
import 'package:newf/features/screens/employees/data/model/employees/get_all_employees_res/get_all_employees_res.dart';
import 'package:newf/features/screens/employees/data/model/list_employees_param.dart';
import 'package:newf/features/screens/employees/data/model/employees/create_employee_res/create_employee_res.dart';
import 'package:newf/features/screens/employees/data/model/employees/1-create_employee_req_param.dart';
import 'package:newf/features/screens/employees/data/model/employees/3-delete_employee_req_param.dart';

import '../../../../core/base/base_service.dart';
import '../../../../core/base/base_cubit.dart';
import '../../../../core/shared/methods/no_parameter.dart';
import '../../../../core/shared/methods/print.dart';
import '../data/model/get_supervisors_list/get_supervisors_list.dart';

class EmployeesRemoteService implements BaseEmployeesService {
  EmployeesRemoteService(this._remoteRepo, this._localRepo);

  final BaseEmployeesRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  @override
  Future<void> getListEmployeesServ(
    RequestCallbackObserver<GetAllEmployeesRes, EmployeesListParam> requestInfo,
  ) {
    const cacheKey = AppConstant.getListEmployeesKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getListEmployeesApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        if (requestInfo.baseRequestBackType is PaginationInfo) {
          return (requestInfo.baseRequestBackType
                  as PaginationInfo<GetAllEmployeesRes>)
              .oldDataToCombine;
        }
        final tuple = await _localRepo.readData(cacheKey);
        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return GetAllEmployeesRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null && requestInfo.baseRequestBackType is! PaginationInfo) {
          await _localRepo.saveData(cacheKey, savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
      combinePagination: (oldData, newData) {
        return newData.copyWith(
          data: [...oldData.data, ...newData.data],
        );
      },
    );
  }

  @override
  Future<void> addEditEmployeeServ(
    RequestCallbackObserver<CreateEmployeeRes, CreateEmployeeReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => requestInfo.parameter?.employee_id == null
          ? _remoteRepo.createEmployeeApi(requestInfo.parameter, cancelToken: token)
          : _remoteRepo.updateEmployeeApi(requestInfo.parameter, cancelToken: token),
    );
  }

  @override
  Future<void> deleteEmployeeServ(
    RequestCallbackObserver<CreateEmployeeRes, DeleteEmployeeReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.deleteEmployeeApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }

  @override
  Future<void> getSupervisorsServ(
    RequestCallbackObserver<GetSupervisorsList, NoParameter> requestInfo,
  ) {
    const cacheKey = AppConstant.getSupervisorsKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getSupervisorsApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return GetSupervisorsList.fromJson(tuple!.$2);
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
