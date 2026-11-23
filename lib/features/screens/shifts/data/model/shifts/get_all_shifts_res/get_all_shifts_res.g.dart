// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_shifts_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllShiftsResImpl _$$GetAllShiftsResImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAllShiftsResImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => ShiftItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetAllShiftsResImplToJson(
        _$GetAllShiftsResImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$ShiftItemImpl _$$ShiftItemImplFromJson(Map<String, dynamic> json) =>
    _$ShiftItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
      is_overnight: json['is_overnight'] as bool,
      grace_period_minutes: (json['grace_period_minutes'] as num).toInt(),
      checkin_window_start_minutes:
          (json['checkin_window_start_minutes'] as num).toInt(),
      checkin_window_end_minutes:
          (json['checkin_window_end_minutes'] as num).toInt(),
      break_duration_minutes: (json['break_duration_minutes'] as num).toInt(),
      working_days: (json['working_days'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      is_active: json['is_active'] as bool,
      employees_count: (json['employees_count'] as num?)?.toInt(),
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$ShiftItemImplToJson(_$ShiftItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'is_overnight': instance.is_overnight,
      'grace_period_minutes': instance.grace_period_minutes,
      'checkin_window_start_minutes': instance.checkin_window_start_minutes,
      'checkin_window_end_minutes': instance.checkin_window_end_minutes,
      'break_duration_minutes': instance.break_duration_minutes,
      'working_days': instance.working_days,
      'is_active': instance.is_active,
      'employees_count': instance.employees_count,
      'created_at': instance.created_at,
    };
