// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_branch_qr_code_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyBranchQrCodeRes _$VerifyBranchQrCodeResFromJson(
    Map<String, dynamic> json) {
  return _VerifyBranchQrCodeRes.fromJson(json);
}

/// @nodoc
mixin _$VerifyBranchQrCodeRes {
  bool get valid => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyBranchQrCodeResCopyWith<VerifyBranchQrCodeRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyBranchQrCodeResCopyWith<$Res> {
  factory $VerifyBranchQrCodeResCopyWith(VerifyBranchQrCodeRes value,
          $Res Function(VerifyBranchQrCodeRes) then) =
      _$VerifyBranchQrCodeResCopyWithImpl<$Res, VerifyBranchQrCodeRes>;
  @useResult
  $Res call({bool valid, String? reason});
}

/// @nodoc
class _$VerifyBranchQrCodeResCopyWithImpl<$Res,
        $Val extends VerifyBranchQrCodeRes>
    implements $VerifyBranchQrCodeResCopyWith<$Res> {
  _$VerifyBranchQrCodeResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyBranchQrCodeResImplCopyWith<$Res>
    implements $VerifyBranchQrCodeResCopyWith<$Res> {
  factory _$$VerifyBranchQrCodeResImplCopyWith(
          _$VerifyBranchQrCodeResImpl value,
          $Res Function(_$VerifyBranchQrCodeResImpl) then) =
      __$$VerifyBranchQrCodeResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool valid, String? reason});
}

/// @nodoc
class __$$VerifyBranchQrCodeResImplCopyWithImpl<$Res>
    extends _$VerifyBranchQrCodeResCopyWithImpl<$Res,
        _$VerifyBranchQrCodeResImpl>
    implements _$$VerifyBranchQrCodeResImplCopyWith<$Res> {
  __$$VerifyBranchQrCodeResImplCopyWithImpl(_$VerifyBranchQrCodeResImpl _value,
      $Res Function(_$VerifyBranchQrCodeResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? reason = freezed,
  }) {
    return _then(_$VerifyBranchQrCodeResImpl(
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$VerifyBranchQrCodeResImpl extends _VerifyBranchQrCodeRes {
  const _$VerifyBranchQrCodeResImpl({required this.valid, required this.reason})
      : super._();

  factory _$VerifyBranchQrCodeResImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyBranchQrCodeResImplFromJson(json);

  @override
  final bool valid;
  @override
  final String? reason;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyBranchQrCodeResImplCopyWith<_$VerifyBranchQrCodeResImpl>
      get copyWith => __$$VerifyBranchQrCodeResImplCopyWithImpl<
          _$VerifyBranchQrCodeResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyBranchQrCodeResImplToJson(
      this,
    );
  }
}

abstract class _VerifyBranchQrCodeRes extends VerifyBranchQrCodeRes {
  const factory _VerifyBranchQrCodeRes(
      {required final bool valid,
      required final String? reason}) = _$VerifyBranchQrCodeResImpl;
  const _VerifyBranchQrCodeRes._() : super._();

  factory _VerifyBranchQrCodeRes.fromJson(Map<String, dynamic> json) =
      _$VerifyBranchQrCodeResImpl.fromJson;

  @override
  bool get valid;
  @override
  String? get reason;
  @override
  @JsonKey(ignore: true)
  _$$VerifyBranchQrCodeResImplCopyWith<_$VerifyBranchQrCodeResImpl>
      get copyWith => throw _privateConstructorUsedError;
}
