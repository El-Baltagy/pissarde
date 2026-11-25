// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_attendacne_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryAttendacneResImpl _$$HistoryAttendacneResImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoryAttendacneResImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HistoryAttendacneResImplToJson(
        _$HistoryAttendacneResImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };

_$DataItemImpl _$$DataItemImplFromJson(Map<String, dynamic> json) =>
    _$DataItemImpl(
      id: (json['id'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      branch: Branch.fromJson(json['branch'] as Map<String, dynamic>),
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      date: json['date'] as String,
      check_in_at: json['check_in_at'] as String,
      check_out_at: json['check_out_at'] as String,
      check_in_method: Checkinmethod.fromJson(
          json['check_in_method'] as Map<String, dynamic>),
      check_out_method: Checkoutmethod.fromJson(
          json['check_out_method'] as Map<String, dynamic>),
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      late_minutes: (json['late_minutes'] as num?)?.toInt(),
      early_departure_minutes:
          (json['early_departure_minutes'] as num?)?.toInt(),
      total_work_minutes: (json['total_work_minutes'] as num?)?.toInt(),
      overtime_minutes: (json['overtime_minutes'] as num?)?.toInt(),
      is_open: json['is_open'] as bool?,
      is_working: json['is_working'] as bool?,
      worked_minutes: (json['worked_minutes'] as num?)?.toInt(),
      worked_time: json['worked_time'] as String?,
    );

Map<String, dynamic> _$$DataItemImplToJson(_$DataItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'branch': instance.branch.toJson(),
      'shift': instance.shift.toJson(),
      'date': instance.date,
      'check_in_at': instance.check_in_at,
      'check_out_at': instance.check_out_at,
      'check_in_method': instance.check_in_method.toJson(),
      'check_out_method': instance.check_out_method.toJson(),
      'status': instance.status.toJson(),
      'late_minutes': instance.late_minutes,
      'early_departure_minutes': instance.early_departure_minutes,
      'total_work_minutes': instance.total_work_minutes,
      'overtime_minutes': instance.overtime_minutes,
      'is_open': instance.is_open,
      'is_working': instance.is_working,
      'worked_minutes': instance.worked_minutes,
      'worked_time': instance.worked_time,
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

_$BranchImpl _$$BranchImplFromJson(Map<String, dynamic> json) => _$BranchImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$BranchImplToJson(_$BranchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };

_$ShiftImpl _$$ShiftImplFromJson(Map<String, dynamic> json) => _$ShiftImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
      is_overnight: json['is_overnight'] as bool,
    );

Map<String, dynamic> _$$ShiftImplToJson(_$ShiftImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'is_overnight': instance.is_overnight,
    };

_$CheckinmethodImpl _$$CheckinmethodImplFromJson(Map<String, dynamic> json) =>
    _$CheckinmethodImpl(
      value: json['value'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$CheckinmethodImplToJson(_$CheckinmethodImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

_$CheckoutmethodImpl _$$CheckoutmethodImplFromJson(Map<String, dynamic> json) =>
    _$CheckoutmethodImpl(
      value: json['value'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$CheckoutmethodImplToJson(
        _$CheckoutmethodImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
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

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      current_page: (json['current_page'] as num).toInt(),
      last_page: (json['last_page'] as num).toInt(),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'last_page': instance.last_page,
    };
