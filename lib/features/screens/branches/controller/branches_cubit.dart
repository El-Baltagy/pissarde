import 'package:newf/core/api_helper/cancel/cancel_manager.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/branches/service/base_branches_service.dart';
import 'package:newf/features/screens/branches/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/branches/data/model/branches/create_branch_res/create_branch_res.dart';
import 'package:newf/features/screens/branches/data/model/branches/1-create_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/branches/2-delete_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/branches/2-update_branch_req_param.dart';

import '../../../../core/base/base_service.dart';
import '../../../../core/constants/app_constant.dart';
import '../../../../core/shared/methods/no_parameter.dart';
import '../data/model/delete_branch_res.dart';

part 'branches_state.dart';

class BranchesCubit extends BaseCubit<BranchesState> {
  BranchesCubit(this._service) : super(BranchesLoaded());

  final BaseBranchesService _service;

  static BranchesCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  BranchesLoaded get _current =>
      state is BranchesLoaded ? state as BranchesLoaded : BranchesLoaded();

  int get getListBranchesKeyCode => AppConstant.getListBranchesKeyCode;
  int get createBranchKeyCode => AppConstant.createBranchKeyCode;
  int get updateBranchKeyCode => AppConstant.updateBranchKeyCode;
  int get deleteBranchKeyCode => AppConstant.deleteBranchKeyCode;

  @override
  Future<void> init() async {}

  @override
  Future<void> close() {
    CancelManager.cancel(updateBranchKeyCode);
    CancelManager.cancel(deleteBranchKeyCode);
    CancelManager.cancel(createBranchKeyCode);
    CancelManager.cancel(getListBranchesKeyCode);
    return super.close();
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

  Future<void> createBranchFunc({
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

  Future<void> updateBranchFunc({
    UpdateBranchReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(updateBranchKeyCode, (token) async {
      await _service.updateBranchServ(
        RequestCallbackObserver<CreateBranchRes, UpdateBranchReqParam>(
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

  Future<void> deleteBranchFunc(
    BaseRequestBackType baseRequestBackType, {
    DeleteBranchReqParam? parameter,
  }) async {
    await CancelManager.runCancelableFun(deleteBranchKeyCode, (token) async {
      await _service.deleteBranchServ(
        RequestCallbackObserver<DeleteBranchRes, DeleteBranchReqParam>(
          baseRequestBackType: baseRequestBackType,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () =>
              safeEmit(_current.copyWith(deleteBranchState: Loading())),
          onRightCallback: (data) =>
              safeEmit(_current.copyWith(deleteBranchState: Success(data))),
          onLeftCallback: (failure) => safeEmit(
            _current.copyWith(deleteBranchState: ErrorState(failure)),
          ),
        ),
      );
    });
  }

  void resetStateAfterSuccess() {
    safeEmit(_current.copyWith(resetMutationStates: true));
  }
}
