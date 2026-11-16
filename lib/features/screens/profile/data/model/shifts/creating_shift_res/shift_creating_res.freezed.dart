// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_creating_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShiftCreatingRes _$ShiftCreatingResFromJson(Map<String, dynamic> json) {
  return _ShiftCreatingRes.fromJson(json);
}

/// @nodoc
mixin _$ShiftCreatingRes {
  String get message => throw _privateConstructorUsedError;
  ShiftItem get shift => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftCreatingResCopyWith<ShiftCreatingRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftCreatingResCopyWith<$Res> {
  factory $ShiftCreatingResCopyWith(
          ShiftCreatingRes value, $Res Function(ShiftCreatingRes) then) =
      _$ShiftCreatingResCopyWithImpl<$Res, ShiftCreatingRes>;
  @useResult
  $Res call({String message, ShiftItem shift});

  $ShiftItemCopyWith<$Res> get shift;
}

/// @nodoc
class _$ShiftCreatingResCopyWithImpl<$Res, $Val extends ShiftCreatingRes>
    implements $ShiftCreatingResCopyWith<$Res> {
  _$ShiftCreatingResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? shift = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftItem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShiftItemCopyWith<$Res> get shift {
    return $ShiftItemCopyWith<$Res>(_value.shift, (value) {
      return _then(_value.copyWith(shift: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShiftCreatingResImplCopyWith<$Res>
    implements $ShiftCreatingResCopyWith<$Res> {
  factory _$$ShiftCreatingResImplCopyWith(_$ShiftCreatingResImpl value,
          $Res Function(_$ShiftCreatingResImpl) then) =
      __$$ShiftCreatingResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, ShiftItem shift});

  @override
  $ShiftItemCopyWith<$Res> get shift;
}

/// @nodoc
class __$$ShiftCreatingResImplCopyWithImpl<$Res>
    extends _$ShiftCreatingResCopyWithImpl<$Res, _$ShiftCreatingResImpl>
    implements _$$ShiftCreatingResImplCopyWith<$Res> {
  __$$ShiftCreatingResImplCopyWithImpl(_$ShiftCreatingResImpl _value,
      $Res Function(_$ShiftCreatingResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? shift = null,
  }) {
    return _then(_$ShiftCreatingResImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftItem,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShiftCreatingResImpl extends _ShiftCreatingRes {
  const _$ShiftCreatingResImpl({required this.message, required this.shift})
      : super._();

  factory _$ShiftCreatingResImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftCreatingResImplFromJson(json);

  @override
  final String message;
  @override
  final ShiftItem shift;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftCreatingResImplCopyWith<_$ShiftCreatingResImpl> get copyWith =>
      __$$ShiftCreatingResImplCopyWithImpl<_$ShiftCreatingResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftCreatingResImplToJson(
      this,
    );
  }
}

abstract class _ShiftCreatingRes extends ShiftCreatingRes {
  const factory _ShiftCreatingRes(
      {required final String message,
      required final ShiftItem shift}) = _$ShiftCreatingResImpl;
  const _ShiftCreatingRes._() : super._();

  factory _ShiftCreatingRes.fromJson(Map<String, dynamic> json) =
      _$ShiftCreatingResImpl.fromJson;

  @override
  String get message;
  @override
  ShiftItem get shift;
  @override
  @JsonKey(ignore: true)
  _$$ShiftCreatingResImplCopyWith<_$ShiftCreatingResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
