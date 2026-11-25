// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rotate_branch_qr_code_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RotateBranchQrCodeResImpl _$$RotateBranchQrCodeResImplFromJson(
        Map<String, dynamic> json) =>
    _$RotateBranchQrCodeResImpl(
      message: json['message'] as String,
      qr_data: Qrdata.fromJson(json['qr_data'] as Map<String, dynamic>),
      success: json['success'] as bool,
    );

Map<String, dynamic> _$$RotateBranchQrCodeResImplToJson(
        _$RotateBranchQrCodeResImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'qr_data': instance.qr_data.toJson(),
      'success': instance.success,
    };

_$QrdataImpl _$$QrdataImplFromJson(Map<String, dynamic> json) => _$QrdataImpl(
      branch_id: (json['branch_id'] as num).toInt(),
      branch_name: json['branch_name'] as String,
      branch_code: json['branch_code'] as String,
      qr_token: json['qr_token'] as String,
      payload: json['payload'] as String,
      qr_generated_at: json['qr_generated_at'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      geofence_radius_meters: (json['geofence_radius_meters'] as num).toInt(),
    );

Map<String, dynamic> _$$QrdataImplToJson(_$QrdataImpl instance) =>
    <String, dynamic>{
      'branch_id': instance.branch_id,
      'branch_name': instance.branch_name,
      'branch_code': instance.branch_code,
      'qr_token': instance.qr_token,
      'payload': instance.payload,
      'qr_generated_at': instance.qr_generated_at,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'geofence_radius_meters': instance.geofence_radius_meters,
    };
