// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResImpl _$$LoginResImplFromJson(Map<String, dynamic> json) =>
    _$LoginResImpl(
      message: json['message'] as String,
      token: json['token'] as String,
      token_type: json['token_type'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResImplToJson(_$LoginResImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'token_type': instance.token_type,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      employee_code: json['employee_code'] as String,
      phone: json['phone'] as String,
      role: Role.fromJson(json['role'] as Map<String, dynamic>),
      employee_type:
          Employeetype.fromJson(json['employee_type'] as Map<String, dynamic>),
      work_type: Worktype.fromJson(json['work_type'] as Map<String, dynamic>),
      branch: Branch.fromJson(json['branch'] as Map<String, dynamic>),
      supervisor: json['supervisor'],
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      duty_authorized_branch_ids: json['duty_authorized_branch_ids'],
      is_active: json['is_active'] as bool,
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'employee_code': instance.employee_code,
      'phone': instance.phone,
      'role': instance.role,
      'employee_type': instance.employee_type,
      'work_type': instance.work_type,
      'branch': instance.branch,
      'supervisor': instance.supervisor,
      'shift': instance.shift,
      'duty_authorized_branch_ids': instance.duty_authorized_branch_ids,
      'is_active': instance.is_active,
      'created_at': instance.created_at,
    };

_$RoleImpl _$$RoleImplFromJson(Map<String, dynamic> json) => _$RoleImpl(
      value: json['value'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$RoleImplToJson(_$RoleImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

_$EmployeetypeImpl _$$EmployeetypeImplFromJson(Map<String, dynamic> json) =>
    _$EmployeetypeImpl(
      value: json['value'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$EmployeetypeImplToJson(_$EmployeetypeImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

_$WorktypeImpl _$$WorktypeImplFromJson(Map<String, dynamic> json) =>
    _$WorktypeImpl(
      value: json['value'] as String,
      label: json['label'] as String,
      requires_qr: json['requires_qr'] as bool,
    );

Map<String, dynamic> _$$WorktypeImplToJson(_$WorktypeImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'requires_qr': instance.requires_qr,
    };

_$BranchImpl _$$BranchImplFromJson(Map<String, dynamic> json) => _$BranchImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      geofence_radius_meters: (json['geofence_radius_meters'] as num).toInt(),
    );

Map<String, dynamic> _$$BranchImplToJson(_$BranchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'geofence_radius_meters': instance.geofence_radius_meters,
    };

_$ShiftImpl _$$ShiftImplFromJson(Map<String, dynamic> json) => _$ShiftImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
      is_overnight: json['is_overnight'] as bool,
      grace_period_minutes: (json['grace_period_minutes'] as num).toInt(),
      working_days: (json['working_days'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
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
      'working_days': instance.working_days,
    };
