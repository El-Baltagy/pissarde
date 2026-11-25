// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rotate_branch_qr_code_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RotateBranchQrCodeRes _$RotateBranchQrCodeResFromJson(
    Map<String, dynamic> json) {
  return _RotateBranchQrCodeRes.fromJson(json);
}

/// @nodoc
mixin _$RotateBranchQrCodeRes {
  String get message => throw _privateConstructorUsedError;
  Qrdata get qr_data => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RotateBranchQrCodeResCopyWith<RotateBranchQrCodeRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RotateBranchQrCodeResCopyWith<$Res> {
  factory $RotateBranchQrCodeResCopyWith(RotateBranchQrCodeRes value,
          $Res Function(RotateBranchQrCodeRes) then) =
      _$RotateBranchQrCodeResCopyWithImpl<$Res, RotateBranchQrCodeRes>;
  @useResult
  $Res call({String message, Qrdata qr_data, bool success});

  $QrdataCopyWith<$Res> get qr_data;
}

/// @nodoc
class _$RotateBranchQrCodeResCopyWithImpl<$Res,
        $Val extends RotateBranchQrCodeRes>
    implements $RotateBranchQrCodeResCopyWith<$Res> {
  _$RotateBranchQrCodeResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? qr_data = null,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      qr_data: null == qr_data
          ? _value.qr_data
          : qr_data // ignore: cast_nullable_to_non_nullable
              as Qrdata,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QrdataCopyWith<$Res> get qr_data {
    return $QrdataCopyWith<$Res>(_value.qr_data, (value) {
      return _then(_value.copyWith(qr_data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RotateBranchQrCodeResImplCopyWith<$Res>
    implements $RotateBranchQrCodeResCopyWith<$Res> {
  factory _$$RotateBranchQrCodeResImplCopyWith(
          _$RotateBranchQrCodeResImpl value,
          $Res Function(_$RotateBranchQrCodeResImpl) then) =
      __$$RotateBranchQrCodeResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Qrdata qr_data, bool success});

  @override
  $QrdataCopyWith<$Res> get qr_data;
}

/// @nodoc
class __$$RotateBranchQrCodeResImplCopyWithImpl<$Res>
    extends _$RotateBranchQrCodeResCopyWithImpl<$Res,
        _$RotateBranchQrCodeResImpl>
    implements _$$RotateBranchQrCodeResImplCopyWith<$Res> {
  __$$RotateBranchQrCodeResImplCopyWithImpl(_$RotateBranchQrCodeResImpl _value,
      $Res Function(_$RotateBranchQrCodeResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? qr_data = null,
    Object? success = null,
  }) {
    return _then(_$RotateBranchQrCodeResImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      qr_data: null == qr_data
          ? _value.qr_data
          : qr_data // ignore: cast_nullable_to_non_nullable
              as Qrdata,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RotateBranchQrCodeResImpl extends _RotateBranchQrCodeRes {
  const _$RotateBranchQrCodeResImpl(
      {required this.message, required this.qr_data, required this.success})
      : super._();

  factory _$RotateBranchQrCodeResImpl.fromJson(Map<String, dynamic> json) =>
      _$$RotateBranchQrCodeResImplFromJson(json);

  @override
  final String message;
  @override
  final Qrdata qr_data;
  @override
  final bool success;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RotateBranchQrCodeResImplCopyWith<_$RotateBranchQrCodeResImpl>
      get copyWith => __$$RotateBranchQrCodeResImplCopyWithImpl<
          _$RotateBranchQrCodeResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RotateBranchQrCodeResImplToJson(
      this,
    );
  }
}

abstract class _RotateBranchQrCodeRes extends RotateBranchQrCodeRes {
  const factory _RotateBranchQrCodeRes(
      {required final String message,
      required final Qrdata qr_data,
      required final bool success}) = _$RotateBranchQrCodeResImpl;
  const _RotateBranchQrCodeRes._() : super._();

  factory _RotateBranchQrCodeRes.fromJson(Map<String, dynamic> json) =
      _$RotateBranchQrCodeResImpl.fromJson;

  @override
  String get message;
  @override
  Qrdata get qr_data;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$RotateBranchQrCodeResImplCopyWith<_$RotateBranchQrCodeResImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Qrdata _$QrdataFromJson(Map<String, dynamic> json) {
  return _Qrdata.fromJson(json);
}

/// @nodoc
mixin _$Qrdata {
  int get branch_id => throw _privateConstructorUsedError;
  String get branch_name => throw _privateConstructorUsedError;
  String get branch_code => throw _privateConstructorUsedError;
  String get qr_token => throw _privateConstructorUsedError;
  String get payload => throw _privateConstructorUsedError;
  String get qr_generated_at => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  int get geofence_radius_meters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QrdataCopyWith<Qrdata> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrdataCopyWith<$Res> {
  factory $QrdataCopyWith(Qrdata value, $Res Function(Qrdata) then) =
      _$QrdataCopyWithImpl<$Res, Qrdata>;
  @useResult
  $Res call(
      {int branch_id,
      String branch_name,
      String branch_code,
      String qr_token,
      String payload,
      String qr_generated_at,
      double latitude,
      double longitude,
      int geofence_radius_meters});
}

/// @nodoc
class _$QrdataCopyWithImpl<$Res, $Val extends Qrdata>
    implements $QrdataCopyWith<$Res> {
  _$QrdataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branch_id = null,
    Object? branch_name = null,
    Object? branch_code = null,
    Object? qr_token = null,
    Object? payload = null,
    Object? qr_generated_at = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? geofence_radius_meters = null,
  }) {
    return _then(_value.copyWith(
      branch_id: null == branch_id
          ? _value.branch_id
          : branch_id // ignore: cast_nullable_to_non_nullable
              as int,
      branch_name: null == branch_name
          ? _value.branch_name
          : branch_name // ignore: cast_nullable_to_non_nullable
              as String,
      branch_code: null == branch_code
          ? _value.branch_code
          : branch_code // ignore: cast_nullable_to_non_nullable
              as String,
      qr_token: null == qr_token
          ? _value.qr_token
          : qr_token // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      qr_generated_at: null == qr_generated_at
          ? _value.qr_generated_at
          : qr_generated_at // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      geofence_radius_meters: null == geofence_radius_meters
          ? _value.geofence_radius_meters
          : geofence_radius_meters // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrdataImplCopyWith<$Res> implements $QrdataCopyWith<$Res> {
  factory _$$QrdataImplCopyWith(
          _$QrdataImpl value, $Res Function(_$QrdataImpl) then) =
      __$$QrdataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int branch_id,
      String branch_name,
      String branch_code,
      String qr_token,
      String payload,
      String qr_generated_at,
      double latitude,
      double longitude,
      int geofence_radius_meters});
}

/// @nodoc
class __$$QrdataImplCopyWithImpl<$Res>
    extends _$QrdataCopyWithImpl<$Res, _$QrdataImpl>
    implements _$$QrdataImplCopyWith<$Res> {
  __$$QrdataImplCopyWithImpl(
      _$QrdataImpl _value, $Res Function(_$QrdataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branch_id = null,
    Object? branch_name = null,
    Object? branch_code = null,
    Object? qr_token = null,
    Object? payload = null,
    Object? qr_generated_at = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? geofence_radius_meters = null,
  }) {
    return _then(_$QrdataImpl(
      branch_id: null == branch_id
          ? _value.branch_id
          : branch_id // ignore: cast_nullable_to_non_nullable
              as int,
      branch_name: null == branch_name
          ? _value.branch_name
          : branch_name // ignore: cast_nullable_to_non_nullable
              as String,
      branch_code: null == branch_code
          ? _value.branch_code
          : branch_code // ignore: cast_nullable_to_non_nullable
              as String,
      qr_token: null == qr_token
          ? _value.qr_token
          : qr_token // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      qr_generated_at: null == qr_generated_at
          ? _value.qr_generated_at
          : qr_generated_at // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      geofence_radius_meters: null == geofence_radius_meters
          ? _value.geofence_radius_meters
          : geofence_radius_meters // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$QrdataImpl extends _Qrdata {
  const _$QrdataImpl(
      {required this.branch_id,
      required this.branch_name,
      required this.branch_code,
      required this.qr_token,
      required this.payload,
      required this.qr_generated_at,
      required this.latitude,
      required this.longitude,
      required this.geofence_radius_meters})
      : super._();

  factory _$QrdataImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrdataImplFromJson(json);

  @override
  final int branch_id;
  @override
  final String branch_name;
  @override
  final String branch_code;
  @override
  final String qr_token;
  @override
  final String payload;
  @override
  final String qr_generated_at;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int geofence_radius_meters;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QrdataImplCopyWith<_$QrdataImpl> get copyWith =>
      __$$QrdataImplCopyWithImpl<_$QrdataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrdataImplToJson(
      this,
    );
  }
}

abstract class _Qrdata extends Qrdata {
  const factory _Qrdata(
      {required final int branch_id,
      required final String branch_name,
      required final String branch_code,
      required final String qr_token,
      required final String payload,
      required final String qr_generated_at,
      required final double latitude,
      required final double longitude,
      required final int geofence_radius_meters}) = _$QrdataImpl;
  const _Qrdata._() : super._();

  factory _Qrdata.fromJson(Map<String, dynamic> json) = _$QrdataImpl.fromJson;

  @override
  int get branch_id;
  @override
  String get branch_name;
  @override
  String get branch_code;
  @override
  String get qr_token;
  @override
  String get payload;
  @override
  String get qr_generated_at;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  int get geofence_radius_meters;
  @override
  @JsonKey(ignore: true)
  _$$QrdataImplCopyWith<_$QrdataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
