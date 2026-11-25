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
  bool get success => throw _privateConstructorUsedError;

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
  $Res call({String message, bool success});
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
abstract class _$$ChechInResImplCopyWith<$Res>
    implements $ChechInResCopyWith<$Res> {
  factory _$$ChechInResImplCopyWith(
          _$ChechInResImpl value, $Res Function(_$ChechInResImpl) then) =
      __$$ChechInResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool success});
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
    Object? success = null,
  }) {
    return _then(_$ChechInResImpl(
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
class _$ChechInResImpl extends _ChechInRes {
  const _$ChechInResImpl({required this.message, required this.success})
      : super._();

  factory _$ChechInResImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChechInResImplFromJson(json);

  @override
  final String message;
  @override
  final bool success;

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
      required final bool success}) = _$ChechInResImpl;
  const _ChechInRes._() : super._();

  factory _ChechInRes.fromJson(Map<String, dynamic> json) =
      _$ChechInResImpl.fromJson;

  @override
  String get message;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$ChechInResImplCopyWith<_$ChechInResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
