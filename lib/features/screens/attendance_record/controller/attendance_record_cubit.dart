 import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/attendance_record/service/base_attendance_record_service.dart';
part 'attendance_record_state.dart';

class AttendanceRecordCubit extends BaseCubit<AttendanceRecordState> {
   AttendanceRecordCubit(this._service) : super(AttendanceRecordLoaded()) ;

  /// Depends on the abstraction [BaseAttendanceRecordService], not on a concrete implementation.
  final BaseAttendanceRecordService _service;
  
     static AttendanceRecordCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
    // Always holds the latest combined state — used by copyWith
   AttendanceRecordLoaded get _current => state is AttendanceRecordLoaded
       ? state as AttendanceRecordLoaded
       : AttendanceRecordLoaded();
       
    @override
  Future<void> init() async {
     // TODO: implement init

   }
  
}
