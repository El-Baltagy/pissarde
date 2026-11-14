import 'package:flutter/material.dart';
import 'package:newf/core/base/base_state.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginResState extends LoginState {
  final BaseEmit baseEmit  ;
  LoginResState(this.baseEmit);
}
class LogoutState extends LoginState {
  final BaseEmit baseEmit ;
  LogoutState(this.baseEmit);
}

class GetProfileState extends LoginState {
  final BaseEmit baseEmit ;
  GetProfileState(this.baseEmit);
}
class ForgetPasswordLinkState extends LoginState {
  final BaseEmit baseEmit;
  ForgetPasswordLinkState(this.baseEmit);
}
