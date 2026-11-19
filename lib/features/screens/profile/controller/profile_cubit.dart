import 'package:newf/core/api_helper/cancel/cancel_manager.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/profile/service/base_profile_service.dart';
import 'package:newf/features/screens/profile/data/model/employees/get_all_employees_res/get_all_employees_res.dart';
import 'package:newf/features/screens/profile/data/model/employees/create_employee_res/create_employee_res.dart';
import 'package:newf/features/screens/profile/data/model/employees/1-create_employee_req_param.dart';
import 'package:newf/features/screens/profile/data/model/employees/2-update_employee_req_param.dart';
import 'package:newf/features/screens/profile/data/model/employees/3-delete_employee_req_param.dart';
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
import '../../../../core/constants/app_constant.dart';
import '../../../../core/shared/methods/no_parameter.dart';

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

  int get getListHolidaysKeyCode => AppConstant.getListHolidaysKeyCode;


  int get getListEmployeesKeyCode => AppConstant.getListEmployeesKeyCode;

  int get createEmployeeKeyCode => AppConstant.createEmployeeKeyCode;


  int get getListShiftsKeyCode => AppConstant.getListShiftsKeyCode;

  int get getListBranchesKeyCode => AppConstant.getListBranchesKeyCode;


  int get createBranchKeyCode => AppConstant.createBranchKeyCode;

  int get createShiftKeyCode => AppConstant.createShiftKeyCode;

    int get deleteShiftKeyCode => AppConstant.deleteShiftKeyCode;

    int get updateShiftKeyCode => AppConstant.updateShiftKeyCode;

    int get deleteBranchKeyCode => AppConstant.deleteBranchKeyCode;

    int get updateBranchKeyCode => AppConstant.updateBranchKeyCode;

    int get deleteEmployeeKeyCode => AppConstant.deleteEmployeeKeyCode;

    int get updateEmployeeKeyCode => AppConstant.updateEmployeeKeyCode;

  @override
  Future<void> init() async {}

  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(updateEmployeeKeyCode);

    // add every key in file
    CancelManager.cancel(deleteEmployeeKeyCode);

    // add every key in file
    CancelManager.cancel(updateBranchKeyCode);

    // add every key in file
    CancelManager.cancel(deleteBranchKeyCode);

    // add every key in file
    CancelManager.cancel(updateShiftKeyCode);

    // add every key in file
    CancelManager.cancel(deleteShiftKeyCode);

    // add every key in file
    CancelManager.cancel(createBranchKeyCode);

    // add every key in file
    CancelManager.cancel(getListBranchesKeyCode);

    // add every key in file
    CancelManager.cancel(createShiftKeyCode);

    // add every key in file
    CancelManager.cancel(getListShiftsKeyCode);

    // add every key in file
    CancelManager.cancel(createEmployeeKeyCode);

    // add every key in file
    CancelManager.cancel(getListEmployeesKeyCode);

    // add every key in file
    CancelManager.cancel(getListHolidaysKeyCode);
    return super.close();
  }

  Future<void> getListEmployeesFunc(
    BaseRequestBackType baseRequestBackType, {
    NoParameters? parameter,
  }) async {
    await CancelManager.runCancelableFun(getListEmployeesKeyCode, (
      token,
    ) async {
      await _service.getListEmployeesServ(
        RequestCallbackObserver<GetAllEmployeesRes, NoParameters>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(getListEmployeesState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(getListEmployeesState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(getListEmployeesState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  Future<void> getListShiftsFunc(
    BaseRequestBackType baseRequestBackType, {
    NoParameters? parameter,
  }) async {
    await CancelManager.runCancelableFun(getListShiftsKeyCode, (token) async {
      await _service.getListShiftsServ(
        RequestCallbackObserver<GetAllShiftsRes, NoParameters>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(getListShiftsState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(getListShiftsState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(getListShiftsState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  Future<void> getListBranchesFunc(
    BaseRequestBackType baseRequestBackType, {
    NoParameters? parameter,
  }) async {
    await CancelManager.runCancelableFun(getListBranchesKeyCode, (token) async {
      await _service.getListBranchesServ(
        RequestCallbackObserver<BranchesList, NoParameters>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(getListBranchesState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(getListBranchesState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(getListBranchesState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  /// Fetches the list of official/available holidays from the API.
  Future<void> getListHolidaysFunc(
    BaseRequestBackType baseRequestBackType, {
    NoParameters? parameter,
  }) async {
    await CancelManager.runCancelableFun(getListHolidaysKeyCode, (token) async {
      await _service.getListHolidaysServ(
        RequestCallbackObserver<GetAvilableHolidaysRes, NoParameters>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(getListHolidaysState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(getListHolidaysState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(getListHolidaysState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  /// Creates a new employee via the API.
  Future<void> createEmployeeFunc(
    BaseRequestBackType baseRequestBackType, {
    CreateEmployeeReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(createEmployeeKeyCode, (token) async {
      await _service.createEmployeeServ(
        RequestCallbackObserver<CreateEmployeeRes, CreateEmployeeReqParam>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(addEditEmployeeState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(addEditEmployeeState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(addEditEmployeeState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  /// Creates a new shift via the API.
  Future<void> createShiftFunc(
    BaseRequestBackType baseRequestBackType, {
    AddEditShiftReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(createShiftKeyCode, (token) async {
      await _service.createShiftServ(
        RequestCallbackObserver<ShiftCreatingRes, AddEditShiftReqParam>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(addEditShiftState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(addEditShiftState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(addEditShiftState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  /// Clears the create / update / delete emit states of [screenTypeAction]
  /// so stale `Success` / `ErrorState` results don't trigger listeners again.
  void resetStateAfterSuccess(ScreenTypeAction screenTypeAction) {
    safeEmit(_current.copyWith(screenTypeAction: screenTypeAction));
  }

  /// Creates a new branch via the API.
  Future<void> createBranchFunc(
   {
    CreateBranchReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(createBranchKeyCode, (token) async {
      await _service.createBranchServ(
        RequestCallbackObserver<CreateBranchRes, CreateBranchReqParam>(

          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(addEditBranchState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(addEditBranchState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(addEditBranchState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  Future<void> deleteShiftFunc(BaseRequestBackType baseRequestBackType,{DeleteShiftReqParam? parameter}) async {
    await CancelManager.runCancelableFun(deleteShiftKeyCode, (token) async {
      await _service.deleteShiftServ(
        RequestCallbackObserver<DeleteShiftRes, DeleteShiftReqParam>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(deleteShiftState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(deleteShiftState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(deleteShiftState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> updateShiftFunc(BaseRequestBackType baseRequestBackType,{AddEditShiftReqParam? parameter}) async {
    await CancelManager.runCancelableFun(updateShiftKeyCode, (token) async {
      await _service.updateShiftServ(
        RequestCallbackObserver<ShiftCreatingRes, AddEditShiftReqParam>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(addEditShiftState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(addEditShiftState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(addEditShiftState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> deleteBranchFunc(BaseRequestBackType baseRequestBackType,{DeleteBranchReqParam? parameter}) async {
    await CancelManager.runCancelableFun(deleteBranchKeyCode, (token) async {
      await _service.deleteBranchServ(
        RequestCallbackObserver<DeleteShiftRes, DeleteBranchReqParam>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(deleteBranchState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(deleteBranchState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(deleteBranchState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> updateBranchFunc( {UpdateBranchReqParam? parameter}) async {
    await CancelManager.runCancelableFun(updateBranchKeyCode, (token) async {
      await _service.updateBranchServ(
        RequestCallbackObserver<CreateBranchRes, UpdateBranchReqParam>(

          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(addEditBranchState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(addEditBranchState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(addEditBranchState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> deleteEmployeeFunc(BaseRequestBackType baseRequestBackType,{DeleteEmployeeReqParam? parameter}) async {
    await CancelManager.runCancelableFun(deleteEmployeeKeyCode, (token) async {
      await _service.deleteEmployeeServ(
        RequestCallbackObserver<CreateEmployeeRes, DeleteEmployeeReqParam>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(deleteEmployeeState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(deleteEmployeeState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(deleteEmployeeState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> updateEmployeeFunc(BaseRequestBackType baseRequestBackType,{UpdateEmployeeReqParam? parameter}) async {
    await CancelManager.runCancelableFun(updateEmployeeKeyCode, (token) async {
      await _service.updateEmployeeServ(
        RequestCallbackObserver<CreateEmployeeRes, UpdateEmployeeReqParam>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(addEditEmployeeState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(addEditEmployeeState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(addEditEmployeeState: ErrorState(failure))),
        ),
      );
    });
  }
}
enum ScreenTypeAction{
  shift,
  branch,
  employee
}