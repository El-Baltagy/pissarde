// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_attendacne_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodayAttendacneRes _$TodayAttendacneResFromJson(Map<String, dynamic> json) {
  return _TodayAttendacneRes.fromJson(json);
}

/// @nodoc
mixin _$TodayAttendacneRes {
  String get date => throw _privateConstructorUsedError;
  bool get has_checked_in => throw _privateConstructorUsedError;
  bool get is_open => throw _privateConstructorUsedError;
  Shift get shift => throw _privateConstructorUsedError;
  Branch get branch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodayAttendacneResCopyWith<TodayAttendacneRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayAttendacneResCopyWith<$Res> {
  factory $TodayAttendacneResCopyWith(
          TodayAttendacneRes value, $Res Function(TodayAttendacneRes) then) =
      _$TodayAttendacneResCopyWithImpl<$Res, TodayAttendacneRes>;
  @useResult
  $Res call(
      {String date,
      bool has_checked_in,
      bool is_open,
      Shift shift,
      Branch branch});

  $ShiftCopyWith<$Res> get shift;
  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class _$TodayAttendacneResCopyWithImpl<$Res, $Val extends TodayAttendacneRes>
    implements $TodayAttendacneResCopyWith<$Res> {
  _$TodayAttendacneResCopyWithImpl(this._value, this._then);

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
abstract class _$$TodayAttendacneResImplCopyWith<$Res>
    implements $TodayAttendacneResCopyWith<$Res> {
  factory _$$TodayAttendacneResImplCopyWith(_$TodayAttendacneResImpl value,
          $Res Function(_$TodayAttendacneResImpl) then) =
      __$$TodayAttendacneResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      bool has_checked_in,
      bool is_open,
      Shift shift,
      Branch branch});

  @override
  $ShiftCopyWith<$Res> get shift;
  @override
  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class __$$TodayAttendacneResImplCopyWithImpl<$Res>
    extends _$TodayAttendacneResCopyWithImpl<$Res, _$TodayAttendacneResImpl>
    implements _$$TodayAttendacneResImplCopyWith<$Res> {
  __$$TodayAttendacneResImplCopyWithImpl(_$TodayAttendacneResImpl _value,
      $Res Function(_$TodayAttendacneResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? has_checked_in = null,
    Object? is_open = null,
    Object? shift = null,
    Object? branch = null,
  }) {
    return _then(_$TodayAttendacneResImpl(
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
class _$TodayAttendacneResImpl extends _TodayAttendacneRes {
  const _$TodayAttendacneResImpl(
      {required this.date,
      required this.has_checked_in,
      required this.is_open,
      required this.shift,
      required this.branch})
      : super._();

  factory _$TodayAttendacneResImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayAttendacneResImplFromJson(json);

  @override
  final String date;
  @override
  final bool has_checked_in;
  @override
  final bool is_open;
  @override
  final Shift shift;
  @override
  final Branch branch;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayAttendacneResImplCopyWith<_$TodayAttendacneResImpl> get copyWith =>
      __$$TodayAttendacneResImplCopyWithImpl<_$TodayAttendacneResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayAttendacneResImplToJson(
      this,
    );
  }
}

abstract class _TodayAttendacneRes extends TodayAttendacneRes {
  const factory _TodayAttendacneRes(
      {required final String date,
      required final bool has_checked_in,
      required final bool is_open,
      required final Shift shift,
      required final Branch branch}) = _$TodayAttendacneResImpl;
  const _TodayAttendacneRes._() : super._();

  factory _TodayAttendacneRes.fromJson(Map<String, dynamic> json) =
      _$TodayAttendacneResImpl.fromJson;

  @override
  String get date;
  @override
  bool get has_checked_in;
  @override
  bool get is_open;
  @override
  Shift get shift;
  @override
  Branch get branch;
  @override
  @JsonKey(ignore: true)
  _$$TodayAttendacneResImplCopyWith<_$TodayAttendacneResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
