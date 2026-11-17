import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/base/base_remote_repo.dart';
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

import '../../../../../core/shared/methods/no_parameter.dart';

/// Abstract contract for the profile data layer.
/// High-level modules (services) depend on this, not on concrete implementations.
abstract class BaseProfileRepo extends BaseRepo {

   /// Abstract contract — implemented by [ProfileRemoteRepo].
   Future<Either<Failure, ShiftCreatingRes>> createShiftApi(
       AddEditShiftReqParam? parameter, {
         CancelToken? cancelToken,
       });
   /// Abstract contract — implemented by [ProfileRemoteRepo].
   Future<Either<Failure, CreateEmployeeRes>> createEmployeeApi(
       CreateEmployeeReqParam? parameter, {
         CancelToken? cancelToken,
       });

  /// Abstract contract — implemented by [ProfileRemoteRepo].
  Future<Either<Failure, CreateBranchRes>> createBranchApi(
      CreateBranchReqParam? parameter, {
        CancelToken? cancelToken,
      });

  /// Abstract contract — implemented by [ProfileRemoteRepo].
  Future<Either<Failure, GetAvilableHolidaysRes>> getListHolidaysApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [ProfileRemoteRepo].
  Future<Either<Failure, GetAllEmployeesRes>> getListEmployeesApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [ProfileRemoteRepo].
  Future<Either<Failure, GetAllShiftsRes>> getListShiftsApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [ProfileRemoteRepo].
  Future<Either<Failure, BranchesList>> getListBranchesApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [ProfileRemoteRepo].
  Future<Either<Failure, DeleteShiftRes>> deleteShiftApi(
    DeleteShiftReqParam? parameter, {
    CancelToken? cancelToken,
  });

  /// Abstract contract — implemented by [ProfileRemoteRepo].
  Future<Either<Failure, ShiftCreatingRes>> updateShiftApi(
    AddEditShiftReqParam? parameter, {
    CancelToken? cancelToken,
  });
}
