import 'package:newf/core/api_helper/cancel/cancel_manager.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
 import 'package:newf/features/screens/home/data/model/chech_in_res/chech_in_res.dart';
import 'package:newf/features/screens/home/data/model/check_in_req_param.dart';
import 'package:newf/features/screens/home/data/model/check_out_req_param.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/home/service/base_home_service.dart';

import '../data/model/check_in_today_status_res/check_in_today_status_res.dart';
part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
   HomeCubit(this._service) : super(HomeLoaded()) ;

  /// Depends on the abstraction [BaseHomeService], not on a concrete implementation.
  final BaseHomeService _service;
  
     static HomeCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
    // Always holds the latest combined state — used by copyWith
   HomeLoaded get _current => state is HomeLoaded
       ? state as HomeLoaded
       : HomeLoaded();
       
      int get attendanceTodayKeyCode => AppConstant.attendanceTodayKeyCode;

    int get checkInKeyCode => AppConstant.checkInKeyCode;

    int get checkOutKeyCode => AppConstant.checkOutKeyCode;

  @override
  Future<void> init() async {
    await attendanceTodayFunc(Init());
  }
  

  Future<void> attendanceTodayFunc(BaseRequestBackType baseRequestBackType,{NoParameters? parameter}) async {
    await CancelManager.runCancelableFun(attendanceTodayKeyCode, (token) async {
      await _service.attendanceTodayServ(
        RequestCallbackObserver<CheckInTodayStatusRes, NoParameters>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(attendanceTodayState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(attendanceTodayState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(attendanceTodayState: ErrorState(failure))),
        ),
      );
    });
  }
  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(checkOutKeyCode);

    // add every key in file
    CancelManager.cancel(checkInKeyCode);

    // add every key in file
    CancelManager.cancel(attendanceTodayKeyCode);
    return super.close();
  }

  Future<void> checkInFunc(BaseRequestBackType baseRequestBackType,{CheckInReqParam? parameter}) async {
    await CancelManager.runCancelableFun(checkInKeyCode, (token) async {
      await _service.checkInServ(
        RequestCallbackObserver<ChechInRes, CheckInReqParam>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(checkInState: Loading())),
          onRightCallback: (data) {
            safeEmit(_current.copyWith(checkInState: Success(data)));
            attendanceTodayFunc(Reload());
          },
          onLeftCallback: (failure) => safeEmit(_current.copyWith(checkInState: ErrorState(failure))),
        ),
      );
    });
  }

  Future<void> checkOutFunc(BaseRequestBackType baseRequestBackType,{CheckOutReqParam? parameter}) async {
    await CancelManager.runCancelableFun(checkOutKeyCode, (token) async {
      await _service.checkOutServ(
        RequestCallbackObserver<ChechInRes, CheckOutReqParam>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(checkOutState: Loading())),
          onRightCallback: (data) {
            safeEmit(_current.copyWith(checkOutState: Success(data)));
            attendanceTodayFunc(Reload());
          },
          onLeftCallback: (failure) => safeEmit(_current.copyWith(checkOutState: ErrorState(failure))),
        ),
      );
    });
  }
}
