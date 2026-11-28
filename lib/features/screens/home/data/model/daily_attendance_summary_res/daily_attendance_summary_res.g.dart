// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_attendance_summary_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyAttendanceSummaryResImpl _$$DailyAttendanceSummaryResImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyAttendanceSummaryResImpl(
      date: json['date'] as String,
      branch_id: json['branch_id'] as String?,
      branch_name: json['branch_name'] as String?,
      total_employees: (json['total_employees'] as num).toInt(),
      present_on_time: (json['present_on_time'] as num).toInt(),
      late: (json['late'] as num).toInt(),
      absent: (json['absent'] as num).toInt(),
      on_leave: (json['on_leave'] as num).toInt(),
    );

Map<String, dynamic> _$$DailyAttendanceSummaryResImplToJson(
        _$DailyAttendanceSummaryResImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'branch_id': instance.branch_id,
      'branch_name': instance.branch_name,
      'total_employees': instance.total_employees,
      'present_on_time': instance.present_on_time,
      'late': instance.late,
      'absent': instance.absent,
      'on_leave': instance.on_leave,
    };
