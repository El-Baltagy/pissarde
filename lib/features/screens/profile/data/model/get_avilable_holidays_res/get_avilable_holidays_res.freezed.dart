// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_avilable_holidays_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAvilableHolidaysRes _$GetAvilableHolidaysResFromJson(
    Map<String, dynamic> json) {
  return _GetAvilableHolidaysRes.fromJson(json);
}

/// @nodoc
mixin _$GetAvilableHolidaysRes {
  String get status => throw _privateConstructorUsedError;
  List<HolidayItem> get holidays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetAvilableHolidaysResCopyWith<GetAvilableHolidaysRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAvilableHolidaysResCopyWith<$Res> {
  factory $GetAvilableHolidaysResCopyWith(GetAvilableHolidaysRes value,
          $Res Function(GetAvilableHolidaysRes) then) =
      _$GetAvilableHolidaysResCopyWithImpl<$Res, GetAvilableHolidaysRes>;
  @useResult
  $Res call({String status, List<HolidayItem> holidays});
}

/// @nodoc
class _$GetAvilableHolidaysResCopyWithImpl<$Res,
        $Val extends GetAvilableHolidaysRes>
    implements $GetAvilableHolidaysResCopyWith<$Res> {
  _$GetAvilableHolidaysResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? holidays = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      holidays: null == holidays
          ? _value.holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as List<HolidayItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAvilableHolidaysResImplCopyWith<$Res>
    implements $GetAvilableHolidaysResCopyWith<$Res> {
  factory _$$GetAvilableHolidaysResImplCopyWith(
          _$GetAvilableHolidaysResImpl value,
          $Res Function(_$GetAvilableHolidaysResImpl) then) =
      __$$GetAvilableHolidaysResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, List<HolidayItem> holidays});
}

/// @nodoc
class __$$GetAvilableHolidaysResImplCopyWithImpl<$Res>
    extends _$GetAvilableHolidaysResCopyWithImpl<$Res,
        _$GetAvilableHolidaysResImpl>
    implements _$$GetAvilableHolidaysResImplCopyWith<$Res> {
  __$$GetAvilableHolidaysResImplCopyWithImpl(
      _$GetAvilableHolidaysResImpl _value,
      $Res Function(_$GetAvilableHolidaysResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? holidays = null,
  }) {
    return _then(_$GetAvilableHolidaysResImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      holidays: null == holidays
          ? _value._holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as List<HolidayItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GetAvilableHolidaysResImpl extends _GetAvilableHolidaysRes {
  const _$GetAvilableHolidaysResImpl(
      {required this.status, required final List<HolidayItem> holidays})
      : _holidays = holidays,
        super._();

  factory _$GetAvilableHolidaysResImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAvilableHolidaysResImplFromJson(json);

  @override
  final String status;
  final List<HolidayItem> _holidays;
  @override
  List<HolidayItem> get holidays {
    if (_holidays is EqualUnmodifiableListView) return _holidays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_holidays);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAvilableHolidaysResImplCopyWith<_$GetAvilableHolidaysResImpl>
      get copyWith => __$$GetAvilableHolidaysResImplCopyWithImpl<
          _$GetAvilableHolidaysResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAvilableHolidaysResImplToJson(
      this,
    );
  }
}

abstract class _GetAvilableHolidaysRes extends GetAvilableHolidaysRes {
  const factory _GetAvilableHolidaysRes(
          {required final String status,
          required final List<HolidayItem> holidays}) =
      _$GetAvilableHolidaysResImpl;
  const _GetAvilableHolidaysRes._() : super._();

  factory _GetAvilableHolidaysRes.fromJson(Map<String, dynamic> json) =
      _$GetAvilableHolidaysResImpl.fromJson;

  @override
  String get status;
  @override
  List<HolidayItem> get holidays;
  @override
  @JsonKey(ignore: true)
  _$$GetAvilableHolidaysResImplCopyWith<_$GetAvilableHolidaysResImpl>
      get copyWith => throw _privateConstructorUsedError;
}

HolidayItem _$HolidayItemFromJson(Map<String, dynamic> json) {
  return _HolidayItem.fromJson(json);
}

/// @nodoc
mixin _$HolidayItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get start_date => throw _privateConstructorUsedError;
  String get end_date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get is_company_wide => throw _privateConstructorUsedError;
  dynamic get branch_id => throw _privateConstructorUsedError;
  String get branch_name => throw _privateConstructorUsedError;
  bool get is_recurring => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HolidayItemCopyWith<HolidayItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayItemCopyWith<$Res> {
  factory $HolidayItemCopyWith(
          HolidayItem value, $Res Function(HolidayItem) then) =
      _$HolidayItemCopyWithImpl<$Res, HolidayItem>;
  @useResult
  $Res call(
      {int id,
      String name,
      String start_date,
      String end_date,
      String type,
      bool is_company_wide,
      dynamic branch_id,
      String branch_name,
      bool is_recurring,
      String description});
}

/// @nodoc
class _$HolidayItemCopyWithImpl<$Res, $Val extends HolidayItem>
    implements $HolidayItemCopyWith<$Res> {
  _$HolidayItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? start_date = null,
    Object? end_date = null,
    Object? type = null,
    Object? is_company_wide = null,
    Object? branch_id = freezed,
    Object? branch_name = null,
    Object? is_recurring = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      is_company_wide: null == is_company_wide
          ? _value.is_company_wide
          : is_company_wide // ignore: cast_nullable_to_non_nullable
              as bool,
      branch_id: freezed == branch_id
          ? _value.branch_id
          : branch_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      branch_name: null == branch_name
          ? _value.branch_name
          : branch_name // ignore: cast_nullable_to_non_nullable
              as String,
      is_recurring: null == is_recurring
          ? _value.is_recurring
          : is_recurring // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HolidayItemImplCopyWith<$Res>
    implements $HolidayItemCopyWith<$Res> {
  factory _$$HolidayItemImplCopyWith(
          _$HolidayItemImpl value, $Res Function(_$HolidayItemImpl) then) =
      __$$HolidayItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String start_date,
      String end_date,
      String type,
      bool is_company_wide,
      dynamic branch_id,
      String branch_name,
      bool is_recurring,
      String description});
}

/// @nodoc
class __$$HolidayItemImplCopyWithImpl<$Res>
    extends _$HolidayItemCopyWithImpl<$Res, _$HolidayItemImpl>
    implements _$$HolidayItemImplCopyWith<$Res> {
  __$$HolidayItemImplCopyWithImpl(
      _$HolidayItemImpl _value, $Res Function(_$HolidayItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? start_date = null,
    Object? end_date = null,
    Object? type = null,
    Object? is_company_wide = null,
    Object? branch_id = freezed,
    Object? branch_name = null,
    Object? is_recurring = null,
    Object? description = null,
  }) {
    return _then(_$HolidayItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      is_company_wide: null == is_company_wide
          ? _value.is_company_wide
          : is_company_wide // ignore: cast_nullable_to_non_nullable
              as bool,
      branch_id: freezed == branch_id
          ? _value.branch_id
          : branch_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      branch_name: null == branch_name
          ? _value.branch_name
          : branch_name // ignore: cast_nullable_to_non_nullable
              as String,
      is_recurring: null == is_recurring
          ? _value.is_recurring
          : is_recurring // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$HolidayItemImpl extends _HolidayItem {
  const _$HolidayItemImpl(
      {required this.id,
      required this.name,
      required this.start_date,
      required this.end_date,
      required this.type,
      required this.is_company_wide,
      required this.branch_id,
      required this.branch_name,
      required this.is_recurring,
      required this.description})
      : super._();

  factory _$HolidayItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$HolidayItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String start_date;
  @override
  final String end_date;
  @override
  final String type;
  @override
  final bool is_company_wide;
  @override
  final dynamic branch_id;
  @override
  final String branch_name;
  @override
  final bool is_recurring;
  @override
  final String description;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HolidayItemImplCopyWith<_$HolidayItemImpl> get copyWith =>
      __$$HolidayItemImplCopyWithImpl<_$HolidayItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HolidayItemImplToJson(
      this,
    );
  }
}

abstract class _HolidayItem extends HolidayItem {
  const factory _HolidayItem(
      {required final int id,
      required final String name,
      required final String start_date,
      required final String end_date,
      required final String type,
      required final bool is_company_wide,
      required final dynamic branch_id,
      required final String branch_name,
      required final bool is_recurring,
      required final String description}) = _$HolidayItemImpl;
  const _HolidayItem._() : super._();

  factory _HolidayItem.fromJson(Map<String, dynamic> json) =
      _$HolidayItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get start_date;
  @override
  String get end_date;
  @override
  String get type;
  @override
  bool get is_company_wide;
  @override
  dynamic get branch_id;
  @override
  String get branch_name;
  @override
  bool get is_recurring;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$HolidayItemImplCopyWith<_$HolidayItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
