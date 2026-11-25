// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_correction_request_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceCorrectionRequestRes _$AttendanceCorrectionRequestResFromJson(
    Map<String, dynamic> json) {
  return _AttendanceCorrectionRequestRes.fromJson(json);
}

/// @nodoc
mixin _$AttendanceCorrectionRequestRes {
  String get message => throw _privateConstructorUsedError;
  Correction get correction => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceCorrectionRequestResCopyWith<AttendanceCorrectionRequestRes>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCorrectionRequestResCopyWith<$Res> {
  factory $AttendanceCorrectionRequestResCopyWith(
          AttendanceCorrectionRequestRes value,
          $Res Function(AttendanceCorrectionRequestRes) then) =
      _$AttendanceCorrectionRequestResCopyWithImpl<$Res,
          AttendanceCorrectionRequestRes>;
  @useResult
  $Res call({String message, Correction correction, bool success});

  $CorrectionCopyWith<$Res> get correction;
}

/// @nodoc
class _$AttendanceCorrectionRequestResCopyWithImpl<$Res,
        $Val extends AttendanceCorrectionRequestRes>
    implements $AttendanceCorrectionRequestResCopyWith<$Res> {
  _$AttendanceCorrectionRequestResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? correction = null,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      correction: null == correction
          ? _value.correction
          : correction // ignore: cast_nullable_to_non_nullable
              as Correction,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CorrectionCopyWith<$Res> get correction {
    return $CorrectionCopyWith<$Res>(_value.correction, (value) {
      return _then(_value.copyWith(correction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendanceCorrectionRequestResImplCopyWith<$Res>
    implements $AttendanceCorrectionRequestResCopyWith<$Res> {
  factory _$$AttendanceCorrectionRequestResImplCopyWith(
          _$AttendanceCorrectionRequestResImpl value,
          $Res Function(_$AttendanceCorrectionRequestResImpl) then) =
      __$$AttendanceCorrectionRequestResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Correction correction, bool success});

  @override
  $CorrectionCopyWith<$Res> get correction;
}

/// @nodoc
class __$$AttendanceCorrectionRequestResImplCopyWithImpl<$Res>
    extends _$AttendanceCorrectionRequestResCopyWithImpl<$Res,
        _$AttendanceCorrectionRequestResImpl>
    implements _$$AttendanceCorrectionRequestResImplCopyWith<$Res> {
  __$$AttendanceCorrectionRequestResImplCopyWithImpl(
      _$AttendanceCorrectionRequestResImpl _value,
      $Res Function(_$AttendanceCorrectionRequestResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? correction = null,
    Object? success = null,
  }) {
    return _then(_$AttendanceCorrectionRequestResImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      correction: null == correction
          ? _value.correction
          : correction // ignore: cast_nullable_to_non_nullable
              as Correction,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AttendanceCorrectionRequestResImpl
    extends _AttendanceCorrectionRequestRes {
  const _$AttendanceCorrectionRequestResImpl(
      {required this.message, required this.correction, required this.success})
      : super._();

  factory _$AttendanceCorrectionRequestResImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AttendanceCorrectionRequestResImplFromJson(json);

  @override
  final String message;
  @override
  final Correction correction;
  @override
  final bool success;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceCorrectionRequestResImplCopyWith<
          _$AttendanceCorrectionRequestResImpl>
      get copyWith => __$$AttendanceCorrectionRequestResImplCopyWithImpl<
          _$AttendanceCorrectionRequestResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceCorrectionRequestResImplToJson(
      this,
    );
  }
}

abstract class _AttendanceCorrectionRequestRes
    extends AttendanceCorrectionRequestRes {
  const factory _AttendanceCorrectionRequestRes(
      {required final String message,
      required final Correction correction,
      required final bool success}) = _$AttendanceCorrectionRequestResImpl;
  const _AttendanceCorrectionRequestRes._() : super._();

  factory _AttendanceCorrectionRequestRes.fromJson(Map<String, dynamic> json) =
      _$AttendanceCorrectionRequestResImpl.fromJson;

  @override
  String get message;
  @override
  Correction get correction;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceCorrectionRequestResImplCopyWith<
          _$AttendanceCorrectionRequestResImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Correction _$CorrectionFromJson(Map<String, dynamic> json) {
  return _Correction.fromJson(json);
}

/// @nodoc
mixin _$Correction {
  int get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  dynamic get attendance_id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get requested_check_in_at => throw _privateConstructorUsedError;
  String get requested_check_out_at => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  dynamic get reviewed_by => throw _privateConstructorUsedError;
  dynamic get reviewed_at => throw _privateConstructorUsedError;
  dynamic get review_notes => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CorrectionCopyWith<Correction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CorrectionCopyWith<$Res> {
  factory $CorrectionCopyWith(
          Correction value, $Res Function(Correction) then) =
      _$CorrectionCopyWithImpl<$Res, Correction>;
  @useResult
  $Res call(
      {int id,
      User user,
      dynamic attendance_id,
      String date,
      String requested_check_in_at,
      String requested_check_out_at,
      String reason,
      Status status,
      dynamic reviewed_by,
      dynamic reviewed_at,
      dynamic review_notes,
      String created_at});

  $UserCopyWith<$Res> get user;
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$CorrectionCopyWithImpl<$Res, $Val extends Correction>
    implements $CorrectionCopyWith<$Res> {
  _$CorrectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? attendance_id = freezed,
    Object? date = null,
    Object? requested_check_in_at = null,
    Object? requested_check_out_at = null,
    Object? reason = null,
    Object? status = null,
    Object? reviewed_by = freezed,
    Object? reviewed_at = freezed,
    Object? review_notes = freezed,
    Object? created_at = null,
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
      attendance_id: freezed == attendance_id
          ? _value.attendance_id
          : attendance_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      requested_check_in_at: null == requested_check_in_at
          ? _value.requested_check_in_at
          : requested_check_in_at // ignore: cast_nullable_to_non_nullable
              as String,
      requested_check_out_at: null == requested_check_out_at
          ? _value.requested_check_out_at
          : requested_check_out_at // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      reviewed_by: freezed == reviewed_by
          ? _value.reviewed_by
          : reviewed_by // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reviewed_at: freezed == reviewed_at
          ? _value.reviewed_at
          : reviewed_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
      review_notes: freezed == review_notes
          ? _value.review_notes
          : review_notes // ignore: cast_nullable_to_non_nullable
              as dynamic,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
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
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CorrectionImplCopyWith<$Res>
    implements $CorrectionCopyWith<$Res> {
  factory _$$CorrectionImplCopyWith(
          _$CorrectionImpl value, $Res Function(_$CorrectionImpl) then) =
      __$$CorrectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      User user,
      dynamic attendance_id,
      String date,
      String requested_check_in_at,
      String requested_check_out_at,
      String reason,
      Status status,
      dynamic reviewed_by,
      dynamic reviewed_at,
      dynamic review_notes,
      String created_at});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$CorrectionImplCopyWithImpl<$Res>
    extends _$CorrectionCopyWithImpl<$Res, _$CorrectionImpl>
    implements _$$CorrectionImplCopyWith<$Res> {
  __$$CorrectionImplCopyWithImpl(
      _$CorrectionImpl _value, $Res Function(_$CorrectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? attendance_id = freezed,
    Object? date = null,
    Object? requested_check_in_at = null,
    Object? requested_check_out_at = null,
    Object? reason = null,
    Object? status = null,
    Object? reviewed_by = freezed,
    Object? reviewed_at = freezed,
    Object? review_notes = freezed,
    Object? created_at = null,
  }) {
    return _then(_$CorrectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      attendance_id: freezed == attendance_id
          ? _value.attendance_id
          : attendance_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      requested_check_in_at: null == requested_check_in_at
          ? _value.requested_check_in_at
          : requested_check_in_at // ignore: cast_nullable_to_non_nullable
              as String,
      requested_check_out_at: null == requested_check_out_at
          ? _value.requested_check_out_at
          : requested_check_out_at // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      reviewed_by: freezed == reviewed_by
          ? _value.reviewed_by
          : reviewed_by // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reviewed_at: freezed == reviewed_at
          ? _value.reviewed_at
          : reviewed_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
      review_notes: freezed == review_notes
          ? _value.review_notes
          : review_notes // ignore: cast_nullable_to_non_nullable
              as dynamic,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CorrectionImpl extends _Correction {
  const _$CorrectionImpl(
      {required this.id,
      required this.user,
      required this.attendance_id,
      required this.date,
      required this.requested_check_in_at,
      required this.requested_check_out_at,
      required this.reason,
      required this.status,
      required this.reviewed_by,
      required this.reviewed_at,
      required this.review_notes,
      required this.created_at})
      : super._();

  factory _$CorrectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CorrectionImplFromJson(json);

  @override
  final int id;
  @override
  final User user;
  @override
  final dynamic attendance_id;
  @override
  final String date;
  @override
  final String requested_check_in_at;
  @override
  final String requested_check_out_at;
  @override
  final String reason;
  @override
  final Status status;
  @override
  final dynamic reviewed_by;
  @override
  final dynamic reviewed_at;
  @override
  final dynamic review_notes;
  @override
  final String created_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CorrectionImplCopyWith<_$CorrectionImpl> get copyWith =>
      __$$CorrectionImplCopyWithImpl<_$CorrectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CorrectionImplToJson(
      this,
    );
  }
}

abstract class _Correction extends Correction {
  const factory _Correction(
      {required final int id,
      required final User user,
      required final dynamic attendance_id,
      required final String date,
      required final String requested_check_in_at,
      required final String requested_check_out_at,
      required final String reason,
      required final Status status,
      required final dynamic reviewed_by,
      required final dynamic reviewed_at,
      required final dynamic review_notes,
      required final String created_at}) = _$CorrectionImpl;
  const _Correction._() : super._();

  factory _Correction.fromJson(Map<String, dynamic> json) =
      _$CorrectionImpl.fromJson;

  @override
  int get id;
  @override
  User get user;
  @override
  dynamic get attendance_id;
  @override
  String get date;
  @override
  String get requested_check_in_at;
  @override
  String get requested_check_out_at;
  @override
  String get reason;
  @override
  Status get status;
  @override
  dynamic get reviewed_by;
  @override
  dynamic get reviewed_at;
  @override
  dynamic get review_notes;
  @override
  String get created_at;
  @override
  @JsonKey(ignore: true)
  _$$CorrectionImplCopyWith<_$CorrectionImpl> get copyWith =>
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
