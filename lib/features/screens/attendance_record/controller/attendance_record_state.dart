part of 'attendance_record_cubit.dart';

@immutable
abstract class AttendanceRecordState {}

class AttendanceRecordLoaded extends AttendanceRecordState {

  AttendanceRecordLoaded({
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit ;
  final AttendanceRecordState? refreshOrInit;

  AttendanceRecordLoaded copyWith({
    BaseEmit? allWorkersEmit, 
    AttendanceRecordState? refreshOrInit,
  }) {
    return AttendanceRecordLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 
