// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_leaves_balance_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetLeavesBalanceRes _$GetLeavesBalanceResFromJson(Map<String, dynamic> json) {
  return _GetLeavesBalanceRes.fromJson(json);
}

/// @nodoc
mixin _$GetLeavesBalanceRes {
  int get year => throw _privateConstructorUsedError;
  List<BalanceItem> get balances => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetLeavesBalanceResCopyWith<GetLeavesBalanceRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLeavesBalanceResCopyWith<$Res> {
  factory $GetLeavesBalanceResCopyWith(
          GetLeavesBalanceRes value, $Res Function(GetLeavesBalanceRes) then) =
      _$GetLeavesBalanceResCopyWithImpl<$Res, GetLeavesBalanceRes>;
  @useResult
  $Res call({int year, List<BalanceItem> balances});
}

/// @nodoc
class _$GetLeavesBalanceResCopyWithImpl<$Res, $Val extends GetLeavesBalanceRes>
    implements $GetLeavesBalanceResCopyWith<$Res> {
  _$GetLeavesBalanceResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? balances = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      balances: null == balances
          ? _value.balances
          : balances // ignore: cast_nullable_to_non_nullable
              as List<BalanceItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetLeavesBalanceResImplCopyWith<$Res>
    implements $GetLeavesBalanceResCopyWith<$Res> {
  factory _$$GetLeavesBalanceResImplCopyWith(_$GetLeavesBalanceResImpl value,
          $Res Function(_$GetLeavesBalanceResImpl) then) =
      __$$GetLeavesBalanceResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, List<BalanceItem> balances});
}

/// @nodoc
class __$$GetLeavesBalanceResImplCopyWithImpl<$Res>
    extends _$GetLeavesBalanceResCopyWithImpl<$Res, _$GetLeavesBalanceResImpl>
    implements _$$GetLeavesBalanceResImplCopyWith<$Res> {
  __$$GetLeavesBalanceResImplCopyWithImpl(_$GetLeavesBalanceResImpl _value,
      $Res Function(_$GetLeavesBalanceResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? balances = null,
  }) {
    return _then(_$GetLeavesBalanceResImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      balances: null == balances
          ? _value._balances
          : balances // ignore: cast_nullable_to_non_nullable
              as List<BalanceItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GetLeavesBalanceResImpl extends _GetLeavesBalanceRes {
  const _$GetLeavesBalanceResImpl(
      {required this.year, required final List<BalanceItem> balances})
      : _balances = balances,
        super._();

  factory _$GetLeavesBalanceResImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetLeavesBalanceResImplFromJson(json);

  @override
  final int year;
  final List<BalanceItem> _balances;
  @override
  List<BalanceItem> get balances {
    if (_balances is EqualUnmodifiableListView) return _balances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_balances);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLeavesBalanceResImplCopyWith<_$GetLeavesBalanceResImpl> get copyWith =>
      __$$GetLeavesBalanceResImplCopyWithImpl<_$GetLeavesBalanceResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetLeavesBalanceResImplToJson(
      this,
    );
  }
}

abstract class _GetLeavesBalanceRes extends GetLeavesBalanceRes {
  const factory _GetLeavesBalanceRes(
      {required final int year,
      required final List<BalanceItem> balances}) = _$GetLeavesBalanceResImpl;
  const _GetLeavesBalanceRes._() : super._();

  factory _GetLeavesBalanceRes.fromJson(Map<String, dynamic> json) =
      _$GetLeavesBalanceResImpl.fromJson;

  @override
  int get year;
  @override
  List<BalanceItem> get balances;
  @override
  @JsonKey(ignore: true)
  _$$GetLeavesBalanceResImplCopyWith<_$GetLeavesBalanceResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BalanceItem _$BalanceItemFromJson(Map<String, dynamic> json) {
  return _BalanceItem.fromJson(json);
}

/// @nodoc
mixin _$BalanceItem {
  int get id => throw _privateConstructorUsedError;
  int get user_id => throw _privateConstructorUsedError;
  int get leave_type_id => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get allocated_days => throw _privateConstructorUsedError;
  int get used_days => throw _privateConstructorUsedError;
  int get pending_days => throw _privateConstructorUsedError;
  int get remaining_days => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;
  LeaveTypeItem get leave_type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceItemCopyWith<BalanceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceItemCopyWith<$Res> {
  factory $BalanceItemCopyWith(
          BalanceItem value, $Res Function(BalanceItem) then) =
      _$BalanceItemCopyWithImpl<$Res, BalanceItem>;
  @useResult
  $Res call(
      {int id,
      int user_id,
      int leave_type_id,
      int year,
      int allocated_days,
      int used_days,
      int pending_days,
      int remaining_days,
      String created_at,
      String updated_at,
      LeaveTypeItem leave_type});

  $LeaveTypeItemCopyWith<$Res> get leave_type;
}

/// @nodoc
class _$BalanceItemCopyWithImpl<$Res, $Val extends BalanceItem>
    implements $BalanceItemCopyWith<$Res> {
  _$BalanceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = null,
    Object? leave_type_id = null,
    Object? year = null,
    Object? allocated_days = null,
    Object? used_days = null,
    Object? pending_days = null,
    Object? remaining_days = null,
    Object? created_at = null,
    Object? updated_at = null,
    Object? leave_type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      leave_type_id: null == leave_type_id
          ? _value.leave_type_id
          : leave_type_id // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      allocated_days: null == allocated_days
          ? _value.allocated_days
          : allocated_days // ignore: cast_nullable_to_non_nullable
              as int,
      used_days: null == used_days
          ? _value.used_days
          : used_days // ignore: cast_nullable_to_non_nullable
              as int,
      pending_days: null == pending_days
          ? _value.pending_days
          : pending_days // ignore: cast_nullable_to_non_nullable
              as int,
      remaining_days: null == remaining_days
          ? _value.remaining_days
          : remaining_days // ignore: cast_nullable_to_non_nullable
              as int,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      leave_type: null == leave_type
          ? _value.leave_type
          : leave_type // ignore: cast_nullable_to_non_nullable
              as LeaveTypeItem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeaveTypeItemCopyWith<$Res> get leave_type {
    return $LeaveTypeItemCopyWith<$Res>(_value.leave_type, (value) {
      return _then(_value.copyWith(leave_type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BalanceItemImplCopyWith<$Res>
    implements $BalanceItemCopyWith<$Res> {
  factory _$$BalanceItemImplCopyWith(
          _$BalanceItemImpl value, $Res Function(_$BalanceItemImpl) then) =
      __$$BalanceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int user_id,
      int leave_type_id,
      int year,
      int allocated_days,
      int used_days,
      int pending_days,
      int remaining_days,
      String created_at,
      String updated_at,
      LeaveTypeItem leave_type});

  @override
  $LeaveTypeItemCopyWith<$Res> get leave_type;
}

/// @nodoc
class __$$BalanceItemImplCopyWithImpl<$Res>
    extends _$BalanceItemCopyWithImpl<$Res, _$BalanceItemImpl>
    implements _$$BalanceItemImplCopyWith<$Res> {
  __$$BalanceItemImplCopyWithImpl(
      _$BalanceItemImpl _value, $Res Function(_$BalanceItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = null,
    Object? leave_type_id = null,
    Object? year = null,
    Object? allocated_days = null,
    Object? used_days = null,
    Object? pending_days = null,
    Object? remaining_days = null,
    Object? created_at = null,
    Object? updated_at = null,
    Object? leave_type = null,
  }) {
    return _then(_$BalanceItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      leave_type_id: null == leave_type_id
          ? _value.leave_type_id
          : leave_type_id // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      allocated_days: null == allocated_days
          ? _value.allocated_days
          : allocated_days // ignore: cast_nullable_to_non_nullable
              as int,
      used_days: null == used_days
          ? _value.used_days
          : used_days // ignore: cast_nullable_to_non_nullable
              as int,
      pending_days: null == pending_days
          ? _value.pending_days
          : pending_days // ignore: cast_nullable_to_non_nullable
              as int,
      remaining_days: null == remaining_days
          ? _value.remaining_days
          : remaining_days // ignore: cast_nullable_to_non_nullable
              as int,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      leave_type: null == leave_type
          ? _value.leave_type
          : leave_type // ignore: cast_nullable_to_non_nullable
              as LeaveTypeItem,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BalanceItemImpl extends _BalanceItem {
  const _$BalanceItemImpl(
      {required this.id,
      required this.user_id,
      required this.leave_type_id,
      required this.year,
      required this.allocated_days,
      required this.used_days,
      required this.pending_days,
      required this.remaining_days,
      required this.created_at,
      required this.updated_at,
      required this.leave_type})
      : super._();

  factory _$BalanceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceItemImplFromJson(json);

  @override
  final int id;
  @override
  final int user_id;
  @override
  final int leave_type_id;
  @override
  final int year;
  @override
  final int allocated_days;
  @override
  final int used_days;
  @override
  final int pending_days;
  @override
  final int remaining_days;
  @override
  final String created_at;
  @override
  final String updated_at;
  @override
  final LeaveTypeItem leave_type;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceItemImplCopyWith<_$BalanceItemImpl> get copyWith =>
      __$$BalanceItemImplCopyWithImpl<_$BalanceItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceItemImplToJson(
      this,
    );
  }
}

abstract class _BalanceItem extends BalanceItem {
  const factory _BalanceItem(
      {required final int id,
      required final int user_id,
      required final int leave_type_id,
      required final int year,
      required final int allocated_days,
      required final int used_days,
      required final int pending_days,
      required final int remaining_days,
      required final String created_at,
      required final String updated_at,
      required final LeaveTypeItem leave_type}) = _$BalanceItemImpl;
  const _BalanceItem._() : super._();

  factory _BalanceItem.fromJson(Map<String, dynamic> json) =
      _$BalanceItemImpl.fromJson;

  @override
  int get id;
  @override
  int get user_id;
  @override
  int get leave_type_id;
  @override
  int get year;
  @override
  int get allocated_days;
  @override
  int get used_days;
  @override
  int get pending_days;
  @override
  int get remaining_days;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  LeaveTypeItem get leave_type;
  @override
  @JsonKey(ignore: true)
  _$$BalanceItemImplCopyWith<_$BalanceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
