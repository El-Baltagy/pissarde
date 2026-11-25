// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_attendacne_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HistoryAttendacneRes _$HistoryAttendacneResFromJson(Map<String, dynamic> json) {
  return _HistoryAttendacneRes.fromJson(json);
}

/// @nodoc
mixin _$HistoryAttendacneRes {
  List<DataItem> get data => throw _privateConstructorUsedError;
  Links get links => throw _privateConstructorUsedError;
  Meta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryAttendacneResCopyWith<HistoryAttendacneRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryAttendacneResCopyWith<$Res> {
  factory $HistoryAttendacneResCopyWith(HistoryAttendacneRes value,
          $Res Function(HistoryAttendacneRes) then) =
      _$HistoryAttendacneResCopyWithImpl<$Res, HistoryAttendacneRes>;
  @useResult
  $Res call({List<DataItem> data, Links links, Meta meta});

  $LinksCopyWith<$Res> get links;
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$HistoryAttendacneResCopyWithImpl<$Res,
        $Val extends HistoryAttendacneRes>
    implements $HistoryAttendacneResCopyWith<$Res> {
  _$HistoryAttendacneResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataItem>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res> get links {
    return $LinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
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
abstract class _$$HistoryAttendacneResImplCopyWith<$Res>
    implements $HistoryAttendacneResCopyWith<$Res> {
  factory _$$HistoryAttendacneResImplCopyWith(_$HistoryAttendacneResImpl value,
          $Res Function(_$HistoryAttendacneResImpl) then) =
      __$$HistoryAttendacneResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DataItem> data, Links links, Meta meta});

  @override
  $LinksCopyWith<$Res> get links;
  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$HistoryAttendacneResImplCopyWithImpl<$Res>
    extends _$HistoryAttendacneResCopyWithImpl<$Res, _$HistoryAttendacneResImpl>
    implements _$$HistoryAttendacneResImplCopyWith<$Res> {
  __$$HistoryAttendacneResImplCopyWithImpl(_$HistoryAttendacneResImpl _value,
      $Res Function(_$HistoryAttendacneResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_$HistoryAttendacneResImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataItem>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$HistoryAttendacneResImpl extends _HistoryAttendacneRes {
  const _$HistoryAttendacneResImpl(
      {required final List<DataItem> data,
      required this.links,
      required this.meta})
      : _data = data,
        super._();

  factory _$HistoryAttendacneResImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryAttendacneResImplFromJson(json);

  final List<DataItem> _data;
  @override
  List<DataItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final Links links;
  @override
  final Meta meta;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryAttendacneResImplCopyWith<_$HistoryAttendacneResImpl>
      get copyWith =>
          __$$HistoryAttendacneResImplCopyWithImpl<_$HistoryAttendacneResImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryAttendacneResImplToJson(
      this,
    );
  }
}

abstract class _HistoryAttendacneRes extends HistoryAttendacneRes {
  const factory _HistoryAttendacneRes(
      {required final List<DataItem> data,
      required final Links links,
      required final Meta meta}) = _$HistoryAttendacneResImpl;
  const _HistoryAttendacneRes._() : super._();

  factory _HistoryAttendacneRes.fromJson(Map<String, dynamic> json) =
      _$HistoryAttendacneResImpl.fromJson;

  @override
  List<DataItem> get data;
  @override
  Links get links;
  @override
  Meta get meta;
  @override
  @JsonKey(ignore: true)
  _$$HistoryAttendacneResImplCopyWith<_$HistoryAttendacneResImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DataItem _$DataItemFromJson(Map<String, dynamic> json) {
  return _DataItem.fromJson(json);
}

/// @nodoc
mixin _$DataItem {
  int get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  Branch get branch => throw _privateConstructorUsedError;
  Shift get shift => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get check_in_at => throw _privateConstructorUsedError;
  String? get check_out_at => throw _privateConstructorUsedError;
  Checkinmethod get check_in_method => throw _privateConstructorUsedError;
  Checkoutmethod get check_out_method => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  int get late_minutes => throw _privateConstructorUsedError;
  int get early_departure_minutes => throw _privateConstructorUsedError;
  int get total_work_minutes => throw _privateConstructorUsedError;
  int? get overtime_minutes => throw _privateConstructorUsedError;
  bool get is_open => throw _privateConstructorUsedError;
  bool get is_working => throw _privateConstructorUsedError;
  int get worked_minutes => throw _privateConstructorUsedError;
  String get worked_time => throw _privateConstructorUsedError;

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
      Branch branch,
      Shift shift,
      String? date,
      String? check_in_at,
      String? check_out_at,
      Checkinmethod check_in_method,
      Checkoutmethod check_out_method,
      Status status,
      int late_minutes,
      int early_departure_minutes,
      int total_work_minutes,
      int? overtime_minutes,
      bool is_open,
      bool is_working,
      int worked_minutes,
      String worked_time});

  $UserCopyWith<$Res> get user;
  $BranchCopyWith<$Res> get branch;
  $ShiftCopyWith<$Res> get shift;
  $CheckinmethodCopyWith<$Res> get check_in_method;
  $CheckoutmethodCopyWith<$Res> get check_out_method;
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
    Object? branch = null,
    Object? shift = null,
    Object? date = freezed,
    Object? check_in_at = freezed,
    Object? check_out_at = freezed,
    Object? check_in_method = null,
    Object? check_out_method = null,
    Object? status = null,
    Object? late_minutes = null,
    Object? early_departure_minutes = null,
    Object? total_work_minutes = null,
    Object? overtime_minutes = freezed,
    Object? is_open = null,
    Object? is_working = null,
    Object? worked_minutes = null,
    Object? worked_time = null,
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
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      check_in_at: freezed == check_in_at
          ? _value.check_in_at
          : check_in_at // ignore: cast_nullable_to_non_nullable
              as String?,
      check_out_at: freezed == check_out_at
          ? _value.check_out_at
          : check_out_at // ignore: cast_nullable_to_non_nullable
              as String?,
      check_in_method: null == check_in_method
          ? _value.check_in_method
          : check_in_method // ignore: cast_nullable_to_non_nullable
              as Checkinmethod,
      check_out_method: null == check_out_method
          ? _value.check_out_method
          : check_out_method // ignore: cast_nullable_to_non_nullable
              as Checkoutmethod,
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
      overtime_minutes: freezed == overtime_minutes
          ? _value.overtime_minutes
          : overtime_minutes // ignore: cast_nullable_to_non_nullable
              as int?,
      is_open: null == is_open
          ? _value.is_open
          : is_open // ignore: cast_nullable_to_non_nullable
              as bool,
      is_working: null == is_working
          ? _value.is_working
          : is_working // ignore: cast_nullable_to_non_nullable
              as bool,
      worked_minutes: null == worked_minutes
          ? _value.worked_minutes
          : worked_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      worked_time: null == worked_time
          ? _value.worked_time
          : worked_time // ignore: cast_nullable_to_non_nullable
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
      Branch branch,
      Shift shift,
      String? date,
      String? check_in_at,
      String? check_out_at,
      Checkinmethod check_in_method,
      Checkoutmethod check_out_method,
      Status status,
      int late_minutes,
      int early_departure_minutes,
      int total_work_minutes,
      int? overtime_minutes,
      bool is_open,
      bool is_working,
      int worked_minutes,
      String worked_time});

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
    Object? branch = null,
    Object? shift = null,
    Object? date = freezed,
    Object? check_in_at = freezed,
    Object? check_out_at = freezed,
    Object? check_in_method = null,
    Object? check_out_method = null,
    Object? status = null,
    Object? late_minutes = null,
    Object? early_departure_minutes = null,
    Object? total_work_minutes = null,
    Object? overtime_minutes = freezed,
    Object? is_open = null,
    Object? is_working = null,
    Object? worked_minutes = null,
    Object? worked_time = null,
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
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      check_in_at: freezed == check_in_at
          ? _value.check_in_at
          : check_in_at // ignore: cast_nullable_to_non_nullable
              as String?,
      check_out_at: freezed == check_out_at
          ? _value.check_out_at
          : check_out_at // ignore: cast_nullable_to_non_nullable
              as String?,
      check_in_method: null == check_in_method
          ? _value.check_in_method
          : check_in_method // ignore: cast_nullable_to_non_nullable
              as Checkinmethod,
      check_out_method: null == check_out_method
          ? _value.check_out_method
          : check_out_method // ignore: cast_nullable_to_non_nullable
              as Checkoutmethod,
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
      overtime_minutes: freezed == overtime_minutes
          ? _value.overtime_minutes
          : overtime_minutes // ignore: cast_nullable_to_non_nullable
              as int?,
      is_open: null == is_open
          ? _value.is_open
          : is_open // ignore: cast_nullable_to_non_nullable
              as bool,
      is_working: null == is_working
          ? _value.is_working
          : is_working // ignore: cast_nullable_to_non_nullable
              as bool,
      worked_minutes: null == worked_minutes
          ? _value.worked_minutes
          : worked_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      worked_time: null == worked_time
          ? _value.worked_time
          : worked_time // ignore: cast_nullable_to_non_nullable
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
      required this.branch,
      required this.shift,
      required this.date,
      required this.check_in_at,
      required this.check_out_at,
      required this.check_in_method,
      required this.check_out_method,
      required this.status,
      required this.late_minutes,
      required this.early_departure_minutes,
      required this.total_work_minutes,
      required this.overtime_minutes,
      required this.is_open,
      required this.is_working,
      required this.worked_minutes,
      required this.worked_time})
      : super._();

  factory _$DataItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataItemImplFromJson(json);

  @override
  final int id;
  @override
  final User user;
  @override
  final Branch branch;
  @override
  final Shift shift;
  @override
  final String? date;
  @override
  final String? check_in_at;
  @override
  final String? check_out_at;
  @override
  final Checkinmethod check_in_method;
  @override
  final Checkoutmethod check_out_method;
  @override
  final Status status;
  @override
  final int late_minutes;
  @override
  final int early_departure_minutes;
  @override
  final int total_work_minutes;
  @override
  final int? overtime_minutes;
  @override
  final bool is_open;
  @override
  final bool is_working;
  @override
  final int worked_minutes;
  @override
  final String worked_time;

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
      required final Branch branch,
      required final Shift shift,
      required final String? date,
      required final String? check_in_at,
      required final String? check_out_at,
      required final Checkinmethod check_in_method,
      required final Checkoutmethod check_out_method,
      required final Status status,
      required final int late_minutes,
      required final int early_departure_minutes,
      required final int total_work_minutes,
      required final int? overtime_minutes,
      required final bool is_open,
      required final bool is_working,
      required final int worked_minutes,
      required final String worked_time}) = _$DataItemImpl;
  const _DataItem._() : super._();

  factory _DataItem.fromJson(Map<String, dynamic> json) =
      _$DataItemImpl.fromJson;

  @override
  int get id;
  @override
  User get user;
  @override
  Branch get branch;
  @override
  Shift get shift;
  @override
  String? get date;
  @override
  String? get check_in_at;
  @override
  String? get check_out_at;
  @override
  Checkinmethod get check_in_method;
  @override
  Checkoutmethod get check_out_method;
  @override
  Status get status;
  @override
  int get late_minutes;
  @override
  int get early_departure_minutes;
  @override
  int get total_work_minutes;
  @override
  int? get overtime_minutes;
  @override
  bool get is_open;
  @override
  bool get is_working;
  @override
  int get worked_minutes;
  @override
  String get worked_time;
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

Links _$LinksFromJson(Map<String, dynamic> json) {
  return _Links.fromJson(json);
}

/// @nodoc
mixin _$Links {
  String get first => throw _privateConstructorUsedError;
  String get last => throw _privateConstructorUsedError;
  dynamic get prev => throw _privateConstructorUsedError;
  dynamic get next => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinksCopyWith<Links> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksCopyWith<$Res> {
  factory $LinksCopyWith(Links value, $Res Function(Links) then) =
      _$LinksCopyWithImpl<$Res, Links>;
  @useResult
  $Res call({String first, String last, dynamic prev, dynamic next});
}

/// @nodoc
class _$LinksCopyWithImpl<$Res, $Val extends Links>
    implements $LinksCopyWith<$Res> {
  _$LinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as dynamic,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinksImplCopyWith<$Res> implements $LinksCopyWith<$Res> {
  factory _$$LinksImplCopyWith(
          _$LinksImpl value, $Res Function(_$LinksImpl) then) =
      __$$LinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String first, String last, dynamic prev, dynamic next});
}

/// @nodoc
class __$$LinksImplCopyWithImpl<$Res>
    extends _$LinksCopyWithImpl<$Res, _$LinksImpl>
    implements _$$LinksImplCopyWith<$Res> {
  __$$LinksImplCopyWithImpl(
      _$LinksImpl _value, $Res Function(_$LinksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_$LinksImpl(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as dynamic,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LinksImpl extends _Links {
  const _$LinksImpl(
      {required this.first,
      required this.last,
      required this.prev,
      required this.next})
      : super._();

  factory _$LinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinksImplFromJson(json);

  @override
  final String first;
  @override
  final String last;
  @override
  final dynamic prev;
  @override
  final dynamic next;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      __$$LinksImplCopyWithImpl<_$LinksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinksImplToJson(
      this,
    );
  }
}

abstract class _Links extends Links {
  const factory _Links(
      {required final String first,
      required final String last,
      required final dynamic prev,
      required final dynamic next}) = _$LinksImpl;
  const _Links._() : super._();

  factory _Links.fromJson(Map<String, dynamic> json) = _$LinksImpl.fromJson;

  @override
  String get first;
  @override
  String get last;
  @override
  dynamic get prev;
  @override
  dynamic get next;
  @override
  @JsonKey(ignore: true)
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  int get current_page => throw _privateConstructorUsedError;
  int get from => throw _privateConstructorUsedError;
  int get last_page => throw _privateConstructorUsedError;
  List<LinkItem> get links => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  int get per_page => throw _privateConstructorUsedError;
  int get to => throw _privateConstructorUsedError;
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
  $Res call(
      {int current_page,
      int from,
      int last_page,
      List<LinkItem> links,
      String path,
      int per_page,
      int to,
      int total});
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
    Object? from = null,
    Object? last_page = null,
    Object? links = null,
    Object? path = null,
    Object? per_page = null,
    Object? to = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinkItem>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      per_page: null == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {int current_page,
      int from,
      int last_page,
      List<LinkItem> links,
      String path,
      int per_page,
      int to,
      int total});
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
    Object? from = null,
    Object? last_page = null,
    Object? links = null,
    Object? path = null,
    Object? per_page = null,
    Object? to = null,
    Object? total = null,
  }) {
    return _then(_$MetaImpl(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinkItem>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      per_page: null == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
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
      required this.from,
      required this.last_page,
      required final List<LinkItem> links,
      required this.path,
      required this.per_page,
      required this.to,
      required this.total})
      : _links = links,
        super._();

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  final int current_page;
  @override
  final int from;
  @override
  final int last_page;
  final List<LinkItem> _links;
  @override
  List<LinkItem> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  final String path;
  @override
  final int per_page;
  @override
  final int to;
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
      required final int from,
      required final int last_page,
      required final List<LinkItem> links,
      required final String path,
      required final int per_page,
      required final int to,
      required final int total}) = _$MetaImpl;
  const _Meta._() : super._();

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  int get current_page;
  @override
  int get from;
  @override
  int get last_page;
  @override
  List<LinkItem> get links;
  @override
  String get path;
  @override
  int get per_page;
  @override
  int get to;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LinkItem _$LinkItemFromJson(Map<String, dynamic> json) {
  return _LinkItem.fromJson(json);
}

/// @nodoc
mixin _$LinkItem {
  dynamic get url => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  dynamic get page => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinkItemCopyWith<LinkItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkItemCopyWith<$Res> {
  factory $LinkItemCopyWith(LinkItem value, $Res Function(LinkItem) then) =
      _$LinkItemCopyWithImpl<$Res, LinkItem>;
  @useResult
  $Res call({dynamic url, String label, dynamic page, bool active});
}

/// @nodoc
class _$LinkItemCopyWithImpl<$Res, $Val extends LinkItem>
    implements $LinkItemCopyWith<$Res> {
  _$LinkItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? page = freezed,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as dynamic,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as dynamic,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinkItemImplCopyWith<$Res>
    implements $LinkItemCopyWith<$Res> {
  factory _$$LinkItemImplCopyWith(
          _$LinkItemImpl value, $Res Function(_$LinkItemImpl) then) =
      __$$LinkItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic url, String label, dynamic page, bool active});
}

/// @nodoc
class __$$LinkItemImplCopyWithImpl<$Res>
    extends _$LinkItemCopyWithImpl<$Res, _$LinkItemImpl>
    implements _$$LinkItemImplCopyWith<$Res> {
  __$$LinkItemImplCopyWithImpl(
      _$LinkItemImpl _value, $Res Function(_$LinkItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? page = freezed,
    Object? active = null,
  }) {
    return _then(_$LinkItemImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as dynamic,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as dynamic,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LinkItemImpl extends _LinkItem {
  const _$LinkItemImpl(
      {required this.url,
      required this.label,
      required this.page,
      required this.active})
      : super._();

  factory _$LinkItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkItemImplFromJson(json);

  @override
  final dynamic url;
  @override
  final String label;
  @override
  final dynamic page;
  @override
  final bool active;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkItemImplCopyWith<_$LinkItemImpl> get copyWith =>
      __$$LinkItemImplCopyWithImpl<_$LinkItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkItemImplToJson(
      this,
    );
  }
}

abstract class _LinkItem extends LinkItem {
  const factory _LinkItem(
      {required final dynamic url,
      required final String label,
      required final dynamic page,
      required final bool active}) = _$LinkItemImpl;
  const _LinkItem._() : super._();

  factory _LinkItem.fromJson(Map<String, dynamic> json) =
      _$LinkItemImpl.fromJson;

  @override
  dynamic get url;
  @override
  String get label;
  @override
  dynamic get page;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$LinkItemImplCopyWith<_$LinkItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
