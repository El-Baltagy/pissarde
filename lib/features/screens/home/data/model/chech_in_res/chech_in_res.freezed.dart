// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chech_in_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChechInRes _$ChechInResFromJson(Map<String, dynamic> json) {
  return _ChechInRes.fromJson(json);
}

/// @nodoc
mixin _$ChechInRes {
  String get message => throw _privateConstructorUsedError;
  Attendance get attendance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChechInResCopyWith<ChechInRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChechInResCopyWith<$Res> {
  factory $ChechInResCopyWith(
          ChechInRes value, $Res Function(ChechInRes) then) =
      _$ChechInResCopyWithImpl<$Res, ChechInRes>;
  @useResult
  $Res call({String message, Attendance attendance});

  $AttendanceCopyWith<$Res> get attendance;
}

/// @nodoc
class _$ChechInResCopyWithImpl<$Res, $Val extends ChechInRes>
    implements $ChechInResCopyWith<$Res> {
  _$ChechInResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? attendance = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      attendance: null == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as Attendance,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AttendanceCopyWith<$Res> get attendance {
    return $AttendanceCopyWith<$Res>(_value.attendance, (value) {
      return _then(_value.copyWith(attendance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChechInResImplCopyWith<$Res>
    implements $ChechInResCopyWith<$Res> {
  factory _$$ChechInResImplCopyWith(
          _$ChechInResImpl value, $Res Function(_$ChechInResImpl) then) =
      __$$ChechInResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Attendance attendance});

  @override
  $AttendanceCopyWith<$Res> get attendance;
}

/// @nodoc
class __$$ChechInResImplCopyWithImpl<$Res>
    extends _$ChechInResCopyWithImpl<$Res, _$ChechInResImpl>
    implements _$$ChechInResImplCopyWith<$Res> {
  __$$ChechInResImplCopyWithImpl(
      _$ChechInResImpl _value, $Res Function(_$ChechInResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? attendance = null,
  }) {
    return _then(_$ChechInResImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      attendance: null == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as Attendance,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ChechInResImpl extends _ChechInRes {
  const _$ChechInResImpl({required this.message, required this.attendance})
      : super._();

  factory _$ChechInResImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChechInResImplFromJson(json);

  @override
  final String message;
  @override
  final Attendance attendance;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChechInResImplCopyWith<_$ChechInResImpl> get copyWith =>
      __$$ChechInResImplCopyWithImpl<_$ChechInResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChechInResImplToJson(
      this,
    );
  }
}

abstract class _ChechInRes extends ChechInRes {
  const factory _ChechInRes(
      {required final String message,
      required final Attendance attendance}) = _$ChechInResImpl;
  const _ChechInRes._() : super._();

  factory _ChechInRes.fromJson(Map<String, dynamic> json) =
      _$ChechInResImpl.fromJson;

  @override
  String get message;
  @override
  Attendance get attendance;
  @override
  @JsonKey(ignore: true)
  _$$ChechInResImplCopyWith<_$ChechInResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return _Attendance.fromJson(json);
}

/// @nodoc
mixin _$Attendance {
  int get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  Branch get branch => throw _privateConstructorUsedError;
  Shift get shift => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get check_in_at => throw _privateConstructorUsedError;
  String get check_out_at => throw _privateConstructorUsedError;
  Checkinmethod get check_in_method => throw _privateConstructorUsedError;
  Checkoutmethod get check_out_method => throw _privateConstructorUsedError;
  dynamic get recorded_by => throw _privateConstructorUsedError;
  dynamic get duty_reason => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  int get late_minutes => throw _privateConstructorUsedError;
  int get early_departure_minutes => throw _privateConstructorUsedError;
  int get total_work_minutes => throw _privateConstructorUsedError;
  int get overtime_minutes => throw _privateConstructorUsedError;
  bool get is_open => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res, Attendance>;
  @useResult
  $Res call(
      {int id,
      User user,
      Branch branch,
      Shift shift,
      String date,
      String check_in_at,
      String check_out_at,
      Checkinmethod check_in_method,
      Checkoutmethod check_out_method,
      dynamic recorded_by,
      dynamic duty_reason,
      Status status,
      int late_minutes,
      int early_departure_minutes,
      int total_work_minutes,
      int overtime_minutes,
      bool is_open});

  $UserCopyWith<$Res> get user;
  $BranchCopyWith<$Res> get branch;
  $ShiftCopyWith<$Res> get shift;
  $CheckinmethodCopyWith<$Res> get check_in_method;
  $CheckoutmethodCopyWith<$Res> get check_out_method;
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res, $Val extends Attendance>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? branch = null,
    Object? shift = null,
    Object? date = null,
    Object? check_in_at = null,
    Object? check_out_at = null,
    Object? check_in_method = null,
    Object? check_out_method = null,
    Object? recorded_by = freezed,
    Object? duty_reason = freezed,
    Object? status = null,
    Object? late_minutes = null,
    Object? early_departure_minutes = null,
    Object? total_work_minutes = null,
    Object? overtime_minutes = null,
    Object? is_open = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      check_in_at: null == check_in_at
          ? _value.check_in_at
          : check_in_at // ignore: cast_nullable_to_non_nullable
              as String,
      check_out_at: null == check_out_at
          ? _value.check_out_at
          : check_out_at // ignore: cast_nullable_to_non_nullable
              as String,
      check_in_method: null == check_in_method
          ? _value.check_in_method
          : check_in_method // ignore: cast_nullable_to_non_nullable
              as Checkinmethod,
      check_out_method: null == check_out_method
          ? _value.check_out_method
          : check_out_method // ignore: cast_nullable_to_non_nullable
              as Checkoutmethod,
      recorded_by: freezed == recorded_by
          ? _value.recorded_by
          : recorded_by // ignore: cast_nullable_to_non_nullable
              as dynamic,
      duty_reason: freezed == duty_reason
          ? _value.duty_reason
          : duty_reason // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      late_minutes: null == late_minutes
          ? _value.late_minutes
          : late_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      early_departure_minutes: null == early_departure_minutes
          ? _value.early_departure_minutes
          : early_departure_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      total_work_minutes: null == total_work_minutes
          ? _value.total_work_minutes
          : total_work_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      overtime_minutes: null == overtime_minutes
          ? _value.overtime_minutes
          : overtime_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      is_open: null == is_open
          ? _value.is_open
          : is_open // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res> get branch {
    return $BranchCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
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
  $CheckinmethodCopyWith<$Res> get check_in_method {
    return $CheckinmethodCopyWith<$Res>(_value.check_in_method, (value) {
      return _then(_value.copyWith(check_in_method: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CheckoutmethodCopyWith<$Res> get check_out_method {
    return $CheckoutmethodCopyWith<$Res>(_value.check_out_method, (value) {
      return _then(_value.copyWith(check_out_method: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendanceImplCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$$AttendanceImplCopyWith(
          _$AttendanceImpl value, $Res Function(_$AttendanceImpl) then) =
      __$$AttendanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      User user,
      Branch branch,
      Shift shift,
      String date,
      String check_in_at,
      String check_out_at,
      Checkinmethod check_in_method,
      Checkoutmethod check_out_method,
      dynamic recorded_by,
      dynamic duty_reason,
      Status status,
      int late_minutes,
      int early_departure_minutes,
      int total_work_minutes,
      int overtime_minutes,
      bool is_open});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $BranchCopyWith<$Res> get branch;
  @override
  $ShiftCopyWith<$Res> get shift;
  @override
  $CheckinmethodCopyWith<$Res> get check_in_method;
  @override
  $CheckoutmethodCopyWith<$Res> get check_out_method;
  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$AttendanceImplCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$AttendanceImpl>
    implements _$$AttendanceImplCopyWith<$Res> {
  __$$AttendanceImplCopyWithImpl(
      _$AttendanceImpl _value, $Res Function(_$AttendanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? branch = null,
    Object? shift = null,
    Object? date = null,
    Object? check_in_at = null,
    Object? check_out_at = null,
    Object? check_in_method = null,
    Object? check_out_method = null,
    Object? recorded_by = freezed,
    Object? duty_reason = freezed,
    Object? status = null,
    Object? late_minutes = null,
    Object? early_departure_minutes = null,
    Object? total_work_minutes = null,
    Object? overtime_minutes = null,
    Object? is_open = null,
  }) {
    return _then(_$AttendanceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      check_in_at: null == check_in_at
          ? _value.check_in_at
          : check_in_at // ignore: cast_nullable_to_non_nullable
              as String,
      check_out_at: null == check_out_at
          ? _value.check_out_at
          : check_out_at // ignore: cast_nullable_to_non_nullable
              as String,
      check_in_method: null == check_in_method
          ? _value.check_in_method
          : check_in_method // ignore: cast_nullable_to_non_nullable
              as Checkinmethod,
      check_out_method: null == check_out_method
          ? _value.check_out_method
          : check_out_method // ignore: cast_nullable_to_non_nullable
              as Checkoutmethod,
      recorded_by: freezed == recorded_by
          ? _value.recorded_by
          : recorded_by // ignore: cast_nullable_to_non_nullable
              as dynamic,
      duty_reason: freezed == duty_reason
          ? _value.duty_reason
          : duty_reason // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      late_minutes: null == late_minutes
          ? _value.late_minutes
          : late_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      early_departure_minutes: null == early_departure_minutes
          ? _value.early_departure_minutes
          : early_departure_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      total_work_minutes: null == total_work_minutes
          ? _value.total_work_minutes
          : total_work_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      overtime_minutes: null == overtime_minutes
          ? _value.overtime_minutes
          : overtime_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      is_open: null == is_open
          ? _value.is_open
          : is_open // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AttendanceImpl extends _Attendance {
  const _$AttendanceImpl(
      {required this.id,
      required this.user,
      required this.branch,
      required this.shift,
      required this.date,
      required this.check_in_at,
      required this.check_out_at,
      required this.check_in_method,
      required this.check_out_method,
      required this.recorded_by,
      required this.duty_reason,
      required this.status,
      required this.late_minutes,
      required this.early_departure_minutes,
      required this.total_work_minutes,
      required this.overtime_minutes,
      required this.is_open})
      : super._();

  factory _$AttendanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceImplFromJson(json);

  @override
  final int id;
  @override
  final User user;
  @override
  final Branch branch;
  @override
  final Shift shift;
  @override
  final String date;
  @override
  final String check_in_at;
  @override
  final String check_out_at;
  @override
  final Checkinmethod check_in_method;
  @override
  final Checkoutmethod check_out_method;
  @override
  final dynamic recorded_by;
  @override
  final dynamic duty_reason;
  @override
  final Status status;
  @override
  final int late_minutes;
  @override
  final int early_departure_minutes;
  @override
  final int total_work_minutes;
  @override
  final int overtime_minutes;
  @override
  final bool is_open;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      __$$AttendanceImplCopyWithImpl<_$AttendanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceImplToJson(
      this,
    );
  }
}

abstract class _Attendance extends Attendance {
  const factory _Attendance(
      {required final int id,
      required final User user,
      required final Branch branch,
      required final Shift shift,
      required final String date,
      required final String check_in_at,
      required final String check_out_at,
      required final Checkinmethod check_in_method,
      required final Checkoutmethod check_out_method,
      required final dynamic recorded_by,
      required final dynamic duty_reason,
      required final Status status,
      required final int late_minutes,
      required final int early_departure_minutes,
      required final int total_work_minutes,
      required final int overtime_minutes,
      required final bool is_open}) = _$AttendanceImpl;
  const _Attendance._() : super._();

  factory _Attendance.fromJson(Map<String, dynamic> json) =
      _$AttendanceImpl.fromJson;

  @override
  int get id;
  @override
  User get user;
  @override
  Branch get branch;
  @override
  Shift get shift;
  @override
  String get date;
  @override
  String get check_in_at;
  @override
  String get check_out_at;
  @override
  Checkinmethod get check_in_method;
  @override
  Checkoutmethod get check_out_method;
  @override
  dynamic get recorded_by;
  @override
  dynamic get duty_reason;
  @override
  Status get status;
  @override
  int get late_minutes;
  @override
  int get early_departure_minutes;
  @override
  int get total_work_minutes;
  @override
  int get overtime_minutes;
  @override
  bool get is_open;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get employee_code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({int id, String name, String employee_code});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? employee_code = null,
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
      employee_code: null == employee_code
          ? _value.employee_code
          : employee_code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String employee_code});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? employee_code = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      employee_code: null == employee_code
          ? _value.employee_code
          : employee_code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.id, required this.name, required this.employee_code})
      : super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String employee_code;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {required final int id,
      required final String name,
      required final String employee_code}) = _$UserImpl;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get employee_code;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchCopyWith<Branch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCopyWith<$Res> {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) then) =
      _$BranchCopyWithImpl<$Res, Branch>;
  @useResult
  $Res call({int id, String name, String code});
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
  $Res call({int id, String name, String code});
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BranchImpl extends _Branch {
  const _$BranchImpl({required this.id, required this.name, required this.code})
      : super._();

  factory _$BranchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String code;

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
      required final String code}) = _$BranchImpl;
  const _Branch._() : super._();

  factory _Branch.fromJson(Map<String, dynamic> json) = _$BranchImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Shift _$ShiftFromJson(Map<String, dynamic> json) {
  return _Shift.fromJson(json);
}

/// @nodoc
mixin _$Shift {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get start_time => throw _privateConstructorUsedError;
  String get end_time => throw _privateConstructorUsedError;
  bool get is_overnight => throw _privateConstructorUsedError;

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
      String start_time,
      String end_time,
      bool is_overnight});
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
    Object? start_time = null,
    Object? end_time = null,
    Object? is_overnight = null,
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
      String start_time,
      String end_time,
      bool is_overnight});
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
    Object? start_time = null,
    Object? end_time = null,
    Object? is_overnight = null,
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShiftImpl extends _Shift {
  const _$ShiftImpl(
      {required this.id,
      required this.name,
      required this.start_time,
      required this.end_time,
      required this.is_overnight})
      : super._();

  factory _$ShiftImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String start_time;
  @override
  final String end_time;
  @override
  final bool is_overnight;

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
      required final String start_time,
      required final String end_time,
      required final bool is_overnight}) = _$ShiftImpl;
  const _Shift._() : super._();

  factory _Shift.fromJson(Map<String, dynamic> json) = _$ShiftImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get start_time;
  @override
  String get end_time;
  @override
  bool get is_overnight;
  @override
  @JsonKey(ignore: true)
  _$$ShiftImplCopyWith<_$ShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Checkinmethod _$CheckinmethodFromJson(Map<String, dynamic> json) {
  return _Checkinmethod.fromJson(json);
}

/// @nodoc
mixin _$Checkinmethod {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckinmethodCopyWith<Checkinmethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckinmethodCopyWith<$Res> {
  factory $CheckinmethodCopyWith(
          Checkinmethod value, $Res Function(Checkinmethod) then) =
      _$CheckinmethodCopyWithImpl<$Res, Checkinmethod>;
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class _$CheckinmethodCopyWithImpl<$Res, $Val extends Checkinmethod>
    implements $CheckinmethodCopyWith<$Res> {
  _$CheckinmethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckinmethodImplCopyWith<$Res>
    implements $CheckinmethodCopyWith<$Res> {
  factory _$$CheckinmethodImplCopyWith(
          _$CheckinmethodImpl value, $Res Function(_$CheckinmethodImpl) then) =
      __$$CheckinmethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class __$$CheckinmethodImplCopyWithImpl<$Res>
    extends _$CheckinmethodCopyWithImpl<$Res, _$CheckinmethodImpl>
    implements _$$CheckinmethodImplCopyWith<$Res> {
  __$$CheckinmethodImplCopyWithImpl(
      _$CheckinmethodImpl _value, $Res Function(_$CheckinmethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_$CheckinmethodImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CheckinmethodImpl extends _Checkinmethod {
  const _$CheckinmethodImpl({required this.value, required this.label})
      : super._();

  factory _$CheckinmethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckinmethodImplFromJson(json);

  @override
  final String value;
  @override
  final String label;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckinmethodImplCopyWith<_$CheckinmethodImpl> get copyWith =>
      __$$CheckinmethodImplCopyWithImpl<_$CheckinmethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckinmethodImplToJson(
      this,
    );
  }
}

abstract class _Checkinmethod extends Checkinmethod {
  const factory _Checkinmethod(
      {required final String value,
      required final String label}) = _$CheckinmethodImpl;
  const _Checkinmethod._() : super._();

  factory _Checkinmethod.fromJson(Map<String, dynamic> json) =
      _$CheckinmethodImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$CheckinmethodImplCopyWith<_$CheckinmethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Checkoutmethod _$CheckoutmethodFromJson(Map<String, dynamic> json) {
  return _Checkoutmethod.fromJson(json);
}

/// @nodoc
mixin _$Checkoutmethod {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckoutmethodCopyWith<Checkoutmethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutmethodCopyWith<$Res> {
  factory $CheckoutmethodCopyWith(
          Checkoutmethod value, $Res Function(Checkoutmethod) then) =
      _$CheckoutmethodCopyWithImpl<$Res, Checkoutmethod>;
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class _$CheckoutmethodCopyWithImpl<$Res, $Val extends Checkoutmethod>
    implements $CheckoutmethodCopyWith<$Res> {
  _$CheckoutmethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckoutmethodImplCopyWith<$Res>
    implements $CheckoutmethodCopyWith<$Res> {
  factory _$$CheckoutmethodImplCopyWith(_$CheckoutmethodImpl value,
          $Res Function(_$CheckoutmethodImpl) then) =
      __$$CheckoutmethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class __$$CheckoutmethodImplCopyWithImpl<$Res>
    extends _$CheckoutmethodCopyWithImpl<$Res, _$CheckoutmethodImpl>
    implements _$$CheckoutmethodImplCopyWith<$Res> {
  __$$CheckoutmethodImplCopyWithImpl(
      _$CheckoutmethodImpl _value, $Res Function(_$CheckoutmethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_$CheckoutmethodImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CheckoutmethodImpl extends _Checkoutmethod {
  const _$CheckoutmethodImpl({required this.value, required this.label})
      : super._();

  factory _$CheckoutmethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutmethodImplFromJson(json);

  @override
  final String value;
  @override
  final String label;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutmethodImplCopyWith<_$CheckoutmethodImpl> get copyWith =>
      __$$CheckoutmethodImplCopyWithImpl<_$CheckoutmethodImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutmethodImplToJson(
      this,
    );
  }
}

abstract class _Checkoutmethod extends Checkoutmethod {
  const factory _Checkoutmethod(
      {required final String value,
      required final String label}) = _$CheckoutmethodImpl;
  const _Checkoutmethod._() : super._();

  factory _Checkoutmethod.fromJson(Map<String, dynamic> json) =
      _$CheckoutmethodImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$CheckoutmethodImplCopyWith<_$CheckoutmethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
mixin _$Status {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res, Status>;
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res, $Val extends Status>
    implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusImplCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$$StatusImplCopyWith(
          _$StatusImpl value, $Res Function(_$StatusImpl) then) =
      __$$StatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class __$$StatusImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusImpl>
    implements _$$StatusImplCopyWith<$Res> {
  __$$StatusImplCopyWithImpl(
      _$StatusImpl _value, $Res Function(_$StatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_$StatusImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$StatusImpl extends _Status {
  const _$StatusImpl({required this.value, required this.label}) : super._();

  factory _$StatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusImplFromJson(json);

  @override
  final String value;
  @override
  final String label;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      __$$StatusImplCopyWithImpl<_$StatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusImplToJson(
      this,
    );
  }
}

abstract class _Status extends Status {
  const factory _Status(
      {required final String value,
      required final String label}) = _$StatusImpl;
  const _Status._() : super._();

  factory _Status.fromJson(Map<String, dynamic> json) = _$StatusImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
