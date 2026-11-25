// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_attendance_corrections_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListAttendanceCorrectionsRes _$ListAttendanceCorrectionsResFromJson(
    Map<String, dynamic> json) {
  return _ListAttendanceCorrectionsRes.fromJson(json);
}

/// @nodoc
mixin _$ListAttendanceCorrectionsRes {
  List<DataItem> get data => throw _privateConstructorUsedError;
  Meta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListAttendanceCorrectionsResCopyWith<ListAttendanceCorrectionsRes>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListAttendanceCorrectionsResCopyWith<$Res> {
  factory $ListAttendanceCorrectionsResCopyWith(
          ListAttendanceCorrectionsRes value,
          $Res Function(ListAttendanceCorrectionsRes) then) =
      _$ListAttendanceCorrectionsResCopyWithImpl<$Res,
          ListAttendanceCorrectionsRes>;
  @useResult
  $Res call({List<DataItem> data, Meta meta});

  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$ListAttendanceCorrectionsResCopyWithImpl<$Res,
        $Val extends ListAttendanceCorrectionsRes>
    implements $ListAttendanceCorrectionsResCopyWith<$Res> {
  _$ListAttendanceCorrectionsResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataItem>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ListAttendanceCorrectionsResImplCopyWith<$Res>
    implements $ListAttendanceCorrectionsResCopyWith<$Res> {
  factory _$$ListAttendanceCorrectionsResImplCopyWith(
          _$ListAttendanceCorrectionsResImpl value,
          $Res Function(_$ListAttendanceCorrectionsResImpl) then) =
      __$$ListAttendanceCorrectionsResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DataItem> data, Meta meta});

  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$ListAttendanceCorrectionsResImplCopyWithImpl<$Res>
    extends _$ListAttendanceCorrectionsResCopyWithImpl<$Res,
        _$ListAttendanceCorrectionsResImpl>
    implements _$$ListAttendanceCorrectionsResImplCopyWith<$Res> {
  __$$ListAttendanceCorrectionsResImplCopyWithImpl(
      _$ListAttendanceCorrectionsResImpl _value,
      $Res Function(_$ListAttendanceCorrectionsResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$ListAttendanceCorrectionsResImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataItem>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ListAttendanceCorrectionsResImpl extends _ListAttendanceCorrectionsRes {
  const _$ListAttendanceCorrectionsResImpl(
      {required final List<DataItem> data, required this.meta})
      : _data = data,
        super._();

  factory _$ListAttendanceCorrectionsResImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ListAttendanceCorrectionsResImplFromJson(json);

  final List<DataItem> _data;
  @override
  List<DataItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final Meta meta;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListAttendanceCorrectionsResImplCopyWith<
          _$ListAttendanceCorrectionsResImpl>
      get copyWith => __$$ListAttendanceCorrectionsResImplCopyWithImpl<
          _$ListAttendanceCorrectionsResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListAttendanceCorrectionsResImplToJson(
      this,
    );
  }
}

abstract class _ListAttendanceCorrectionsRes
    extends ListAttendanceCorrectionsRes {
  const factory _ListAttendanceCorrectionsRes(
      {required final List<DataItem> data,
      required final Meta meta}) = _$ListAttendanceCorrectionsResImpl;
  const _ListAttendanceCorrectionsRes._() : super._();

  factory _ListAttendanceCorrectionsRes.fromJson(Map<String, dynamic> json) =
      _$ListAttendanceCorrectionsResImpl.fromJson;

  @override
  List<DataItem> get data;
  @override
  Meta get meta;
  @override
  @JsonKey(ignore: true)
  _$$ListAttendanceCorrectionsResImplCopyWith<
          _$ListAttendanceCorrectionsResImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DataItem _$DataItemFromJson(Map<String, dynamic> json) {
  return _DataItem.fromJson(json);
}

/// @nodoc
mixin _$DataItem {
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
  $DataItemCopyWith<DataItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataItemCopyWith<$Res> {
  factory $DataItemCopyWith(DataItem value, $Res Function(DataItem) then) =
      _$DataItemCopyWithImpl<$Res, DataItem>;
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
class _$DataItemCopyWithImpl<$Res, $Val extends DataItem>
    implements $DataItemCopyWith<$Res> {
  _$DataItemCopyWithImpl(this._value, this._then);

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
abstract class _$$DataItemImplCopyWith<$Res>
    implements $DataItemCopyWith<$Res> {
  factory _$$DataItemImplCopyWith(
          _$DataItemImpl value, $Res Function(_$DataItemImpl) then) =
      __$$DataItemImplCopyWithImpl<$Res>;
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
class __$$DataItemImplCopyWithImpl<$Res>
    extends _$DataItemCopyWithImpl<$Res, _$DataItemImpl>
    implements _$$DataItemImplCopyWith<$Res> {
  __$$DataItemImplCopyWithImpl(
      _$DataItemImpl _value, $Res Function(_$DataItemImpl) _then)
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
    return _then(_$DataItemImpl(
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
class _$DataItemImpl extends _DataItem {
  const _$DataItemImpl(
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

  factory _$DataItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataItemImplFromJson(json);

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
  _$$DataItemImplCopyWith<_$DataItemImpl> get copyWith =>
      __$$DataItemImplCopyWithImpl<_$DataItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataItemImplToJson(
      this,
    );
  }
}

abstract class _DataItem extends DataItem {
  const factory _DataItem(
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
      required final String created_at}) = _$DataItemImpl;
  const _DataItem._() : super._();

  factory _DataItem.fromJson(Map<String, dynamic> json) =
      _$DataItemImpl.fromJson;

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
  _$$DataItemImplCopyWith<_$DataItemImpl> get copyWith =>
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

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  int get current_page => throw _privateConstructorUsedError;
  int get last_page => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call({int current_page, int last_page, int total});
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? last_page = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int current_page, int last_page, int total});
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? last_page = null,
    Object? total = null,
  }) {
    return _then(_$MetaImpl(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MetaImpl extends _Meta {
  const _$MetaImpl(
      {required this.current_page,
      required this.last_page,
      required this.total})
      : super._();

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  final int current_page;
  @override
  final int last_page;
  @override
  final int total;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta extends Meta {
  const factory _Meta(
      {required final int current_page,
      required final int last_page,
      required final int total}) = _$MetaImpl;
  const _Meta._() : super._();

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  int get current_page;
  @override
  int get last_page;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
