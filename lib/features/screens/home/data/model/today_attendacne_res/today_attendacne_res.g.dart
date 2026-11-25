// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_attendacne_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodayAttendacneResImpl _$$TodayAttendacneResImplFromJson(
        Map<String, dynamic> json) =>
    _$TodayAttendacneResImpl(
      date: json['date'] as String,
      has_checked_in: json['has_checked_in'] as bool,
      is_open: json['is_open'] as bool,
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      branch: Branch.fromJson(json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TodayAttendacneResImplToJson(
        _$TodayAttendacneResImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'has_checked_in': instance.has_checked_in,
      'is_open': instance.is_open,
      'shift': instance.shift.toJson(),
      'branch': instance.branch.toJson(),
    };
