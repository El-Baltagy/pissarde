// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_shift_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteShiftRes _$DeleteShiftResFromJson(Map<String, dynamic> json) {
  return _DeleteShiftRes.fromJson(json);
}

/// @nodoc
mixin _$DeleteShiftRes {
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteShiftResCopyWith<DeleteShiftRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteShiftResCopyWith<$Res> {
  factory $DeleteShiftResCopyWith(
          DeleteShiftRes value, $Res Function(DeleteShiftRes) then) =
      _$DeleteShiftResCopyWithImpl<$Res, DeleteShiftRes>;
  @useResult
  $Res call({String message, bool success});
}

/// @nodoc
class _$DeleteShiftResCopyWithImpl<$Res, $Val extends DeleteShiftRes>
    implements $DeleteShiftResCopyWith<$Res> {
  _$DeleteShiftResCopyWithImpl(this._value, this._then);

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
abstract class _$$DeleteShiftResImplCopyWith<$Res>
    implements $DeleteShiftResCopyWith<$Res> {
  factory _$$DeleteShiftResImplCopyWith(_$DeleteShiftResImpl value,
          $Res Function(_$DeleteShiftResImpl) then) =
      __$$DeleteShiftResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool success});
}

/// @nodoc
class __$$DeleteShiftResImplCopyWithImpl<$Res>
    extends _$DeleteShiftResCopyWithImpl<$Res, _$DeleteShiftResImpl>
    implements _$$DeleteShiftResImplCopyWith<$Res> {
  __$$DeleteShiftResImplCopyWithImpl(
      _$DeleteShiftResImpl _value, $Res Function(_$DeleteShiftResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_$DeleteShiftResImpl(
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
class _$DeleteShiftResImpl extends _DeleteShiftRes {
  const _$DeleteShiftResImpl({required this.message, required this.success})
      : super._();

  factory _$DeleteShiftResImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteShiftResImplFromJson(json);

  @override
  final String message;
  @override
  final bool success;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteShiftResImplCopyWith<_$DeleteShiftResImpl> get copyWith =>
      __$$DeleteShiftResImplCopyWithImpl<_$DeleteShiftResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteShiftResImplToJson(
      this,
    );
  }
}

abstract class _DeleteShiftRes extends DeleteShiftRes {
  const factory _DeleteShiftRes(
      {required final String message,
      required final bool success}) = _$DeleteShiftResImpl;
  const _DeleteShiftRes._() : super._();

  factory _DeleteShiftRes.fromJson(Map<String, dynamic> json) =
      _$DeleteShiftResImpl.fromJson;

  @override
  String get message;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$DeleteShiftResImplCopyWith<_$DeleteShiftResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
