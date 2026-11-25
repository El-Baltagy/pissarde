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
import '../data/model/history_attendacne_res/history_attendacne_res.dart';
import '../data/model/history_pagination.dart';
import '../data/model/attendance_history_req_param.dart';
import '../data/model/list_attendance_corrections_res/list_attendance_corrections_res.dart';
import '../data/model/corrections_pagination.dart';
import '../data/model/attendance_corrections_param.dart';
import '../data/model/attendance_correction_request_res/attendance_correction_request_res.dart';
import '../data/model/rotate_branch_qr_code_res/rotate_branch_qr_code_res.dart';
import '../data/model/rotate_branch_qr_param.dart';
import '../data/model/verify_branch_qr_code_res/verify_branch_qr_code_res.dart';
import '../data/model/create_attendance_correction_req_param.dart';
import '../data/model/verify_branch_qr_param.dart';
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
       
      // int get attendanceTodayKeyCode => AppConstant.attendanceTodayKeyCode;

    int get checkInKeyCode => AppConstant.checkInKeyCode;

    int get checkOutKeyCode => AppConstant.checkOutKeyCode;

    int get rotateBranchQrKeyCode => AppConstant.rotateBranchQrKeyCode;

  @override
  Future<void> init() async {
    await attendanceTodayFunc(Init());
  }
  

  Future<void> attendanceTodayFunc(BaseRequestBackType baseRequestBackType,{NoParameters? parameter}) async {

      await _service.attendanceTodayServ(
        RequestCallbackObserver<CheckInTodayStatusRes, NoParameters>(
          baseRequestBackType: baseRequestBackType ,
          parameter: parameter,
          onLoadCallback: () => safeEmit(_current.copyWith(attendanceTodayState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(attendanceTodayState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(attendanceTodayState: ErrorState(failure))),
        ),
      );

  }

  Future<void> getAttendanceHistoryFunc(BaseRequestBackType baseRequestBackType, {AttendanceHistoryReqParam? parameter}) async {
    await _service.getAttendanceHistoryServ(
      RequestCallbackObserver<HistoryAttendacneRes, AttendanceHistoryReqParam>(
        baseRequestBackType: baseRequestBackType,
        parameter: parameter,
        onLoadCallback: () => safeEmit(
          _current.copyWith(
            attendanceHistoryState: (baseRequestBackType is Reload)
                ? Loading<HistoryAttendacneRes>()
                : Loading<HistoryAttendacneRes>(
                    _current.attendanceHistoryState is Success<HistoryAttendacneRes>
                        ? (_current.attendanceHistoryState as Success<HistoryAttendacneRes>).data
                        : null,
                  ),
          ),
        ),
        onRightCallback: (data) => safeEmit(
          _current.copyWith(attendanceHistoryState: Success(data, baseRequestBackType)),
        ),
        onLeftCallback: (failure) => safeEmit(
          _current.copyWith(attendanceHistoryState: ErrorState(failure)),
        ),
      ),
    );
  }

  Future<void> getAttendanceCorrectionsFunc(BaseRequestBackType baseRequestBackType, {AttendanceCorrectionsParam? parameter}) async {
    await _service.getAttendanceCorrectionsServ(
      RequestCallbackObserver<ListAttendanceCorrectionsRes, AttendanceCorrectionsParam>(
        baseRequestBackType: baseRequestBackType,
        parameter: parameter,
        onLoadCallback: () => safeEmit(
          _current.copyWith(
            attendanceCorrectionsState: (baseRequestBackType is Reload)
                ? Loading<ListAttendanceCorrectionsRes>()
                : Loading<ListAttendanceCorrectionsRes>(
                    _current.attendanceCorrectionsState is Success<ListAttendanceCorrectionsRes>
                        ? (_current.attendanceCorrectionsState as Success<ListAttendanceCorrectionsRes>).data
                        : null,
                  ),
          ),
        ),
        onRightCallback: (data) => safeEmit(
          _current.copyWith(attendanceCorrectionsState: Success(data, baseRequestBackType)),
        ),
        onLeftCallback: (failure) => safeEmit(
          _current.copyWith(attendanceCorrectionsState: ErrorState(failure)),
        ),
      ),
    );
  }

  Future<void> createAttendanceCorrectionFunc(BaseRequestBackType baseRequestBackType, {CreateAttendanceCorrectionReqParam? parameter}) async {
    await _service.createAttendanceCorrectionServ(
      RequestCallbackObserver<AttendanceCorrectionRequestRes, CreateAttendanceCorrectionReqParam>(
        baseRequestBackType: baseRequestBackType,
        parameter: parameter,
        onLoadCallback: () => safeEmit(_current.copyWith(createAttendanceCorrectionState: Loading())),
        onRightCallback: (data) => safeEmit(_current.copyWith(createAttendanceCorrectionState: Success(data))),
        onLeftCallback: (failure) => safeEmit(_current.copyWith(createAttendanceCorrectionState: ErrorState(failure))),
      ),
    );
  }

  Future<void> verifyBranchQrFunc(BaseRequestBackType baseRequestBackType, {VerifyBranchQrParam? parameter}) async {
    await _service.verifyBranchQrServ(
      RequestCallbackObserver<VerifyBranchQrCodeRes, VerifyBranchQrParam>(
        baseRequestBackType: baseRequestBackType,
        parameter: parameter,
        onLoadCallback: () => safeEmit(_current.copyWith(verifyBranchQrState: Loading())),
        onRightCallback: (data) => safeEmit(_current.copyWith(verifyBranchQrState: Success(data))),
        onLeftCallback: (failure) => safeEmit(_current.copyWith(verifyBranchQrState: ErrorState(failure))),
      ),
    );
  }
  @override
  Future<void> close() {
    // add every key in file
    CancelManager.cancel(rotateBranchQrKeyCode);

    // add every key in file
    CancelManager.cancel(checkOutKeyCode);

    // add every key in file
    CancelManager.cancel(checkInKeyCode);

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

  Future<void> rotateBranchQrFunc( {RotateBranchQrParam? parameter}) async {
    await CancelManager.runCancelableFun(rotateBranchQrKeyCode, (token) async {
      await _service.rotateBranchQrServ(
        RequestCallbackObserver<RotateBranchQrCodeRes, RotateBranchQrParam>(
          parameter: parameter,
          cancelToken: token,
          onLoadCallback: () => safeEmit(_current.copyWith(rotateBranchQrState: Loading())),
          onRightCallback: (data) => safeEmit(_current.copyWith(rotateBranchQrState: Success(data))),
          onLeftCallback: (failure) => safeEmit(_current.copyWith(rotateBranchQrState: ErrorState(failure))),
        ),
      );
    });
  }
}
