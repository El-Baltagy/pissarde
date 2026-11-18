// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pending_approval_leaves_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetPendingApprovalLeavesResImpl _$$GetPendingApprovalLeavesResImplFromJson(
        Map<String, dynamic> json) =>
    _$GetPendingApprovalLeavesResImpl(
      current_page: (json['current_page'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              PendingApprovalLeavesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      last_page: (json['last_page'] as num).toInt(),
    );

Map<String, dynamic> _$$GetPendingApprovalLeavesResImplToJson(
        _$GetPendingApprovalLeavesResImpl instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'last_page': instance.last_page,
    };

_$PendingApprovalLeavesItemImpl _$$PendingApprovalLeavesItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PendingApprovalLeavesItemImpl(
      id: (json['id'] as num).toInt(),
      user_id: (json['user_id'] as num).toInt(),
      leave_type_id: (json['leave_type_id'] as num).toInt(),
      start_date: json['start_date'] as String,
      end_date: json['end_date'] as String,
      total_days: (json['total_days'] as num).toInt(),
      reason: json['reason'] as String,
      emergency_phone: json['emergency_phone'] as String,
      attachment_path: json['attachment_path'],
      status: json['status'] as String,
      target_reviewer_role: json['target_reviewer_role'] as String,
      target_reviewer_id: json['target_reviewer_id'],
      reviewed_by_id: json['reviewed_by_id'],
      reviewed_at: json['reviewed_at'],
      review_notes: json['review_notes'],
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      leave_type:
          LeaveTypeItem.fromJson(json['leave_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PendingApprovalLeavesItemImplToJson(
        _$PendingApprovalLeavesItemImpl instance) =>
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
      'target_reviewer_role': instance.target_reviewer_role,
      'target_reviewer_id': instance.target_reviewer_id,
      'reviewed_by_id': instance.reviewed_by_id,
      'reviewed_at': instance.reviewed_at,
      'review_notes': instance.review_notes,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'user': instance.user.toJson(),
      'leave_type': instance.leave_type.toJson(),
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      employee_code: json['employee_code'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      email_verified_at: json['email_verified_at'],
      role: json['role'] as String,
      employee_type: json['employee_type'] as String,
      work_type: json['work_type'] as String,
      branch_id: (json['branch_id'] as num).toInt(),
      supervisor_id: json['supervisor_id'],
      shift_id: (json['shift_id'] as num).toInt(),
      duty_authorized_branch_ids: json['duty_authorized_branch_ids'],
      is_active: json['is_active'] as bool,
      avatar_url: json['avatar_url'],
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      deleted_at: json['deleted_at'],
      branch: Branch.fromJson(json['branch'] as Map<String, dynamic>),
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employee_code': instance.employee_code,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'email_verified_at': instance.email_verified_at,
      'role': instance.role,
      'employee_type': instance.employee_type,
      'work_type': instance.work_type,
      'branch_id': instance.branch_id,
      'supervisor_id': instance.supervisor_id,
      'shift_id': instance.shift_id,
      'duty_authorized_branch_ids': instance.duty_authorized_branch_ids,
      'is_active': instance.is_active,
      'avatar_url': instance.avatar_url,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
      'branch': instance.branch.toJson(),
      'shift': instance.shift.toJson(),
    };

_$BranchImpl _$$BranchImplFromJson(Map<String, dynamic> json) => _$BranchImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      geofence_radius_meters: (json['geofence_radius_meters'] as num).toInt(),
      qr_secret: json['qr_secret'] as String,
      qr_token: json['qr_token'] as String,
      qr_generated_at: json['qr_generated_at'] as String,
      is_active: json['is_active'] as bool,
      deleted_at: json['deleted_at'],
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
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
      'qr_secret': instance.qr_secret,
      'qr_token': instance.qr_token,
      'qr_generated_at': instance.qr_generated_at,
      'is_active': instance.is_active,
      'deleted_at': instance.deleted_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

_$ShiftImpl _$$ShiftImplFromJson(Map<String, dynamic> json) => _$ShiftImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
      is_overnight: json['is_overnight'] as bool,
      grace_period_minutes: (json['grace_period_minutes'] as num).toInt(),
      checkin_window_start_minutes:
          (json['checkin_window_start_minutes'] as num).toInt(),
      checkin_window_end_minutes:
          (json['checkin_window_end_minutes'] as num).toInt(),
      break_duration_minutes: (json['break_duration_minutes'] as num).toInt(),
      working_days: (json['working_days'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      is_active: json['is_active'] as bool,
      deleted_at: json['deleted_at'],
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$ShiftImplToJson(_$ShiftImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'is_overnight': instance.is_overnight,
      'grace_period_minutes': instance.grace_period_minutes,
      'checkin_window_start_minutes': instance.checkin_window_start_minutes,
      'checkin_window_end_minutes': instance.checkin_window_end_minutes,
      'break_duration_minutes': instance.break_duration_minutes,
      'working_days': instance.working_days,
      'is_active': instance.is_active,
      'deleted_at': instance.deleted_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
