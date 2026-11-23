import 'package:newf/core/constants/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/core/constants/app_api.dart';
import 'package:newf/features/screens/employees/data/repo/base_employees_repo.dart';
import 'package:newf/features/screens/employees/data/model/employees/get_all_employees_res/get_all_employees_res.dart';
import 'package:newf/features/screens/employees/data/model/employees/create_employee_res/create_employee_res.dart';
import 'package:newf/features/screens/employees/data/model/employees/1-create_employee_req_param.dart';
import 'package:newf/features/screens/employees/data/model/employees/3-delete_employee_req_param.dart';

import '../../../../../core/api_helper/caller_tag.dart';
import '../../../../../core/api_helper/response_handler.dart';
import '../../../../../core/shared/methods/no_parameter.dart';
import '../../../../../core/shared/methods/print.dart';
import '../model/get_supervisors_list/get_supervisors_list.dart';

class EmployeesRemoteRepo implements BaseEmployeesRepo {
  final DioHelper dio;
  EmployeesRemoteRepo(this.dio);

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
  Future<Either<Failure, CreateEmployeeRes>> deleteEmployeeApi(
    DeleteEmployeeReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.deleteData(
        uri: EndPoints.deleteEmployee(parameter?.id ?? ''),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: CreateEmployeeRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, CreateEmployeeRes>> updateEmployeeApi(
    CreateEmployeeReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.putData(
        uri: EndPoints.updateEmployee(parameter?.employee_id ?? ''),
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: CreateEmployeeRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, GetSupervisorsList>> getSupervisorsApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.getSupervisors,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: GetSupervisorsList.fromJson,
    );
  }
}
