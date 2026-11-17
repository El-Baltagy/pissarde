import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/base/base_service.dart';
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

/// Abstract contract for the profile service layer.
/// The cubit depends on this, not on a concrete implementation.
abstract class BaseProfileService extends BaseService {
  Future<Either<Failure, GetAllEmployeesRes>> listEmployeesServ();
  Future<Either<Failure, CreateEmployeeRes>> createEmployeeServ(CreateEmployeeReqParam param);
  Future<Either<Failure, GetAllShiftsRes>> listShiftsServ();
  Future<Either<Failure, ShiftCreatingRes>> createShiftServ(CreateShiftReqParam param);
  Future<Either<Failure, BranchesList>> listBranchesServ();
  Future<Either<Failure, CreateBranchRes>> createBranchServ(CreateBranchReqParam param);
  Future<Either<Failure, GetAvilableHolidaysRes>> listHolidaysServ();
}
