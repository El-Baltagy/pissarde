// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_today_status_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckInTodayStatusResImpl _$$CheckInTodayStatusResImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckInTodayStatusResImpl(
      date: json['date'] as String,
      has_checked_in: json['has_checked_in'] as bool,
      is_open: json['is_open'] as bool,
      active_attendance: json['active_attendance'],
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      branch: Branch.fromJson(json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CheckInTodayStatusResImplToJson(
        _$CheckInTodayStatusResImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'has_checked_in': instance.has_checked_in,
      'is_open': instance.is_open,
      'active_attendance': instance.active_attendance,
      'shift': instance.shift.toJson(),
      'branch': instance.branch.toJson(),
    };

_$ShiftImpl _$$ShiftImplFromJson(Map<String, dynamic> json) => _$ShiftImpl(
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
      deleted_at: json['deleted_at'],
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$ShiftImplToJson(_$ShiftImpl instance) =>
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
      'deleted_at': instance.deleted_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

_$BranchImpl _$$BranchImplFromJson(Map<String, dynamic> json) => _$BranchImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      geofence_radius_meters: (json['geofence_radius_meters'] as num).toInt(),
      qr_secret: json['qr_secret'] as String,
      qr_token: json['qr_token'] as String,
      qr_generated_at: json['qr_generated_at'] as String,
      is_active: json['is_active'] as bool,
      deleted_at: json['deleted_at'],
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$BranchImplToJson(_$BranchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'geofence_radius_meters': instance.geofence_radius_meters,
      'qr_secret': instance.qr_secret,
      'qr_token': instance.qr_token,
      'qr_generated_at': instance.qr_generated_at,
      'is_active': instance.is_active,
      'deleted_at': instance.deleted_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
