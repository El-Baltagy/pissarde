import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/api_helper/cancel/cancel_manager.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_service.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/features/screens/login/controller/login_state.dart';
import 'package:newf/features/screens/login/data/model/forget_password_link/forget_password_link.dart';
import 'package:newf/features/screens/login/data/model/forget_password_parameter.dart';
import 'package:newf/features/screens/login/data/model/login_parameters.dart';
import 'package:newf/features/screens/login/data/model/login_res/login_res.dart';
import 'package:newf/features/screens/login/service/base_login_service.dart';
import 'package:newf/main.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._service) : super(LoginInitial());
  final BaseLoginService _service;

  static LoginCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  int get loginKeyCode => AppConstant.loginKeyCode;
  int get sendResetPWLinkKeyCode => AppConstant.sendResetPWLinkKeyCode;

  @override
  Future<void> init() async {}

  Future<void> login({required LoginParameters parameter}) async {
    await CancelManager.runCancelableFun(loginKeyCode, (token) async {
      await _service.loginServ(
        RequestCallbackObserver<LoginRes, LoginParameters>(
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
    CancelManager.cancel(sendResetPWLinkKeyCode);
    CancelManager.cancel(loginKeyCode);
    return super.close();
  }

  Future<void> sendResetPWLinkFunc({ForgetPasswordParameter? parameter}) async {
    await CancelManager.runCancelableFun(sendResetPWLinkKeyCode, (token) async {
      await _service.sendResetPWLinkServ(
        RequestCallbackObserver<ForgetPasswordLink, ForgetPasswordParameter>(
          baseRequestBackType: Reload(),
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(ForgetPasswordLinkState(Loading())),
          onRightCallback: (data) =>
              safeEmit(ForgetPasswordLinkState(Success(data))),
          onLeftCallback: (failure) =>
              safeEmit(ForgetPasswordLinkState(ErrorState(failure))),
        ),
      );
    });
  }
}
