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
import 'package:newf/features/screens/profile/data/model/shifts/1-create_shift_req_param.dart';
import 'package:newf/features/screens/profile/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/profile/data/model/branches/create_branch_res/create_branch_res.dart';
import 'package:newf/features/screens/profile/data/model/branches/1-create_branch_req_param.dart';
import 'package:newf/features/screens/profile/data/model/get_avilable_holidays_res/get_avilable_holidays_res.dart';

import '../../../../../core/api_helper/response_handler.dart';

/// Concrete remote implementation of [BaseProfileRepo].
class ProfileRemoteRepo implements BaseProfileRepo {
  final DioHelper dio;
  ProfileRemoteRepo(this.dio);

  @override
  Future<Either<Failure, GetAllEmployeesRes>> listEmployeesApi() async {
    return handleResponse(
      onCallData: dio.getData(uri: EndPoints.listEmployees),
      asObject: GetAllEmployeesRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, CreateEmployeeRes>> createEmployeeApi(
      CreateEmployeeReqParam param) async {
    return handleResponse(
      onCallData: dio.postData(
          uri: EndPoints.createEmployee, data: param.toJson()),
      asObject: CreateEmployeeRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, GetAllShiftsRes>> listShiftsApi() async {
    return handleResponse(
      onCallData: dio.getData(uri: EndPoints.listShifts),
      asObject: GetAllShiftsRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, ShiftCreatingRes>> createShiftApi(
      CreateShiftReqParam param) async {
    return handleResponse(
      onCallData:
          dio.postData(uri: EndPoints.createShift, data: param.toJson()),
      asObject: ShiftCreatingRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, BranchesList>> listBranchesApi() async {
    return handleResponse(
      onCallData: dio.getData(uri: EndPoints.listBranches),
      asObject: BranchesList.fromJson,
    );
  }

  @override
  Future<Either<Failure, CreateBranchRes>> createBranchApi(
      CreateBranchReqParam param) async {
    return handleResponse(
      onCallData:
          dio.postData(uri: EndPoints.createBranch, data: param.toJson()),
      asObject: CreateBranchRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, GetAvilableHolidaysRes>> listHolidaysApi() async {
    return handleResponse(
      onCallData: dio.getData(uri: EndPoints.holidays),
      asObject: GetAvilableHolidaysRes.fromJson,
    );
  }
}
