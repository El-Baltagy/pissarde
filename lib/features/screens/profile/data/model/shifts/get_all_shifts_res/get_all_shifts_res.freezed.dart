// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_shifts_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAllShiftsRes _$GetAllShiftsResFromJson(Map<String, dynamic> json) {
  return _GetAllShiftsRes.fromJson(json);
}

/// @nodoc
mixin _$GetAllShiftsRes {
  List<ShiftItem> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetAllShiftsResCopyWith<GetAllShiftsRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllShiftsResCopyWith<$Res> {
  factory $GetAllShiftsResCopyWith(
          GetAllShiftsRes value, $Res Function(GetAllShiftsRes) then) =
      _$GetAllShiftsResCopyWithImpl<$Res, GetAllShiftsRes>;
  @useResult
  $Res call({List<ShiftItem> data});
}

/// @nodoc
class _$GetAllShiftsResCopyWithImpl<$Res, $Val extends GetAllShiftsRes>
    implements $GetAllShiftsResCopyWith<$Res> {
  _$GetAllShiftsResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ShiftItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAllShiftsResImplCopyWith<$Res>
    implements $GetAllShiftsResCopyWith<$Res> {
  factory _$$GetAllShiftsResImplCopyWith(_$GetAllShiftsResImpl value,
          $Res Function(_$GetAllShiftsResImpl) then) =
      __$$GetAllShiftsResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ShiftItem> data});
}

/// @nodoc
class __$$GetAllShiftsResImplCopyWithImpl<$Res>
    extends _$GetAllShiftsResCopyWithImpl<$Res, _$GetAllShiftsResImpl>
    implements _$$GetAllShiftsResImplCopyWith<$Res> {
  __$$GetAllShiftsResImplCopyWithImpl(
      _$GetAllShiftsResImpl _value, $Res Function(_$GetAllShiftsResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GetAllShiftsResImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ShiftItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GetAllShiftsResImpl extends _GetAllShiftsRes {
  const _$GetAllShiftsResImpl({required final List<ShiftItem> data})
      : _data = data,
        super._();

  factory _$GetAllShiftsResImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAllShiftsResImplFromJson(json);

  final List<ShiftItem> _data;
  @override
  List<ShiftItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllShiftsResImplCopyWith<_$GetAllShiftsResImpl> get copyWith =>
      __$$GetAllShiftsResImplCopyWithImpl<_$GetAllShiftsResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllShiftsResImplToJson(
      this,
    );
  }
}

abstract class _GetAllShiftsRes extends GetAllShiftsRes {
  const factory _GetAllShiftsRes({required final List<ShiftItem> data}) =
      _$GetAllShiftsResImpl;
  const _GetAllShiftsRes._() : super._();

  factory _GetAllShiftsRes.fromJson(Map<String, dynamic> json) =
      _$GetAllShiftsResImpl.fromJson;

  @override
  List<ShiftItem> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetAllShiftsResImplCopyWith<_$GetAllShiftsResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShiftItem _$ShiftItemFromJson(Map<String, dynamic> json) {
  return _ShiftItem.fromJson(json);
}

/// @nodoc
mixin _$ShiftItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get start_time => throw _privateConstructorUsedError;
  String get end_time => throw _privateConstructorUsedError;
  bool get is_overnight => throw _privateConstructorUsedError;
  int get grace_period_minutes => throw _privateConstructorUsedError;
  int get checkin_window_start_minutes => throw _privateConstructorUsedError;
  int get checkin_window_end_minutes => throw _privateConstructorUsedError;
  int get break_duration_minutes => throw _privateConstructorUsedError;
  List<int> get working_days => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  int? get employees_count => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftItemCopyWith<ShiftItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftItemCopyWith<$Res> {
  factory $ShiftItemCopyWith(ShiftItem value, $Res Function(ShiftItem) then) =
      _$ShiftItemCopyWithImpl<$Res, ShiftItem>;
  @useResult
  $Res call(
      {int id,
      String name,
      String code,
      String start_time,
      String end_time,
      bool is_overnight,
      int grace_period_minutes,
      int checkin_window_start_minutes,
      int checkin_window_end_minutes,
      int break_duration_minutes,
      List<int> working_days,
      bool is_active,
      int? employees_count,
      String created_at});
}

/// @nodoc
class _$ShiftItemCopyWithImpl<$Res, $Val extends ShiftItem>
    implements $ShiftItemCopyWith<$Res> {
  _$ShiftItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? start_time = null,
    Object? end_time = null,
    Object? is_overnight = null,
    Object? grace_period_minutes = null,
    Object? checkin_window_start_minutes = null,
    Object? checkin_window_end_minutes = null,
    Object? break_duration_minutes = null,
    Object? working_days = null,
    Object? is_active = null,
    Object? employees_count = freezed,
    Object? created_at = null,
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      start_time: null == start_time
          ? _value.start_time
          : start_time // ignore: cast_nullable_to_non_nullable
              as String,
      end_time: null == end_time
          ? _value.end_time
          : end_time // ignore: cast_nullable_to_non_nullable
              as String,
      is_overnight: null == is_overnight
          ? _value.is_overnight
          : is_overnight // ignore: cast_nullable_to_non_nullable
              as bool,
      grace_period_minutes: null == grace_period_minutes
          ? _value.grace_period_minutes
          : grace_period_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      checkin_window_start_minutes: null == checkin_window_start_minutes
          ? _value.checkin_window_start_minutes
          : checkin_window_start_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      checkin_window_end_minutes: null == checkin_window_end_minutes
          ? _value.checkin_window_end_minutes
          : checkin_window_end_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      break_duration_minutes: null == break_duration_minutes
          ? _value.break_duration_minutes
          : break_duration_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      working_days: null == working_days
          ? _value.working_days
          : working_days // ignore: cast_nullable_to_non_nullable
              as List<int>,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      employees_count: freezed == employees_count
          ? _value.employees_count
          : employees_count // ignore: cast_nullable_to_non_nullable
              as int?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftItemImplCopyWith<$Res>
    implements $ShiftItemCopyWith<$Res> {
  factory _$$ShiftItemImplCopyWith(
          _$ShiftItemImpl value, $Res Function(_$ShiftItemImpl) then) =
      __$$ShiftItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String code,
      String start_time,
      String end_time,
      bool is_overnight,
      int grace_period_minutes,
      int checkin_window_start_minutes,
      int checkin_window_end_minutes,
      int break_duration_minutes,
      List<int> working_days,
      bool is_active,
      int? employees_count,
      String created_at});
}

/// @nodoc
class __$$ShiftItemImplCopyWithImpl<$Res>
    extends _$ShiftItemCopyWithImpl<$Res, _$ShiftItemImpl>
    implements _$$ShiftItemImplCopyWith<$Res> {
  __$$ShiftItemImplCopyWithImpl(
      _$ShiftItemImpl _value, $Res Function(_$ShiftItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? start_time = null,
    Object? end_time = null,
    Object? is_overnight = null,
    Object? grace_period_minutes = null,
    Object? checkin_window_start_minutes = null,
    Object? checkin_window_end_minutes = null,
    Object? break_duration_minutes = null,
    Object? working_days = null,
    Object? is_active = null,
    Object? employees_count = freezed,
    Object? created_at = null,
  }) {
    return _then(_$ShiftItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      start_time: null == start_time
          ? _value.start_time
          : start_time // ignore: cast_nullable_to_non_nullable
              as String,
      end_time: null == end_time
          ? _value.end_time
          : end_time // ignore: cast_nullable_to_non_nullable
              as String,
      is_overnight: null == is_overnight
          ? _value.is_overnight
          : is_overnight // ignore: cast_nullable_to_non_nullable
              as bool,
      grace_period_minutes: null == grace_period_minutes
          ? _value.grace_period_minutes
          : grace_period_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      checkin_window_start_minutes: null == checkin_window_start_minutes
          ? _value.checkin_window_start_minutes
          : checkin_window_start_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      checkin_window_end_minutes: null == checkin_window_end_minutes
          ? _value.checkin_window_end_minutes
          : checkin_window_end_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      break_duration_minutes: null == break_duration_minutes
          ? _value.break_duration_minutes
          : break_duration_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      working_days: null == working_days
          ? _value._working_days
          : working_days // ignore: cast_nullable_to_non_nullable
              as List<int>,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      employees_count: freezed == employees_count
          ? _value.employees_count
          : employees_count // ignore: cast_nullable_to_non_nullable
              as int?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShiftItemImpl extends _ShiftItem {
  const _$ShiftItemImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.start_time,
      required this.end_time,
      required this.is_overnight,
      required this.grace_period_minutes,
      required this.checkin_window_start_minutes,
      required this.checkin_window_end_minutes,
      required this.break_duration_minutes,
      required final List<int> working_days,
      required this.is_active,
      required this.employees_count,
      required this.created_at})
      : _working_days = working_days,
        super._();

  factory _$ShiftItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String code;
  @override
  final String start_time;
  @override
  final String end_time;
  @override
  final bool is_overnight;
  @override
  final int grace_period_minutes;
  @override
  final int checkin_window_start_minutes;
  @override
  final int checkin_window_end_minutes;
  @override
  final int break_duration_minutes;
  final List<int> _working_days;
  @override
  List<int> get working_days {
    if (_working_days is EqualUnmodifiableListView) return _working_days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_working_days);
  }

  @override
  final bool is_active;
  @override
  final int? employees_count;
  @override
  final String created_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftItemImplCopyWith<_$ShiftItemImpl> get copyWith =>
      __$$ShiftItemImplCopyWithImpl<_$ShiftItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftItemImplToJson(
      this,
    );
  }
}

abstract class _ShiftItem extends ShiftItem {
  const factory _ShiftItem(
      {required final int id,
      required final String name,
      required final String code,
      required final String start_time,
      required final String end_time,
      required final bool is_overnight,
      required final int grace_period_minutes,
      required final int checkin_window_start_minutes,
      required final int checkin_window_end_minutes,
      required final int break_duration_minutes,
      required final List<int> working_days,
      required final bool is_active,
      required final int? employees_count,
      required final String created_at}) = _$ShiftItemImpl;
  const _ShiftItem._() : super._();

  factory _ShiftItem.fromJson(Map<String, dynamic> json) =
      _$ShiftItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;
  @override
  String get start_time;
  @override
  String get end_time;
  @override
  bool get is_overnight;
  @override
  int get grace_period_minutes;
  @override
  int get checkin_window_start_minutes;
  @override
  int get checkin_window_end_minutes;
  @override
  int get break_duration_minutes;
  @override
  List<int> get working_days;
  @override
  bool get is_active;
  @override
  int? get employees_count;
  @override
  String get created_at;
  @override
  @JsonKey(ignore: true)
  _$$ShiftItemImplCopyWith<_$ShiftItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
