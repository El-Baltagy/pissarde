import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/api_helper/cancel/cancel_manager.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_service.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/features/screens/login/controller/login_state.dart';
import 'package:newf/features/screens/login/data/model/login_res/login_res.dart';
import 'package:newf/features/screens/login/service/base_login_service.dart';
import 'package:newf/main.dart';

import '../../../../core/shared/methods/no_parameter.dart';
import '../data/model/login_req_param.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._service) : super(LoginInitial());
  final BaseLoginService _service;

  static LoginCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  int get loginKeyCode => AppConstant.loginKeyCode;

    int get logoutKeyCode => AppConstant.logoutKeyCode;

    int get getProfileKeyCode => AppConstant.getProfileKeyCode;

  @override
  Future<void> init() async {}

  Future<void> login({required LoginReqParam parameter}) async {
    await CancelManager.runCancelableFun(loginKeyCode, (token) async {
      await _service.loginServ(
        RequestCallbackObserver<LoginRes, LoginReqParam>(
          baseRequestBackType: Reload(),
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(LoginResState(Loading())),
          onRightCallback: (data) => safeEmit(LoginResState(Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(LoginResState(ErrorState(failure))),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(getProfileKeyCode);

    // add every key in file
    CancelManager.cancel(logoutKeyCode);
    CancelManager.cancel(loginKeyCode);
    return super.close();
  }



  Future<void> logoutFunc( {NoParameters? parameter}) async {
    await CancelManager.runCancelableFun(logoutKeyCode, (token) async {
      await _service.logoutServ(
        RequestCallbackObserver<bool, NoParameters>(
           parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(LogoutState(Loading())),
          onRightCallback: (data) => safeEmit(LogoutState(Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(LogoutState(ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> getProfileFunc(BaseRequestBackType baseRequestBackType,{NoParameters? parameter}) async {
    // await CancelManager.runCancelableFun(getProfileKeyCode, (token) async {
      await _service.getProfileServ(
        RequestCallbackObserver<User, NoParameters>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          // cancelToken: token,
          onLoadCallback: () => safeEmit(GetProfileState(Loading())),
          onRightCallback: (data) => safeEmit(GetProfileState(Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(GetProfileState(ErrorState(failure))),
        ),
      );
    // });
  }
}
