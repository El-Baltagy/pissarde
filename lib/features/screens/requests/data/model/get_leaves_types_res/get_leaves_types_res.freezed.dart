// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_leaves_types_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetLeavesTypesRes _$GetLeavesTypesResFromJson(Map<String, dynamic> json) {
  return _GetLeavesTypesRes.fromJson(json);
}

/// @nodoc
mixin _$GetLeavesTypesRes {
  List<LeaveTypeItem> get leave_types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetLeavesTypesResCopyWith<GetLeavesTypesRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLeavesTypesResCopyWith<$Res> {
  factory $GetLeavesTypesResCopyWith(
          GetLeavesTypesRes value, $Res Function(GetLeavesTypesRes) then) =
      _$GetLeavesTypesResCopyWithImpl<$Res, GetLeavesTypesRes>;
  @useResult
  $Res call({List<LeaveTypeItem> leave_types});
}

/// @nodoc
class _$GetLeavesTypesResCopyWithImpl<$Res, $Val extends GetLeavesTypesRes>
    implements $GetLeavesTypesResCopyWith<$Res> {
  _$GetLeavesTypesResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leave_types = null,
  }) {
    return _then(_value.copyWith(
      leave_types: null == leave_types
          ? _value.leave_types
          : leave_types // ignore: cast_nullable_to_non_nullable
              as List<LeaveTypeItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetLeavesTypesResImplCopyWith<$Res>
    implements $GetLeavesTypesResCopyWith<$Res> {
  factory _$$GetLeavesTypesResImplCopyWith(_$GetLeavesTypesResImpl value,
          $Res Function(_$GetLeavesTypesResImpl) then) =
      __$$GetLeavesTypesResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LeaveTypeItem> leave_types});
}

/// @nodoc
class __$$GetLeavesTypesResImplCopyWithImpl<$Res>
    extends _$GetLeavesTypesResCopyWithImpl<$Res, _$GetLeavesTypesResImpl>
    implements _$$GetLeavesTypesResImplCopyWith<$Res> {
  __$$GetLeavesTypesResImplCopyWithImpl(_$GetLeavesTypesResImpl _value,
      $Res Function(_$GetLeavesTypesResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leave_types = null,
  }) {
    return _then(_$GetLeavesTypesResImpl(
      leave_types: null == leave_types
          ? _value._leave_types
          : leave_types // ignore: cast_nullable_to_non_nullable
              as List<LeaveTypeItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GetLeavesTypesResImpl extends _GetLeavesTypesRes {
  const _$GetLeavesTypesResImpl(
      {required final List<LeaveTypeItem> leave_types})
      : _leave_types = leave_types,
        super._();

  factory _$GetLeavesTypesResImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetLeavesTypesResImplFromJson(json);

  final List<LeaveTypeItem> _leave_types;
  @override
  List<LeaveTypeItem> get leave_types {
    if (_leave_types is EqualUnmodifiableListView) return _leave_types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leave_types);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLeavesTypesResImplCopyWith<_$GetLeavesTypesResImpl> get copyWith =>
      __$$GetLeavesTypesResImplCopyWithImpl<_$GetLeavesTypesResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetLeavesTypesResImplToJson(
      this,
    );
  }
}

abstract class _GetLeavesTypesRes extends GetLeavesTypesRes {
  const factory _GetLeavesTypesRes(
          {required final List<LeaveTypeItem> leave_types}) =
      _$GetLeavesTypesResImpl;
  const _GetLeavesTypesRes._() : super._();

  factory _GetLeavesTypesRes.fromJson(Map<String, dynamic> json) =
      _$GetLeavesTypesResImpl.fromJson;

  @override
  List<LeaveTypeItem> get leave_types;
  @override
  @JsonKey(ignore: true)
  _$$GetLeavesTypesResImplCopyWith<_$GetLeavesTypesResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeaveTypeItem _$LeaveTypeItemFromJson(Map<String, dynamic> json) {
  return _LeaveTypeItem.fromJson(json);
}

/// @nodoc
mixin _$LeaveTypeItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  int get default_days_per_year => throw _privateConstructorUsedError;
  bool get requires_attachment => throw _privateConstructorUsedError;
  bool get is_paid => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveTypeItemCopyWith<LeaveTypeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveTypeItemCopyWith<$Res> {
  factory $LeaveTypeItemCopyWith(
          LeaveTypeItem value, $Res Function(LeaveTypeItem) then) =
      _$LeaveTypeItemCopyWithImpl<$Res, LeaveTypeItem>;
  @useResult
  $Res call(
      {int id,
      String name,
      String code,
      int default_days_per_year,
      bool requires_attachment,
      bool is_paid,
      bool is_active,
      String description,
      String created_at,
      String updated_at});
}

/// @nodoc
class _$LeaveTypeItemCopyWithImpl<$Res, $Val extends LeaveTypeItem>
    implements $LeaveTypeItemCopyWith<$Res> {
  _$LeaveTypeItemCopyWithImpl(this._value, this._then);

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
    Object? default_days_per_year = null,
    Object? requires_attachment = null,
    Object? is_paid = null,
    Object? is_active = null,
    Object? description = null,
    Object? created_at = null,
    Object? updated_at = null,
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
      default_days_per_year: null == default_days_per_year
          ? _value.default_days_per_year
          : default_days_per_year // ignore: cast_nullable_to_non_nullable
              as int,
      requires_attachment: null == requires_attachment
          ? _value.requires_attachment
          : requires_attachment // ignore: cast_nullable_to_non_nullable
              as bool,
      is_paid: null == is_paid
          ? _value.is_paid
          : is_paid // ignore: cast_nullable_to_non_nullable
              as bool,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveTypeItemImplCopyWith<$Res>
    implements $LeaveTypeItemCopyWith<$Res> {
  factory _$$LeaveTypeItemImplCopyWith(
          _$LeaveTypeItemImpl value, $Res Function(_$LeaveTypeItemImpl) then) =
      __$$LeaveTypeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String code,
      int default_days_per_year,
      bool requires_attachment,
      bool is_paid,
      bool is_active,
      String description,
      String created_at,
      String updated_at});
}

/// @nodoc
class __$$LeaveTypeItemImplCopyWithImpl<$Res>
    extends _$LeaveTypeItemCopyWithImpl<$Res, _$LeaveTypeItemImpl>
    implements _$$LeaveTypeItemImplCopyWith<$Res> {
  __$$LeaveTypeItemImplCopyWithImpl(
      _$LeaveTypeItemImpl _value, $Res Function(_$LeaveTypeItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? default_days_per_year = null,
    Object? requires_attachment = null,
    Object? is_paid = null,
    Object? is_active = null,
    Object? description = null,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(_$LeaveTypeItemImpl(
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
      default_days_per_year: null == default_days_per_year
          ? _value.default_days_per_year
          : default_days_per_year // ignore: cast_nullable_to_non_nullable
              as int,
      requires_attachment: null == requires_attachment
          ? _value.requires_attachment
          : requires_attachment // ignore: cast_nullable_to_non_nullable
              as bool,
      is_paid: null == is_paid
          ? _value.is_paid
          : is_paid // ignore: cast_nullable_to_non_nullable
              as bool,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LeaveTypeItemImpl extends _LeaveTypeItem {
  const _$LeaveTypeItemImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.default_days_per_year,
      required this.requires_attachment,
      required this.is_paid,
      required this.is_active,
      required this.description,
      required this.created_at,
      required this.updated_at})
      : super._();

  factory _$LeaveTypeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveTypeItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String code;
  @override
  final int default_days_per_year;
  @override
  final bool requires_attachment;
  @override
  final bool is_paid;
  @override
  final bool is_active;
  @override
  final String description;
  @override
  final String created_at;
  @override
  final String updated_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveTypeItemImplCopyWith<_$LeaveTypeItemImpl> get copyWith =>
      __$$LeaveTypeItemImplCopyWithImpl<_$LeaveTypeItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveTypeItemImplToJson(
      this,
    );
  }
}

abstract class _LeaveTypeItem extends LeaveTypeItem {
  const factory _LeaveTypeItem(
      {required final int id,
      required final String name,
      required final String code,
      required final int default_days_per_year,
      required final bool requires_attachment,
      required final bool is_paid,
      required final bool is_active,
      required final String description,
      required final String created_at,
      required final String updated_at}) = _$LeaveTypeItemImpl;
  const _LeaveTypeItem._() : super._();

  factory _LeaveTypeItem.fromJson(Map<String, dynamic> json) =
      _$LeaveTypeItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;
  @override
  int get default_days_per_year;
  @override
  bool get requires_attachment;
  @override
  bool get is_paid;
  @override
  bool get is_active;
  @override
  String get description;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  @JsonKey(ignore: true)
  _$$LeaveTypeItemImplCopyWith<_$LeaveTypeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
