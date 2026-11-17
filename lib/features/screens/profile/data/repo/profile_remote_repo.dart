import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/core/constants/app_api.dart';
import 'package:newf/features/screens/profile/data/repo/base_profile_repo.dart';
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
import 'package:newf/features/screens/profile/data/model/get_avilable_holidays_res/get_avilable_holidays_res.dart';

import '../../../../../core/api_helper/caller_tag.dart';
import '../../../../../core/api_helper/response_handler.dart';
import '../../../../../core/shared/methods/no_parameter.dart';

/// Concrete remote implementation of [BaseProfileRepo].
class ProfileRemoteRepo implements BaseProfileRepo {
  final DioHelper dio;
  ProfileRemoteRepo(this.dio);


  @override
  Future<Either<Failure, CreateEmployeeRes>> createEmployeeApi(
      CreateEmployeeReqParam? parameter, {
        CancelToken? cancelToken,
      }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.createEmployee,
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: CreateEmployeeRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, ShiftCreatingRes>> createShiftApi(
      AddEditShiftReqParam? parameter, {
        CancelToken? cancelToken,
      }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.createShift,
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: ShiftCreatingRes.fromJson,
    );
  }


  @override
  Future<Either<Failure, CreateBranchRes>> createBranchApi(
      CreateBranchReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.createBranch,
       data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: CreateBranchRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, GetAvilableHolidaysRes>> getListHolidaysApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.holidays,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: GetAvilableHolidaysRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, GetAllEmployeesRes>> getListEmployeesApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.listEmployees,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: GetAllEmployeesRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, GetAllShiftsRes>> getListShiftsApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.listShifts,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: GetAllShiftsRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, BranchesList>> getListBranchesApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.listBranches,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: BranchesList.fromJson,
    );
  }

  @override
  Future<Either<Failure, DeleteShiftRes>> deleteShiftApi(
    DeleteShiftReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.deleteData(
        uri: EndPoints.deleteShift(parameter?.id ?? ''),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: DeleteShiftRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, ShiftCreatingRes>> updateShiftApi(
    AddEditShiftReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.putData(
        uri: EndPoints.updateShift(parameter?.id ?? ''),
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: ShiftCreatingRes.fromJson,
    );
  }
}
