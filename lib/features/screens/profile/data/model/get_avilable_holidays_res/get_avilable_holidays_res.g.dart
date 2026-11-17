// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_avilable_holidays_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAvilableHolidaysResImpl _$$GetAvilableHolidaysResImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAvilableHolidaysResImpl(
      status: json['status'] as String,
      holidays: (json['holidays'] as List<dynamic>)
          .map((e) => HolidayItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetAvilableHolidaysResImplToJson(
        _$GetAvilableHolidaysResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'holidays': instance.holidays.map((e) => e.toJson()).toList(),
    };

_$HolidayItemImpl _$$HolidayItemImplFromJson(Map<String, dynamic> json) =>
    _$HolidayItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      start_date: json['start_date'] as String,
      end_date: json['end_date'] as String,
      type: json['type'] as String,
      is_company_wide: json['is_company_wide'] as bool,
      branch_id: json['branch_id'],
      branch_name: json['branch_name'] as String,
      is_recurring: json['is_recurring'] as bool,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$HolidayItemImplToJson(_$HolidayItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'type': instance.type,
      'is_company_wide': instance.is_company_wide,
      'branch_id': instance.branch_id,
      'branch_name': instance.branch_name,
      'is_recurring': instance.is_recurring,
      'description': instance.description,
    };
