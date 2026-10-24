// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResImpl _$$LoginResImplFromJson(Map<String, dynamic> json) =>
    _$LoginResImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResImplToJson(_$LoginResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      token: json['token'] as String,
      user: User.fromJson(json['user']),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String?,
      dob: json['dob'] as String,
      phone: json['phone'] as String?,
      specialization: json['specialization'] as String?,
      role: json['role'] as String,
      avatar: json['avatar'] as String?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'dob': instance.dob,
      'phone': instance.phone,
      'specialization': instance.specialization,
      'role': instance.role,
      'avatar': instance.avatar,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
