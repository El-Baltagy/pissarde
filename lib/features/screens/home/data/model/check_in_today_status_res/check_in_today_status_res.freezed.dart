// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_today_status_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckInTodayStatusRes _$CheckInTodayStatusResFromJson(
    Map<String, dynamic> json) {
  return _CheckInTodayStatusRes.fromJson(json);
}

/// @nodoc
mixin _$CheckInTodayStatusRes {
  String get date => throw _privateConstructorUsedError;
  bool get has_checked_in => throw _privateConstructorUsedError;
  bool get is_open => throw _privateConstructorUsedError;
  dynamic get active_attendance => throw _privateConstructorUsedError;
  Shift get shift => throw _privateConstructorUsedError;
  Branch get branch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckInTodayStatusResCopyWith<CheckInTodayStatusRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInTodayStatusResCopyWith<$Res> {
  factory $CheckInTodayStatusResCopyWith(CheckInTodayStatusRes value,
          $Res Function(CheckInTodayStatusRes) then) =
      _$CheckInTodayStatusResCopyWithImpl<$Res, CheckInTodayStatusRes>;
  @useResult
  $Res call(
      {String date,
      bool has_checked_in,
      bool is_open,
      dynamic active_attendance,
      Shift shift,
      Branch branch});

  $ShiftCopyWith<$Res> get shift;
  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class _$CheckInTodayStatusResCopyWithImpl<$Res,
        $Val extends CheckInTodayStatusRes>
    implements $CheckInTodayStatusResCopyWith<$Res> {
  _$CheckInTodayStatusResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? has_checked_in = null,
    Object? is_open = null,
    Object? active_attendance = freezed,
    Object? shift = null,
    Object? branch = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      has_checked_in: null == has_checked_in
          ? _value.has_checked_in
          : has_checked_in // ignore: cast_nullable_to_non_nullable
              as bool,
      is_open: null == is_open
          ? _value.is_open
          : is_open // ignore: cast_nullable_to_non_nullable
              as bool,
      active_attendance: freezed == active_attendance
          ? _value.active_attendance
          : active_attendance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShiftCopyWith<$Res> get shift {
    return $ShiftCopyWith<$Res>(_value.shift, (value) {
      return _then(_value.copyWith(shift: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res> get branch {
    return $BranchCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckInTodayStatusResImplCopyWith<$Res>
    implements $CheckInTodayStatusResCopyWith<$Res> {
  factory _$$CheckInTodayStatusResImplCopyWith(
          _$CheckInTodayStatusResImpl value,
          $Res Function(_$CheckInTodayStatusResImpl) then) =
      __$$CheckInTodayStatusResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      bool has_checked_in,
      bool is_open,
      dynamic active_attendance,
      Shift shift,
      Branch branch});

  @override
  $ShiftCopyWith<$Res> get shift;
  @override
  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class __$$CheckInTodayStatusResImplCopyWithImpl<$Res>
    extends _$CheckInTodayStatusResCopyWithImpl<$Res,
        _$CheckInTodayStatusResImpl>
    implements _$$CheckInTodayStatusResImplCopyWith<$Res> {
  __$$CheckInTodayStatusResImplCopyWithImpl(_$CheckInTodayStatusResImpl _value,
      $Res Function(_$CheckInTodayStatusResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? has_checked_in = null,
    Object? is_open = null,
    Object? active_attendance = freezed,
    Object? shift = null,
    Object? branch = null,
  }) {
    return _then(_$CheckInTodayStatusResImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      has_checked_in: null == has_checked_in
          ? _value.has_checked_in
          : has_checked_in // ignore: cast_nullable_to_non_nullable
              as bool,
      is_open: null == is_open
          ? _value.is_open
          : is_open // ignore: cast_nullable_to_non_nullable
              as bool,
      active_attendance: freezed == active_attendance
          ? _value.active_attendance
          : active_attendance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CheckInTodayStatusResImpl extends _CheckInTodayStatusRes {
  const _$CheckInTodayStatusResImpl(
      {required this.date,
      required this.has_checked_in,
      required this.is_open,
      required this.active_attendance,
      required this.shift,
      required this.branch})
      : super._();

  factory _$CheckInTodayStatusResImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInTodayStatusResImplFromJson(json);

  @override
  final String date;
  @override
  final bool has_checked_in;
  @override
  final bool is_open;
  @override
  final dynamic active_attendance;
  @override
  final Shift shift;
  @override
  final Branch branch;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInTodayStatusResImplCopyWith<_$CheckInTodayStatusResImpl>
      get copyWith => __$$CheckInTodayStatusResImplCopyWithImpl<
          _$CheckInTodayStatusResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInTodayStatusResImplToJson(
      this,
    );
  }
}

abstract class _CheckInTodayStatusRes extends CheckInTodayStatusRes {
  const factory _CheckInTodayStatusRes(
      {required final String date,
      required final bool has_checked_in,
      required final bool is_open,
      required final dynamic active_attendance,
      required final Shift shift,
      required final Branch branch}) = _$CheckInTodayStatusResImpl;
  const _CheckInTodayStatusRes._() : super._();

  factory _CheckInTodayStatusRes.fromJson(Map<String, dynamic> json) =
      _$CheckInTodayStatusResImpl.fromJson;

  @override
  String get date;
  @override
  bool get has_checked_in;
  @override
  bool get is_open;
  @override
  dynamic get active_attendance;
  @override
  Shift get shift;
  @override
  Branch get branch;
  @override
  @JsonKey(ignore: true)
  _$$CheckInTodayStatusResImplCopyWith<_$CheckInTodayStatusResImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Shift _$ShiftFromJson(Map<String, dynamic> json) {
  return _Shift.fromJson(json);
}

/// @nodoc
mixin _$Shift {
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
  dynamic get deleted_at => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftCopyWith<Shift> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftCopyWith<$Res> {
  factory $ShiftCopyWith(Shift value, $Res Function(Shift) then) =
      _$ShiftCopyWithImpl<$Res, Shift>;
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
      dynamic deleted_at,
      String created_at,
      String updated_at});
}

/// @nodoc
class _$ShiftCopyWithImpl<$Res, $Val extends Shift>
    implements $ShiftCopyWith<$Res> {
  _$ShiftCopyWithImpl(this._value, this._then);

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
    Object? deleted_at = freezed,
    Object? created_at = null,
    Object? updated_at = null,
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
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftImplCopyWith<$Res> implements $ShiftCopyWith<$Res> {
  factory _$$ShiftImplCopyWith(
          _$ShiftImpl value, $Res Function(_$ShiftImpl) then) =
      __$$ShiftImplCopyWithImpl<$Res>;
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
      dynamic deleted_at,
      String created_at,
      String updated_at});
}

/// @nodoc
class __$$ShiftImplCopyWithImpl<$Res>
    extends _$ShiftCopyWithImpl<$Res, _$ShiftImpl>
    implements _$$ShiftImplCopyWith<$Res> {
  __$$ShiftImplCopyWithImpl(
      _$ShiftImpl _value, $Res Function(_$ShiftImpl) _then)
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
    Object? deleted_at = freezed,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(_$ShiftImpl(
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
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShiftImpl extends _Shift {
  const _$ShiftImpl(
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
      required this.deleted_at,
      required this.created_at,
      required this.updated_at})
      : _working_days = working_days,
        super._();

  factory _$ShiftImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftImplFromJson(json);

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
  final dynamic deleted_at;
  @override
  final String created_at;
  @override
  final String updated_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftImplCopyWith<_$ShiftImpl> get copyWith =>
      __$$ShiftImplCopyWithImpl<_$ShiftImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftImplToJson(
      this,
    );
  }
}

abstract class _Shift extends Shift {
  const factory _Shift(
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
      required final dynamic deleted_at,
      required final String created_at,
      required final String updated_at}) = _$ShiftImpl;
  const _Shift._() : super._();

  factory _Shift.fromJson(Map<String, dynamic> json) = _$ShiftImpl.fromJson;

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
  dynamic get deleted_at;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  @JsonKey(ignore: true)
  _$$ShiftImplCopyWith<_$ShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return _Branch.fromJson(json);
}

/// @nodoc
mixin _$Branch {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  int get geofence_radius_meters => throw _privateConstructorUsedError;
  String get qr_secret => throw _privateConstructorUsedError;
  String get qr_token => throw _privateConstructorUsedError;
  String get qr_generated_at => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  dynamic get deleted_at => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchCopyWith<Branch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCopyWith<$Res> {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) then) =
      _$BranchCopyWithImpl<$Res, Branch>;
  @useResult
  $Res call(
      {int id,
      String name,
      String code,
      String address,
      double latitude,
      double longitude,
      int geofence_radius_meters,
      String qr_secret,
      String qr_token,
      String qr_generated_at,
      bool is_active,
      dynamic deleted_at,
      String created_at,
      String updated_at});
}

/// @nodoc
class _$BranchCopyWithImpl<$Res, $Val extends Branch>
    implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._value, this._then);

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
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? geofence_radius_meters = null,
    Object? qr_secret = null,
    Object? qr_token = null,
    Object? qr_generated_at = null,
    Object? is_active = null,
    Object? deleted_at = freezed,
    Object? created_at = null,
    Object? updated_at = null,
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
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      geofence_radius_meters: null == geofence_radius_meters
          ? _value.geofence_radius_meters
          : geofence_radius_meters // ignore: cast_nullable_to_non_nullable
              as int,
      qr_secret: null == qr_secret
          ? _value.qr_secret
          : qr_secret // ignore: cast_nullable_to_non_nullable
              as String,
      qr_token: null == qr_token
          ? _value.qr_token
          : qr_token // ignore: cast_nullable_to_non_nullable
              as String,
      qr_generated_at: null == qr_generated_at
          ? _value.qr_generated_at
          : qr_generated_at // ignore: cast_nullable_to_non_nullable
              as String,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchImplCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$$BranchImplCopyWith(
          _$BranchImpl value, $Res Function(_$BranchImpl) then) =
      __$$BranchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String code,
      String address,
      double latitude,
      double longitude,
      int geofence_radius_meters,
      String qr_secret,
      String qr_token,
      String qr_generated_at,
      bool is_active,
      dynamic deleted_at,
      String created_at,
      String updated_at});
}

/// @nodoc
class __$$BranchImplCopyWithImpl<$Res>
    extends _$BranchCopyWithImpl<$Res, _$BranchImpl>
    implements _$$BranchImplCopyWith<$Res> {
  __$$BranchImplCopyWithImpl(
      _$BranchImpl _value, $Res Function(_$BranchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? geofence_radius_meters = null,
    Object? qr_secret = null,
    Object? qr_token = null,
    Object? qr_generated_at = null,
    Object? is_active = null,
    Object? deleted_at = freezed,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(_$BranchImpl(
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
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      geofence_radius_meters: null == geofence_radius_meters
          ? _value.geofence_radius_meters
          : geofence_radius_meters // ignore: cast_nullable_to_non_nullable
              as int,
      qr_secret: null == qr_secret
          ? _value.qr_secret
          : qr_secret // ignore: cast_nullable_to_non_nullable
              as String,
      qr_token: null == qr_token
          ? _value.qr_token
          : qr_token // ignore: cast_nullable_to_non_nullable
              as String,
      qr_generated_at: null == qr_generated_at
          ? _value.qr_generated_at
          : qr_generated_at // ignore: cast_nullable_to_non_nullable
              as String,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BranchImpl extends _Branch {
  const _$BranchImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.geofence_radius_meters,
      required this.qr_secret,
      required this.qr_token,
      required this.qr_generated_at,
      required this.is_active,
      required this.deleted_at,
      required this.created_at,
      required this.updated_at})
      : super._();

  factory _$BranchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String code;
  @override
  final String address;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int geofence_radius_meters;
  @override
  final String qr_secret;
  @override
  final String qr_token;
  @override
  final String qr_generated_at;
  @override
  final bool is_active;
  @override
  final dynamic deleted_at;
  @override
  final String created_at;
  @override
  final String updated_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      __$$BranchImplCopyWithImpl<_$BranchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchImplToJson(
      this,
    );
  }
}

abstract class _Branch extends Branch {
  const factory _Branch(
      {required final int id,
      required final String name,
      required final String code,
      required final String address,
      required final double latitude,
      required final double longitude,
      required final int geofence_radius_meters,
      required final String qr_secret,
      required final String qr_token,
      required final String qr_generated_at,
      required final bool is_active,
      required final dynamic deleted_at,
      required final String created_at,
      required final String updated_at}) = _$BranchImpl;
  const _Branch._() : super._();

  factory _Branch.fromJson(Map<String, dynamic> json) = _$BranchImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;
  @override
  String get address;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  int get geofence_radius_meters;
  @override
  String get qr_secret;
  @override
  String get qr_token;
  @override
  String get qr_generated_at;
  @override
  bool get is_active;
  @override
  dynamic get deleted_at;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  @JsonKey(ignore: true)
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
