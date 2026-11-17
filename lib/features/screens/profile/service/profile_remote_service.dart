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
import 'package:newf/features/screens/profile/data/model/shifts/1-create_shift_req_param.dart';
import 'package:newf/features/screens/profile/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/profile/data/model/branches/create_branch_res/create_branch_res.dart';
import 'package:newf/features/screens/profile/data/model/branches/1-create_branch_req_param.dart';
import 'package:newf/features/screens/profile/data/model/get_avilable_holidays_res/get_avilable_holidays_res.dart';

/// Concrete implementation of [BaseProfileService].
/// Depends on [BaseProfileRepo] (abstraction), not on the remote repo directly.
class ProfileRemoteService implements BaseProfileService {
  ProfileRemoteService(this._remoteRepo, this._localRepo);

  final BaseProfileRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  @override
  Future<Either<Failure, GetAllEmployeesRes>> listEmployeesServ() =>
      _remoteRepo.listEmployeesApi();

  @override
  Future<Either<Failure, CreateEmployeeRes>> createEmployeeServ(
          CreateEmployeeReqParam param) =>
      _remoteRepo.createEmployeeApi(param);

  @override
  Future<Either<Failure, GetAllShiftsRes>> listShiftsServ() =>
      _remoteRepo.listShiftsApi();

  @override
  Future<Either<Failure, ShiftCreatingRes>> createShiftServ(
          CreateShiftReqParam param) =>
      _remoteRepo.createShiftApi(param);

  @override
  Future<Either<Failure, BranchesList>> listBranchesServ() =>
      _remoteRepo.listBranchesApi();

  @override
  Future<Either<Failure, CreateBranchRes>> createBranchServ(
          CreateBranchReqParam param) =>
      _remoteRepo.createBranchApi(param);

  @override
  Future<Either<Failure, GetAvilableHolidaysRes>> listHolidaysServ() =>
      _remoteRepo.listHolidaysApi();
}
