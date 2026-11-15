// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branches_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BranchesList _$BranchesListFromJson(Map<String, dynamic> json) {
  return _BranchesList.fromJson(json);
}

/// @nodoc
mixin _$BranchesList {
  List<DataItem> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchesListCopyWith<BranchesList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchesListCopyWith<$Res> {
  factory $BranchesListCopyWith(
          BranchesList value, $Res Function(BranchesList) then) =
      _$BranchesListCopyWithImpl<$Res, BranchesList>;
  @useResult
  $Res call({List<DataItem> data});
}

/// @nodoc
class _$BranchesListCopyWithImpl<$Res, $Val extends BranchesList>
    implements $BranchesListCopyWith<$Res> {
  _$BranchesListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchesListImplCopyWith<$Res>
    implements $BranchesListCopyWith<$Res> {
  factory _$$BranchesListImplCopyWith(
          _$BranchesListImpl value, $Res Function(_$BranchesListImpl) then) =
      __$$BranchesListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DataItem> data});
}

/// @nodoc
class __$$BranchesListImplCopyWithImpl<$Res>
    extends _$BranchesListCopyWithImpl<$Res, _$BranchesListImpl>
    implements _$$BranchesListImplCopyWith<$Res> {
  __$$BranchesListImplCopyWithImpl(
      _$BranchesListImpl _value, $Res Function(_$BranchesListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$BranchesListImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BranchesListImpl extends _BranchesList {
  const _$BranchesListImpl({required final List<DataItem> data})
      : _data = data,
        super._();

  factory _$BranchesListImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchesListImplFromJson(json);

  final List<DataItem> _data;
  @override
  List<DataItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchesListImplCopyWith<_$BranchesListImpl> get copyWith =>
      __$$BranchesListImplCopyWithImpl<_$BranchesListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchesListImplToJson(
      this,
    );
  }
}

abstract class _BranchesList extends BranchesList {
  const factory _BranchesList({required final List<DataItem> data}) =
      _$BranchesListImpl;
  const _BranchesList._() : super._();

  factory _BranchesList.fromJson(Map<String, dynamic> json) =
      _$BranchesListImpl.fromJson;

  @override
  List<DataItem> get data;
  @override
  @JsonKey(ignore: true)
  _$$BranchesListImplCopyWith<_$BranchesListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataItem _$DataItemFromJson(Map<String, dynamic> json) {
  return _DataItem.fromJson(json);
}

/// @nodoc
mixin _$DataItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  int get geofence_radius_meters => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  int get employees_count => throw _privateConstructorUsedError;
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
      String name,
      String code,
      String address,
      double latitude,
      double longitude,
      int geofence_radius_meters,
      bool is_active,
      int employees_count,
      String created_at});
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
    Object? name = null,
    Object? code = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? geofence_radius_meters = null,
    Object? is_active = null,
    Object? employees_count = null,
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
      employees_count: null == employees_count
          ? _value.employees_count
          : employees_count // ignore: cast_nullable_to_non_nullable
              as int,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
      String name,
      String code,
      String address,
      double latitude,
      double longitude,
      int geofence_radius_meters,
      bool is_active,
      int employees_count,
      String created_at});
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
    Object? name = null,
    Object? code = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? geofence_radius_meters = null,
    Object? is_active = null,
    Object? employees_count = null,
    Object? created_at = null,
  }) {
    return _then(_$DataItemImpl(
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
      employees_count: null == employees_count
          ? _value.employees_count
          : employees_count // ignore: cast_nullable_to_non_nullable
              as int,
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
      required this.name,
      required this.code,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.geofence_radius_meters,
      required this.is_active,
      required this.employees_count,
      required this.created_at})
      : super._();

  factory _$DataItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataItemImplFromJson(json);

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
  final int employees_count;
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
      required final String name,
      required final String code,
      required final String address,
      required final double latitude,
      required final double longitude,
      required final int geofence_radius_meters,
      required final bool is_active,
      required final int employees_count,
      required final String created_at}) = _$DataItemImpl;
  const _DataItem._() : super._();

  factory _DataItem.fromJson(Map<String, dynamic> json) =
      _$DataItemImpl.fromJson;

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
  int get employees_count;
  @override
  String get created_at;
  @override
  @JsonKey(ignore: true)
  _$$DataItemImplCopyWith<_$DataItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
