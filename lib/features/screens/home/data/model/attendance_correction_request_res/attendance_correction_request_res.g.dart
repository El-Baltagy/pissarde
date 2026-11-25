// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_correction_request_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceCorrectionRequestResImpl
    _$$AttendanceCorrectionRequestResImplFromJson(Map<String, dynamic> json) =>
        _$AttendanceCorrectionRequestResImpl(
          message: json['message'] as String,
          correction:
              Correction.fromJson(json['correction'] as Map<String, dynamic>),
          success: json['success'] as bool,
        );

Map<String, dynamic> _$$AttendanceCorrectionRequestResImplToJson(
        _$AttendanceCorrectionRequestResImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'correction': instance.correction.toJson(),
      'success': instance.success,
    };

_$CorrectionImpl _$$CorrectionImplFromJson(Map<String, dynamic> json) =>
    _$CorrectionImpl(
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

Map<String, dynamic> _$$CorrectionImplToJson(_$CorrectionImpl instance) =>
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
