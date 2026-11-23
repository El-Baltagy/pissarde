// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_supervisors_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetSupervisorsListImpl _$$GetSupervisorsListImplFromJson(
        Map<String, dynamic> json) =>
    _$GetSupervisorsListImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Supervisortem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetSupervisorsListImplToJson(
        _$GetSupervisorsListImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$SupervisortemImpl _$$SupervisortemImplFromJson(Map<String, dynamic> json) =>
    _$SupervisortemImpl(
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
      is_active: json['is_active'] as bool,
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$SupervisortemImplToJson(_$SupervisortemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'employee_code': instance.employee_code,
      'phone': instance.phone,
      'role': instance.role.toJson(),
      'employee_type': instance.employee_type.toJson(),
      'work_type': instance.work_type.toJson(),
      'branch': instance.branch.toJson(),
      'is_active': instance.is_active,
      'created_at': instance.created_at,
    };

_$RoleImpl _$$RoleImplFromJson(Map<String, dynamic> json) => _$RoleImpl(
      value: json['value'] as String,
    );

Map<String, dynamic> _$$RoleImplToJson(_$RoleImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

_$EmployeetypeImpl _$$EmployeetypeImplFromJson(Map<String, dynamic> json) =>
    _$EmployeetypeImpl(
      value: json['value'] as String,
    );

Map<String, dynamic> _$$EmployeetypeImplToJson(_$EmployeetypeImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

_$WorktypeImpl _$$WorktypeImplFromJson(Map<String, dynamic> json) =>
    _$WorktypeImpl(
      value: json['value'] as String,
    );

Map<String, dynamic> _$$WorktypeImplToJson(_$WorktypeImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
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
