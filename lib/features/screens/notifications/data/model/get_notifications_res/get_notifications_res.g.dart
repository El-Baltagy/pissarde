// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notifications_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetNotificationsResImpl _$$GetNotificationsResImplFromJson(
        Map<String, dynamic> json) =>
    _$GetNotificationsResImpl(
      notifications:
          Notifications.fromJson(json['notifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetNotificationsResImplToJson(
        _$GetNotificationsResImpl instance) =>
    <String, dynamic>{
      'notifications': instance.notifications.toJson(),
    };

_$NotificationsImpl _$$NotificationsImplFromJson(Map<String, dynamic> json) =>
    _$NotificationsImpl(
      current_page: (json['current_page'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => NotificationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      last_page: (json['last_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$NotificationsImplToJson(_$NotificationsImpl instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'last_page': instance.last_page,
      'total': instance.total,
    };

_$NotificationItemImpl _$$NotificationItemImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationItemImpl(
      id: json['id'] as String,
      notifiable_id: (json['notifiable_id'] as num).toInt(),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$NotificationItemImplToJson(
        _$NotificationItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notifiable_id': instance.notifiable_id,
      'data': instance.data.toJson(),
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      title: json['title'] as String,
      body: json['body'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'data': instance.data,
    };
