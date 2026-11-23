import 'package:newf/core/api_helper/cancel/cancel_manager.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/profile/service/base_profile_service.dart';
import 'package:newf/features/screens/profile/data/model/get_avilable_holidays_res/get_avilable_holidays_res.dart';

import '../../../../core/base/base_service.dart';
import '../../../../core/constants/app_constant.dart';
import '../../../../core/shared/methods/no_parameter.dart';

part 'profile_state.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  ProfileCubit(this._service) : super(ProfileLoaded());

  final BaseProfileService _service;

  static ProfileCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  ProfileLoaded get _current =>
      state is ProfileLoaded ? state as ProfileLoaded : ProfileLoaded();

  int get getListHolidaysKeyCode => AppConstant.getListHolidaysKeyCode;

  @override
  Future<void> init() async {}

  @override
  Future<void> close() {
    CancelManager.cancel(getListHolidaysKeyCode);
    return super.close();
  }

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
}
