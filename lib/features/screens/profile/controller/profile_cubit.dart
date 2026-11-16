import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/main.dart';
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

part 'profile_state.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  ProfileCubit(this._service) : super(ProfileLoaded());

  /// Depends on the abstraction [BaseProfileService], not on a concrete implementation.
  final BaseProfileService _service;

  static ProfileCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  /// Always holds the latest combined state — used by copyWith
  ProfileLoaded get _current =>
      state is ProfileLoaded ? state as ProfileLoaded : ProfileLoaded();

  @override
  Future<void> init() async {}

  /// Fetches the full list of employees from the API.
  Future<void> listEmployeesFunc() async {
    safeEmit(_current.copyWith(listEmployeesEmit: Loading()));
    final result = await _service.listEmployeesServ();
    result.fold(
      (failure) => safeEmit(_current.copyWith(listEmployeesEmit: ErrorState(failure))),
      (data) => safeEmit(_current.copyWith(listEmployeesEmit: Success(data))),
    );
  }

  /// Creates a new employee via the API.
  Future<void> createEmployeeFunc(CreateEmployeeReqParam param) async {
    safeEmit(_current.copyWith(createEmployeeEmit: Loading()));
    final result = await _service.createEmployeeServ(param);
    result.fold(
      (failure) => safeEmit(_current.copyWith(createEmployeeEmit: ErrorState(failure))),
      (data) => safeEmit(_current.copyWith(createEmployeeEmit: Success(data))),
    );
  }

  /// Fetches the full list of shifts from the API.
  Future<void> listShiftsFunc() async {
    safeEmit(_current.copyWith(listShiftsEmit: Loading()));
    final result = await _service.listShiftsServ();
    result.fold(
      (failure) => safeEmit(_current.copyWith(listShiftsEmit: ErrorState(failure))),
      (data) => safeEmit(_current.copyWith(listShiftsEmit: Success(data))),
    );
  }

  /// Creates a new shift via the API.
  Future<void> createShiftFunc(CreateShiftReqParam param) async {
    safeEmit(_current.copyWith(createShiftEmit: Loading()));
    final result = await _service.createShiftServ(param);
    result.fold(
      (failure) => safeEmit(_current.copyWith(createShiftEmit: ErrorState(failure))),
      (data) => safeEmit(_current.copyWith(createShiftEmit: Success(data))),
    );
  }

  /// Fetches the full list of branches from the API.
  Future<void> listBranchesFunc() async {
    safeEmit(_current.copyWith(listBranchesEmit: Loading()));
    final result = await _service.listBranchesServ();
    result.fold(
      (failure) => safeEmit(_current.copyWith(listBranchesEmit: ErrorState(failure))),
      (data) => safeEmit(_current.copyWith(listBranchesEmit: Success(data))),
    );
  }

  /// Creates a new branch via the API.
  Future<void> createBranchFunc(CreateBranchReqParam param) async {
    safeEmit(_current.copyWith(createBranchEmit: Loading()));
    final result = await _service.createBranchServ(param);
    result.fold(
      (failure) => safeEmit(_current.copyWith(createBranchEmit: ErrorState(failure))),
      (data) => safeEmit(_current.copyWith(createBranchEmit: Success(data))),
    );
  }
}
