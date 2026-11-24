import 'package:newf/core/api_helper/cancel/cancel_manager.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/employees/service/base_employees_service.dart';
import 'package:newf/features/screens/employees/data/model/employees/get_all_employees_res/get_all_employees_res.dart';
import 'package:newf/features/screens/employees/data/model/employees/create_employee_res/create_employee_res.dart';
import 'package:newf/features/screens/employees/data/model/employees/1-create_employee_req_param.dart';
import 'package:newf/features/screens/employees/data/model/employees/3-delete_employee_req_param.dart';

import '../../../../core/base/base_service.dart';
import '../../../../core/constants/app_constant.dart';
import '../../../../core/shared/methods/no_parameter.dart';
import '../../../../core/shared/methods/print.dart';
import '../data/model/get_supervisors_list/get_supervisors_list.dart';

part 'employees_state.dart';

class EmployeesCubit extends BaseCubit<EmployeesState> {
  EmployeesCubit(this._service) : super(EmployeesLoaded());

  final BaseEmployeesService _service;

  static EmployeesCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  EmployeesLoaded get _current =>
      state is EmployeesLoaded ? state as EmployeesLoaded : EmployeesLoaded();

  int get getListEmployeesKeyCode => AppConstant.getListEmployeesKeyCode;
  int get addEditEmployeeKeyCode => AppConstant.createEmployeeKeyCode;
  int get deleteEmployeeKeyCode => AppConstant.deleteEmployeeKeyCode;

    int get getSupervisorsKeyCode => AppConstant.getSupervisorsKeyCode;

  @override
  Future<void> init() async {}

  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(getSupervisorsKeyCode);

    CancelManager.cancel(deleteEmployeeKeyCode);
    CancelManager.cancel(addEditEmployeeKeyCode);
    CancelManager.cancel(getListEmployeesKeyCode);
    return super.close();
  }

  Future<void> getListEmployeesFunc(
    BaseRequestBackType baseRequestBackType, {
    NoParameters? parameter,
  }) async {
    await CancelManager.runCancelableFun(getListEmployeesKeyCode, (token) async {
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

  Future<void> addEditEmployeeFunc(
    BaseRequestBackType baseRequestBackType, {
    CreateEmployeeReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(addEditEmployeeKeyCode, (token) async {
      await _service.addEditEmployeeServ(
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

  Future<void> deleteEmployeeFunc(
    BaseRequestBackType baseRequestBackType, {
    DeleteEmployeeReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(deleteEmployeeKeyCode, (token) async {
      await _service.deleteEmployeeServ(
        RequestCallbackObserver<CreateEmployeeRes, DeleteEmployeeReqParam>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(deleteEmployeeState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(deleteEmployeeState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(deleteEmployeeState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  void resetStateAfterSuccess() {
    safeEmit(_current.copyWith(resetMutationStates: true));
  }

  Future<void> getSupervisorsFunc(BaseRequestBackType baseRequestBackType ) async {
    await CancelManager.runCancelableFun(getSupervisorsKeyCode, (token) async {
      await _service.getSupervisorsServ(
        RequestCallbackObserver<GetSupervisorsList, NoParameter>(
          baseRequestBackType: baseRequestBackType ,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(getSupervisorsState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(getSupervisorsState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(getSupervisorsState: ErrorState(failure))),
        ),
      );
    });
  }




}
