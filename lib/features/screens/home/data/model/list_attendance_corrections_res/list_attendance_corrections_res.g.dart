// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_attendance_corrections_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListAttendanceCorrectionsResImpl _$$ListAttendanceCorrectionsResImplFromJson(
        Map<String, dynamic> json) =>
    _$ListAttendanceCorrectionsResImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ListAttendanceCorrectionsResImplToJson(
        _$ListAttendanceCorrectionsResImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };

_$DataItemImpl _$$DataItemImplFromJson(Map<String, dynamic> json) =>
    _$DataItemImpl(
      id: (json['id'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      attendance_id: json['attendance_id'],
      date: json['date'] as String,
      requested_check_in_at: json['requested_check_in_at'] as String,
      requested_check_out_at: json['requested_check_out_at'] as String,
      reason: json['reason'] as String,
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      reviewed_by: json['reviewed_by'],
      reviewed_at: json['reviewed_at'],
      review_notes: json['review_notes'],
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$DataItemImplToJson(_$DataItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'attendance_id': instance.attendance_id,
      'date': instance.date,
      'requested_check_in_at': instance.requested_check_in_at,
      'requested_check_out_at': instance.requested_check_out_at,
      'reason': instance.reason,
      'status': instance.status.toJson(),
      'reviewed_by': instance.reviewed_by,
      'reviewed_at': instance.reviewed_at,
      'review_notes': instance.review_notes,
      'created_at': instance.created_at,
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

_$StatusImpl _$$StatusImplFromJson(Map<String, dynamic> json) => _$StatusImpl(
      value: json['value'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$StatusImplToJson(_$StatusImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      current_page: (json['current_page'] as num).toInt(),
      last_page: (json['last_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'last_page': instance.last_page,
      'total': instance.total,
    };
