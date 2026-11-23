// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_employees_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllEmployeesResImpl _$$GetAllEmployeesResImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAllEmployeesResImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetAllEmployeesResImplToJson(
        _$GetAllEmployeesResImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'links': instance.links.toJson(),
      'meta': instance.meta.toJson(),
    };

_$DataItemImpl _$$DataItemImplFromJson(Map<String, dynamic> json) =>
    _$DataItemImpl(
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
      supervisor: json['supervisor'] == null
          ? null
          : Supervisor.fromJson(json['supervisor'] as Map<String, dynamic>),
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      duty_authorized_branch_ids: json['duty_authorized_branch_ids'],
      is_active: json['is_active'] as bool,
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$DataItemImplToJson(_$DataItemImpl instance) =>
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
      'supervisor': instance.supervisor?.toJson(),
      'shift': instance.shift.toJson(),
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

_$SupervisorImpl _$$SupervisorImplFromJson(Map<String, dynamic> json) =>
    _$SupervisorImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$SupervisorImplToJson(_$SupervisorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
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

_$LinksImpl _$$LinksImplFromJson(Map<String, dynamic> json) => _$LinksImpl(
      first: json['first'] as String,
      last: json['last'] as String,
      prev: json['prev'],
      next: json['next'],
    );

Map<String, dynamic> _$$LinksImplToJson(_$LinksImpl instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      current_page: (json['current_page'] as num).toInt(),
      from: (json['from'] as num).toInt(),
      last_page: (json['last_page'] as num).toInt(),
      links: (json['links'] as List<dynamic>)
          .map((e) => LinkItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
      per_page: (json['per_page'] as num).toInt(),
      to: (json['to'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'from': instance.from,
      'last_page': instance.last_page,
      'links': instance.links.map((e) => e.toJson()).toList(),
      'path': instance.path,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
    };

_$LinkItemImpl _$$LinkItemImplFromJson(Map<String, dynamic> json) =>
    _$LinkItemImpl(
      url: json['url'],
      label: json['label'] as String,
      page: json['page'],
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$LinkItemImplToJson(_$LinkItemImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'page': instance.page,
      'active': instance.active,
    };
