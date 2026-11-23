// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_branch_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateBranchRes _$CreateBranchResFromJson(Map<String, dynamic> json) {
  return _CreateBranchRes.fromJson(json);
}

/// @nodoc
mixin _$CreateBranchRes {
  String get message => throw _privateConstructorUsedError;
  Branch get branch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateBranchResCopyWith<CreateBranchRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBranchResCopyWith<$Res> {
  factory $CreateBranchResCopyWith(
          CreateBranchRes value, $Res Function(CreateBranchRes) then) =
      _$CreateBranchResCopyWithImpl<$Res, CreateBranchRes>;
  @useResult
  $Res call({String message, Branch branch});

  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class _$CreateBranchResCopyWithImpl<$Res, $Val extends CreateBranchRes>
    implements $CreateBranchResCopyWith<$Res> {
  _$CreateBranchResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? branch = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
    ) as $Val);
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
abstract class _$$CreateBranchResImplCopyWith<$Res>
    implements $CreateBranchResCopyWith<$Res> {
  factory _$$CreateBranchResImplCopyWith(_$CreateBranchResImpl value,
          $Res Function(_$CreateBranchResImpl) then) =
      __$$CreateBranchResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Branch branch});

  @override
  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class __$$CreateBranchResImplCopyWithImpl<$Res>
    extends _$CreateBranchResCopyWithImpl<$Res, _$CreateBranchResImpl>
    implements _$$CreateBranchResImplCopyWith<$Res> {
  __$$CreateBranchResImplCopyWithImpl(
      _$CreateBranchResImpl _value, $Res Function(_$CreateBranchResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? branch = null,
  }) {
    return _then(_$CreateBranchResImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CreateBranchResImpl extends _CreateBranchRes {
  const _$CreateBranchResImpl({required this.message, required this.branch})
      : super._();

  factory _$CreateBranchResImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateBranchResImplFromJson(json);

  @override
  final String message;
  @override
  final Branch branch;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBranchResImplCopyWith<_$CreateBranchResImpl> get copyWith =>
      __$$CreateBranchResImplCopyWithImpl<_$CreateBranchResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBranchResImplToJson(
      this,
    );
  }
}

abstract class _CreateBranchRes extends CreateBranchRes {
  const factory _CreateBranchRes(
      {required final String message,
      required final Branch branch}) = _$CreateBranchResImpl;
  const _CreateBranchRes._() : super._();

  factory _CreateBranchRes.fromJson(Map<String, dynamic> json) =
      _$CreateBranchResImpl.fromJson;

  @override
  String get message;
  @override
  Branch get branch;
  @override
  @JsonKey(ignore: true)
  _$$CreateBranchResImplCopyWith<_$CreateBranchResImpl> get copyWith =>
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
  String get address => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  int get geofence_radius_meters => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchCopyWith<Branch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCopyWith<$Res> {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) then) =
      _$BranchCopyWithImpl<$Res, Branch>;
  @useResult
  $Res call(
      {int id,
      String name,
      String code,
      String address,
      double latitude,
      double longitude,
      int geofence_radius_meters,
      bool is_active,
      String created_at});
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
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? geofence_radius_meters = null,
    Object? is_active = null,
    Object? created_at = null,
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
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
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
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {int id,
      String name,
      String code,
      String address,
      double latitude,
      double longitude,
      int geofence_radius_meters,
      bool is_active,
      String created_at});
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
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? geofence_radius_meters = null,
    Object? is_active = null,
    Object? created_at = null,
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
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
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
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BranchImpl extends _Branch {
  const _$BranchImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.geofence_radius_meters,
      required this.is_active,
      required this.created_at})
      : super._();

  factory _$BranchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String code;
  @override
  final String address;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int geofence_radius_meters;
  @override
  final bool is_active;
  @override
  final String created_at;

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
      required final String code,
      required final String address,
      required final double latitude,
      required final double longitude,
      required final int geofence_radius_meters,
      required final bool is_active,
      required final String created_at}) = _$BranchImpl;
  const _Branch._() : super._();

  factory _Branch.fromJson(Map<String, dynamic> json) = _$BranchImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;
  @override
  String get address;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  int get geofence_radius_meters;
  @override
  bool get is_active;
  @override
  String get created_at;
  @override
  @JsonKey(ignore: true)
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
