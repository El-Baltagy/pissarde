// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chech_in_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChechInResImpl _$$ChechInResImplFromJson(Map<String, dynamic> json) =>
    _$ChechInResImpl(
      message: json['message'] as String,
      attendance:
          Attendance.fromJson(json['attendance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChechInResImplToJson(_$ChechInResImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'attendance': instance.attendance.toJson(),
    };

_$AttendanceImpl _$$AttendanceImplFromJson(Map<String, dynamic> json) =>
    _$AttendanceImpl(
      id: (json['id'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      branch: Branch.fromJson(json['branch'] as Map<String, dynamic>),
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      date: json['date'] as String,
      check_in_at: json['check_in_at'] as String,
      check_out_at: json['check_out_at'] as String,
      check_in_method: Checkinmethod.fromJson(
          json['check_in_method'] as Map<String, dynamic>),
      check_out_method: Checkoutmethod.fromJson(
          json['check_out_method'] as Map<String, dynamic>),
      recorded_by: json['recorded_by'],
      duty_reason: json['duty_reason'],
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      late_minutes: (json['late_minutes'] as num).toInt(),
      early_departure_minutes: (json['early_departure_minutes'] as num).toInt(),
      total_work_minutes: (json['total_work_minutes'] as num).toInt(),
      overtime_minutes: (json['overtime_minutes'] as num).toInt(),
      is_open: json['is_open'] as bool,
    );

Map<String, dynamic> _$$AttendanceImplToJson(_$AttendanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'branch': instance.branch.toJson(),
      'shift': instance.shift.toJson(),
      'date': instance.date,
      'check_in_at': instance.check_in_at,
      'check_out_at': instance.check_out_at,
      'check_in_method': instance.check_in_method.toJson(),
      'check_out_method': instance.check_out_method.toJson(),
      'recorded_by': instance.recorded_by,
      'duty_reason': instance.duty_reason,
      'status': instance.status.toJson(),
      'late_minutes': instance.late_minutes,
      'early_departure_minutes': instance.early_departure_minutes,
      'total_work_minutes': instance.total_work_minutes,
      'overtime_minutes': instance.overtime_minutes,
      'is_open': instance.is_open,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      employee_code: json['employee_code'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'employee_code': instance.employee_code,
    };

_$BranchImpl _$$BranchImplFromJson(Map<String, dynamic> json) => _$BranchImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$BranchImplToJson(_$BranchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };

_$ShiftImpl _$$ShiftImplFromJson(Map<String, dynamic> json) => _$ShiftImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
      is_overnight: json['is_overnight'] as bool,
    );

Map<String, dynamic> _$$ShiftImplToJson(_$ShiftImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'is_overnight': instance.is_overnight,
    };

_$CheckinmethodImpl _$$CheckinmethodImplFromJson(Map<String, dynamic> json) =>
    _$CheckinmethodImpl(
      value: json['value'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$CheckinmethodImplToJson(_$CheckinmethodImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

_$CheckoutmethodImpl _$$CheckoutmethodImplFromJson(Map<String, dynamic> json) =>
    _$CheckoutmethodImpl(
      value: json['value'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$CheckoutmethodImplToJson(
        _$CheckoutmethodImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

_$StatusImpl _$$StatusImplFromJson(Map<String, dynamic> json) => _$StatusImpl(
      value: json['value'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$StatusImplToJson(_$StatusImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };
