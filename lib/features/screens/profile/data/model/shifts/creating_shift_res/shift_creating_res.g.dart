// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_creating_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftCreatingResImpl _$$ShiftCreatingResImplFromJson(
        Map<String, dynamic> json) =>
    _$ShiftCreatingResImpl(
      message: json['message'] as String,
      shift: ShiftItem.fromJson(json['shift'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ShiftCreatingResImplToJson(
        _$ShiftCreatingResImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'shift': instance.shift.toJson(),
    };
