// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_leaves_requests_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetMyLeavesRequestsResImpl _$$GetMyLeavesRequestsResImplFromJson(
        Map<String, dynamic> json) =>
    _$GetMyLeavesRequestsResImpl(
      current_page: (json['current_page'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => LeavesRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      last_page: (json['last_page'] as num).toInt(),
      per_page: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$GetMyLeavesRequestsResImplToJson(
        _$GetMyLeavesRequestsResImpl instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'last_page': instance.last_page,
      'per_page': instance.per_page,
      'total': instance.total,
    };

_$LeavesRequestImpl _$$LeavesRequestImplFromJson(Map<String, dynamic> json) =>
    _$LeavesRequestImpl(
      id: (json['id'] as num).toInt(),
      user_id: (json['user_id'] as num).toInt(),
      leave_type_id: (json['leave_type_id'] as num).toInt(),
      start_date: json['start_date'] as String,
      end_date: json['end_date'] as String,
      total_days: (json['total_days'] as num).toInt(),
      reason: json['reason'] as String?,
      emergency_phone: json['emergency_phone'] as String?,
      attachment_path: json['attachment_path'] as String?,
      status: json['status'] as String,
      reviewed_at: json['reviewed_at'] as String?,
      review_notes: json['review_notes'] as String?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      leave_type:
          LeaveTypeItem.fromJson(json['leave_type'] as Map<String, dynamic>),
      reviewed_by: json['reviewed_by'] as String?,
    );

Map<String, dynamic> _$$LeavesRequestImplToJson(_$LeavesRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'leave_type_id': instance.leave_type_id,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'total_days': instance.total_days,
      'reason': instance.reason,
      'emergency_phone': instance.emergency_phone,
      'attachment_path': instance.attachment_path,
      'status': instance.status,
      'reviewed_at': instance.reviewed_at,
      'review_notes': instance.review_notes,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'leave_type': instance.leave_type.toJson(),
      'reviewed_by': instance.reviewed_by,
    };
