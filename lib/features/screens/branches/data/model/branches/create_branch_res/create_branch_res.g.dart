// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_branch_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateBranchResImpl _$$CreateBranchResImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateBranchResImpl(
      message: json['message'] as String,
      branch: Branch.fromJson(json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateBranchResImplToJson(
        _$CreateBranchResImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'branch': instance.branch.toJson(),
    };

_$BranchImpl _$$BranchImplFromJson(Map<String, dynamic> json) => _$BranchImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      geofence_radius_meters: (json['geofence_radius_meters'] as num).toInt(),
      is_active: json['is_active'] as bool,
      created_at: json['created_at'] as String,
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
      'is_active': instance.is_active,
      'created_at': instance.created_at,
    };
