import 'package:newf/core/api_helper/cancel/cancel_manager.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/shifts/service/base_shifts_service.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/get_all_shifts_res/get_all_shifts_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/creating_shift_res/shift_creating_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/delete_shift_res/delete_shift_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/1-create_shift_req_param.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/2-delete_shift_req_param.dart';

import '../../../../core/base/base_service.dart';
import '../../../../core/constants/app_constant.dart';
import '../../../../core/shared/methods/no_parameter.dart';

part 'shifts_state.dart';

class ShiftsCubit extends BaseCubit<ShiftsState> {
  ShiftsCubit(this._service) : super(ShiftsLoaded());

  final BaseShiftsService _service;

  static ShiftsCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  ShiftsLoaded get _current =>
      state is ShiftsLoaded ? state as ShiftsLoaded : ShiftsLoaded();

  int get getListShiftsKeyCode => AppConstant.getListShiftsKeyCode;
  int get addEditShiftKeyCode => AppConstant.createShiftKeyCode;
  int get deleteShiftKeyCode => AppConstant.deleteShiftKeyCode;

  @override
  Future<void> init() async {}

  @override
  Future<void> close() {
    CancelManager.cancel(deleteShiftKeyCode);
    CancelManager.cancel(addEditShiftKeyCode);
    CancelManager.cancel(getListShiftsKeyCode);
    return super.close();
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

  Future<void> addEditShiftFunc(
    BaseRequestBackType baseRequestBackType, {
    AddEditShiftReqParam? parameter,
  }) async {
    final keyCode = addEditShiftKeyCode;
    await CancelManager.runCancelableFun(keyCode, (token) async {
      final obs = RequestCallbackObserver<ShiftCreatingRes, AddEditShiftReqParam>(
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
      );
      if (parameter?.id == null || parameter!.id.toString().isEmpty) {
        await _service.createShiftServ(obs);
      } else {
        await _service.updateShiftServ(obs);
      }
    });
  }

  Future<void> deleteShiftFunc(
    BaseRequestBackType baseRequestBackType, {
    DeleteShiftReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(deleteShiftKeyCode, (token) async {
      await _service.deleteShiftServ(
        RequestCallbackObserver<DeleteShiftRes, DeleteShiftReqParam>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(deleteShiftState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(deleteShiftState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(deleteShiftState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  void resetStateAfterSuccess() {
    safeEmit(_current.copyWith(resetMutationStates: true));
  }
}
