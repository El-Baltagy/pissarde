import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/base/base_remote_repo.dart';
import 'package:newf/features/screens/employees/data/model/employees/get_all_employees_res/get_all_employees_res.dart';
import 'package:newf/features/screens/employees/data/model/employees/create_employee_res/create_employee_res.dart';
import 'package:newf/features/screens/employees/data/model/employees/1-create_employee_req_param.dart';
import 'package:newf/features/screens/employees/data/model/employees/3-delete_employee_req_param.dart';

import '../../../../../core/shared/methods/no_parameter.dart';
import '../../../../../core/shared/methods/print.dart';
import '../model/get_supervisors_list/get_supervisors_list.dart';

/// Abstract contract for the employees data layer.
abstract class BaseEmployeesRepo extends BaseRepo {
  Future<Either<Failure, CreateEmployeeRes>> createEmployeeApi(
    CreateEmployeeReqParam? parameter, {
    CancelToken? cancelToken,
  });

  Future<Either<Failure, GetAllEmployeesRes>> getListEmployeesApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });

  Future<Either<Failure, CreateEmployeeRes>> deleteEmployeeApi(
    DeleteEmployeeReqParam? parameter, {
    CancelToken? cancelToken,
  });

  Future<Either<Failure, CreateEmployeeRes>> updateEmployeeApi(
    CreateEmployeeReqParam? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [EmployeesRemoteRepo].
  Future<Either<Failure, GetSupervisorsList>> getSupervisorsApi(
    NoParameter? parameter, {
    CancelToken? cancelToken,
  });
}
