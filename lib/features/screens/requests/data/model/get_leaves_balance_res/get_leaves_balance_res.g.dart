// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_leaves_balance_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetLeavesBalanceResImpl _$$GetLeavesBalanceResImplFromJson(
        Map<String, dynamic> json) =>
    _$GetLeavesBalanceResImpl(
      year: (json['year'] as num).toInt(),
      balances: (json['balances'] as List<dynamic>)
          .map((e) => BalanceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetLeavesBalanceResImplToJson(
        _$GetLeavesBalanceResImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'balances': instance.balances.map((e) => e.toJson()).toList(),
    };

_$BalanceItemImpl _$$BalanceItemImplFromJson(Map<String, dynamic> json) =>
    _$BalanceItemImpl(
      id: (json['id'] as num).toInt(),
      user_id: (json['user_id'] as num).toInt(),
      leave_type_id: (json['leave_type_id'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      allocated_days: (json['allocated_days'] as num).toInt(),
      used_days: (json['used_days'] as num).toInt(),
      pending_days: (json['pending_days'] as num).toInt(),
      remaining_days: (json['remaining_days'] as num).toInt(),
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      leave_type:
          LeaveTypeItem.fromJson(json['leave_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BalanceItemImplToJson(_$BalanceItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'leave_type_id': instance.leave_type_id,
      'year': instance.year,
      'allocated_days': instance.allocated_days,
      'used_days': instance.used_days,
      'pending_days': instance.pending_days,
      'remaining_days': instance.remaining_days,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'leave_type': instance.leave_type.toJson(),
    };
