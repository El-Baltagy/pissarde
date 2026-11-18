// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_leaves_types_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetLeavesTypesResImpl _$$GetLeavesTypesResImplFromJson(
        Map<String, dynamic> json) =>
    _$GetLeavesTypesResImpl(
      leave_types: (json['leave_types'] as List<dynamic>)
          .map((e) => LeaveTypeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetLeavesTypesResImplToJson(
        _$GetLeavesTypesResImpl instance) =>
    <String, dynamic>{
      'leave_types': instance.leave_types.map((e) => e.toJson()).toList(),
    };

_$LeaveTypeItemImpl _$$LeaveTypeItemImplFromJson(Map<String, dynamic> json) =>
    _$LeaveTypeItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      default_days_per_year: (json['default_days_per_year'] as num).toInt(),
      requires_attachment: json['requires_attachment'] as bool,
      is_paid: json['is_paid'] as bool,
      is_active: json['is_active'] as bool,
      description: json['description'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$LeaveTypeItemImplToJson(_$LeaveTypeItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'default_days_per_year': instance.default_days_per_year,
      'requires_attachment': instance.requires_attachment,
      'is_paid': instance.is_paid,
      'is_active': instance.is_active,
      'description': instance.description,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
