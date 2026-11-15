// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchesListImpl _$$BranchesListImplFromJson(Map<String, dynamic> json) =>
    _$BranchesListImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BranchesListImplToJson(_$BranchesListImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$DataItemImpl _$$DataItemImplFromJson(Map<String, dynamic> json) =>
    _$DataItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      geofence_radius_meters: (json['geofence_radius_meters'] as num).toInt(),
      is_active: json['is_active'] as bool,
      employees_count: (json['employees_count'] as num).toInt(),
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$DataItemImplToJson(_$DataItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'geofence_radius_meters': instance.geofence_radius_meters,
      'is_active': instance.is_active,
      'employees_count': instance.employees_count,
      'created_at': instance.created_at,
    };
