// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accept_pending_leave_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AcceptPendingLeaveRes _$AcceptPendingLeaveResFromJson(
    Map<String, dynamic> json) {
  return _AcceptPendingLeaveRes.fromJson(json);
}

/// @nodoc
mixin _$AcceptPendingLeaveRes {
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AcceptPendingLeaveResCopyWith<AcceptPendingLeaveRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptPendingLeaveResCopyWith<$Res> {
  factory $AcceptPendingLeaveResCopyWith(AcceptPendingLeaveRes value,
          $Res Function(AcceptPendingLeaveRes) then) =
      _$AcceptPendingLeaveResCopyWithImpl<$Res, AcceptPendingLeaveRes>;
  @useResult
  $Res call({String message, bool success});
}

/// @nodoc
class _$AcceptPendingLeaveResCopyWithImpl<$Res,
        $Val extends AcceptPendingLeaveRes>
    implements $AcceptPendingLeaveResCopyWith<$Res> {
  _$AcceptPendingLeaveResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AcceptPendingLeaveResImplCopyWith<$Res>
    implements $AcceptPendingLeaveResCopyWith<$Res> {
  factory _$$AcceptPendingLeaveResImplCopyWith(
          _$AcceptPendingLeaveResImpl value,
          $Res Function(_$AcceptPendingLeaveResImpl) then) =
      __$$AcceptPendingLeaveResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool success});
}

/// @nodoc
class __$$AcceptPendingLeaveResImplCopyWithImpl<$Res>
    extends _$AcceptPendingLeaveResCopyWithImpl<$Res,
        _$AcceptPendingLeaveResImpl>
    implements _$$AcceptPendingLeaveResImplCopyWith<$Res> {
  __$$AcceptPendingLeaveResImplCopyWithImpl(_$AcceptPendingLeaveResImpl _value,
      $Res Function(_$AcceptPendingLeaveResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_$AcceptPendingLeaveResImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AcceptPendingLeaveResImpl extends _AcceptPendingLeaveRes {
  const _$AcceptPendingLeaveResImpl(
      {required this.message, required this.success})
      : super._();

  factory _$AcceptPendingLeaveResImpl.fromJson(Map<String, dynamic> json) =>
      _$$AcceptPendingLeaveResImplFromJson(json);

  @override
  final String message;
  @override
  final bool success;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptPendingLeaveResImplCopyWith<_$AcceptPendingLeaveResImpl>
      get copyWith => __$$AcceptPendingLeaveResImplCopyWithImpl<
          _$AcceptPendingLeaveResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AcceptPendingLeaveResImplToJson(
      this,
    );
  }
}

abstract class _AcceptPendingLeaveRes extends AcceptPendingLeaveRes {
  const factory _AcceptPendingLeaveRes(
      {required final String message,
      required final bool success}) = _$AcceptPendingLeaveResImpl;
  const _AcceptPendingLeaveRes._() : super._();

  factory _AcceptPendingLeaveRes.fromJson(Map<String, dynamic> json) =
      _$AcceptPendingLeaveResImpl.fromJson;

  @override
  String get message;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$AcceptPendingLeaveResImplCopyWith<_$AcceptPendingLeaveResImpl>
      get copyWith => throw _privateConstructorUsedError;
}
