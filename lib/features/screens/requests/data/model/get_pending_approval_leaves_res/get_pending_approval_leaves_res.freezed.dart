// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_pending_approval_leaves_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetPendingApprovalLeavesRes _$GetPendingApprovalLeavesResFromJson(
    Map<String, dynamic> json) {
  return _GetPendingApprovalLeavesRes.fromJson(json);
}

/// @nodoc
mixin _$GetPendingApprovalLeavesRes {
  int get current_page => throw _privateConstructorUsedError;
  List<PendingApprovalLeavesItem> get data =>
      throw _privateConstructorUsedError;
  int get last_page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetPendingApprovalLeavesResCopyWith<GetPendingApprovalLeavesRes>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPendingApprovalLeavesResCopyWith<$Res> {
  factory $GetPendingApprovalLeavesResCopyWith(
          GetPendingApprovalLeavesRes value,
          $Res Function(GetPendingApprovalLeavesRes) then) =
      _$GetPendingApprovalLeavesResCopyWithImpl<$Res,
          GetPendingApprovalLeavesRes>;
  @useResult
  $Res call(
      {int current_page, List<PendingApprovalLeavesItem> data, int last_page});
}

/// @nodoc
class _$GetPendingApprovalLeavesResCopyWithImpl<$Res,
        $Val extends GetPendingApprovalLeavesRes>
    implements $GetPendingApprovalLeavesResCopyWith<$Res> {
  _$GetPendingApprovalLeavesResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? data = null,
    Object? last_page = null,
  }) {
    return _then(_value.copyWith(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PendingApprovalLeavesItem>,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetPendingApprovalLeavesResImplCopyWith<$Res>
    implements $GetPendingApprovalLeavesResCopyWith<$Res> {
  factory _$$GetPendingApprovalLeavesResImplCopyWith(
          _$GetPendingApprovalLeavesResImpl value,
          $Res Function(_$GetPendingApprovalLeavesResImpl) then) =
      __$$GetPendingApprovalLeavesResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int current_page, List<PendingApprovalLeavesItem> data, int last_page});
}

/// @nodoc
class __$$GetPendingApprovalLeavesResImplCopyWithImpl<$Res>
    extends _$GetPendingApprovalLeavesResCopyWithImpl<$Res,
        _$GetPendingApprovalLeavesResImpl>
    implements _$$GetPendingApprovalLeavesResImplCopyWith<$Res> {
  __$$GetPendingApprovalLeavesResImplCopyWithImpl(
      _$GetPendingApprovalLeavesResImpl _value,
      $Res Function(_$GetPendingApprovalLeavesResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? data = null,
    Object? last_page = null,
  }) {
    return _then(_$GetPendingApprovalLeavesResImpl(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PendingApprovalLeavesItem>,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GetPendingApprovalLeavesResImpl extends _GetPendingApprovalLeavesRes {
  const _$GetPendingApprovalLeavesResImpl(
      {required this.current_page,
      required final List<PendingApprovalLeavesItem> data,
      required this.last_page})
      : _data = data,
        super._();

  factory _$GetPendingApprovalLeavesResImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetPendingApprovalLeavesResImplFromJson(json);

  @override
  final int current_page;
  final List<PendingApprovalLeavesItem> _data;
  @override
  List<PendingApprovalLeavesItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int last_page;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPendingApprovalLeavesResImplCopyWith<_$GetPendingApprovalLeavesResImpl>
      get copyWith => __$$GetPendingApprovalLeavesResImplCopyWithImpl<
          _$GetPendingApprovalLeavesResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPendingApprovalLeavesResImplToJson(
      this,
    );
  }
}

abstract class _GetPendingApprovalLeavesRes
    extends GetPendingApprovalLeavesRes {
  const factory _GetPendingApprovalLeavesRes(
      {required final int current_page,
      required final List<PendingApprovalLeavesItem> data,
      required final int last_page}) = _$GetPendingApprovalLeavesResImpl;
  const _GetPendingApprovalLeavesRes._() : super._();

  factory _GetPendingApprovalLeavesRes.fromJson(Map<String, dynamic> json) =
      _$GetPendingApprovalLeavesResImpl.fromJson;

  @override
  int get current_page;
  @override
  List<PendingApprovalLeavesItem> get data;
  @override
  int get last_page;
  @override
  @JsonKey(ignore: true)
  _$$GetPendingApprovalLeavesResImplCopyWith<_$GetPendingApprovalLeavesResImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PendingApprovalLeavesItem _$PendingApprovalLeavesItemFromJson(
    Map<String, dynamic> json) {
  return _PendingApprovalLeavesItem.fromJson(json);
}

/// @nodoc
mixin _$PendingApprovalLeavesItem {
  int get id => throw _privateConstructorUsedError;
  int get user_id => throw _privateConstructorUsedError;
  int get leave_type_id => throw _privateConstructorUsedError;
  String get start_date => throw _privateConstructorUsedError;
  String get end_date => throw _privateConstructorUsedError;
  int get total_days => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get emergency_phone => throw _privateConstructorUsedError;
  dynamic get attachment_path => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get target_reviewer_role => throw _privateConstructorUsedError;
  dynamic get target_reviewer_id => throw _privateConstructorUsedError;
  dynamic get reviewed_by_id => throw _privateConstructorUsedError;
  dynamic get reviewed_at => throw _privateConstructorUsedError;
  dynamic get review_notes => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  LeaveTypeItem get leave_type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PendingApprovalLeavesItemCopyWith<PendingApprovalLeavesItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingApprovalLeavesItemCopyWith<$Res> {
  factory $PendingApprovalLeavesItemCopyWith(PendingApprovalLeavesItem value,
          $Res Function(PendingApprovalLeavesItem) then) =
      _$PendingApprovalLeavesItemCopyWithImpl<$Res, PendingApprovalLeavesItem>;
  @useResult
  $Res call(
      {int id,
      int user_id,
      int leave_type_id,
      String start_date,
      String end_date,
      int total_days,
      String reason,
      String emergency_phone,
      dynamic attachment_path,
      String status,
      String target_reviewer_role,
      dynamic target_reviewer_id,
      dynamic reviewed_by_id,
      dynamic reviewed_at,
      dynamic review_notes,
      String created_at,
      String updated_at,
      User user,
      LeaveTypeItem leave_type});

  $UserCopyWith<$Res> get user;
  $LeaveTypeItemCopyWith<$Res> get leave_type;
}

/// @nodoc
class _$PendingApprovalLeavesItemCopyWithImpl<$Res,
        $Val extends PendingApprovalLeavesItem>
    implements $PendingApprovalLeavesItemCopyWith<$Res> {
  _$PendingApprovalLeavesItemCopyWithImpl(this._value, this._then);

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
    Object? start_date = null,
    Object? end_date = null,
    Object? total_days = null,
    Object? reason = null,
    Object? emergency_phone = null,
    Object? attachment_path = freezed,
    Object? status = null,
    Object? target_reviewer_role = null,
    Object? target_reviewer_id = freezed,
    Object? reviewed_by_id = freezed,
    Object? reviewed_at = freezed,
    Object? review_notes = freezed,
    Object? created_at = null,
    Object? updated_at = null,
    Object? user = null,
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
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      total_days: null == total_days
          ? _value.total_days
          : total_days // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      emergency_phone: null == emergency_phone
          ? _value.emergency_phone
          : emergency_phone // ignore: cast_nullable_to_non_nullable
              as String,
      attachment_path: freezed == attachment_path
          ? _value.attachment_path
          : attachment_path // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      target_reviewer_role: null == target_reviewer_role
          ? _value.target_reviewer_role
          : target_reviewer_role // ignore: cast_nullable_to_non_nullable
              as String,
      target_reviewer_id: freezed == target_reviewer_id
          ? _value.target_reviewer_id
          : target_reviewer_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reviewed_by_id: freezed == reviewed_by_id
          ? _value.reviewed_by_id
          : reviewed_by_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reviewed_at: freezed == reviewed_at
          ? _value.reviewed_at
          : reviewed_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
      review_notes: freezed == review_notes
          ? _value.review_notes
          : review_notes // ignore: cast_nullable_to_non_nullable
              as dynamic,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      leave_type: null == leave_type
          ? _value.leave_type
          : leave_type // ignore: cast_nullable_to_non_nullable
              as LeaveTypeItem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
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
abstract class _$$PendingApprovalLeavesItemImplCopyWith<$Res>
    implements $PendingApprovalLeavesItemCopyWith<$Res> {
  factory _$$PendingApprovalLeavesItemImplCopyWith(
          _$PendingApprovalLeavesItemImpl value,
          $Res Function(_$PendingApprovalLeavesItemImpl) then) =
      __$$PendingApprovalLeavesItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int user_id,
      int leave_type_id,
      String start_date,
      String end_date,
      int total_days,
      String reason,
      String emergency_phone,
      dynamic attachment_path,
      String status,
      String target_reviewer_role,
      dynamic target_reviewer_id,
      dynamic reviewed_by_id,
      dynamic reviewed_at,
      dynamic review_notes,
      String created_at,
      String updated_at,
      User user,
      LeaveTypeItem leave_type});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $LeaveTypeItemCopyWith<$Res> get leave_type;
}

/// @nodoc
class __$$PendingApprovalLeavesItemImplCopyWithImpl<$Res>
    extends _$PendingApprovalLeavesItemCopyWithImpl<$Res,
        _$PendingApprovalLeavesItemImpl>
    implements _$$PendingApprovalLeavesItemImplCopyWith<$Res> {
  __$$PendingApprovalLeavesItemImplCopyWithImpl(
      _$PendingApprovalLeavesItemImpl _value,
      $Res Function(_$PendingApprovalLeavesItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = null,
    Object? leave_type_id = null,
    Object? start_date = null,
    Object? end_date = null,
    Object? total_days = null,
    Object? reason = null,
    Object? emergency_phone = null,
    Object? attachment_path = freezed,
    Object? status = null,
    Object? target_reviewer_role = null,
    Object? target_reviewer_id = freezed,
    Object? reviewed_by_id = freezed,
    Object? reviewed_at = freezed,
    Object? review_notes = freezed,
    Object? created_at = null,
    Object? updated_at = null,
    Object? user = null,
    Object? leave_type = null,
  }) {
    return _then(_$PendingApprovalLeavesItemImpl(
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
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      total_days: null == total_days
          ? _value.total_days
          : total_days // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      emergency_phone: null == emergency_phone
          ? _value.emergency_phone
          : emergency_phone // ignore: cast_nullable_to_non_nullable
              as String,
      attachment_path: freezed == attachment_path
          ? _value.attachment_path
          : attachment_path // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      target_reviewer_role: null == target_reviewer_role
          ? _value.target_reviewer_role
          : target_reviewer_role // ignore: cast_nullable_to_non_nullable
              as String,
      target_reviewer_id: freezed == target_reviewer_id
          ? _value.target_reviewer_id
          : target_reviewer_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reviewed_by_id: freezed == reviewed_by_id
          ? _value.reviewed_by_id
          : reviewed_by_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reviewed_at: freezed == reviewed_at
          ? _value.reviewed_at
          : reviewed_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
      review_notes: freezed == review_notes
          ? _value.review_notes
          : review_notes // ignore: cast_nullable_to_non_nullable
              as dynamic,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      leave_type: null == leave_type
          ? _value.leave_type
          : leave_type // ignore: cast_nullable_to_non_nullable
              as LeaveTypeItem,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PendingApprovalLeavesItemImpl extends _PendingApprovalLeavesItem {
  const _$PendingApprovalLeavesItemImpl(
      {required this.id,
      required this.user_id,
      required this.leave_type_id,
      required this.start_date,
      required this.end_date,
      required this.total_days,
      required this.reason,
      required this.emergency_phone,
      required this.attachment_path,
      required this.status,
      required this.target_reviewer_role,
      required this.target_reviewer_id,
      required this.reviewed_by_id,
      required this.reviewed_at,
      required this.review_notes,
      required this.created_at,
      required this.updated_at,
      required this.user,
      required this.leave_type})
      : super._();

  factory _$PendingApprovalLeavesItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingApprovalLeavesItemImplFromJson(json);

  @override
  final int id;
  @override
  final int user_id;
  @override
  final int leave_type_id;
  @override
  final String start_date;
  @override
  final String end_date;
  @override
  final int total_days;
  @override
  final String reason;
  @override
  final String emergency_phone;
  @override
  final dynamic attachment_path;
  @override
  final String status;
  @override
  final String target_reviewer_role;
  @override
  final dynamic target_reviewer_id;
  @override
  final dynamic reviewed_by_id;
  @override
  final dynamic reviewed_at;
  @override
  final dynamic review_notes;
  @override
  final String created_at;
  @override
  final String updated_at;
  @override
  final User user;
  @override
  final LeaveTypeItem leave_type;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingApprovalLeavesItemImplCopyWith<_$PendingApprovalLeavesItemImpl>
      get copyWith => __$$PendingApprovalLeavesItemImplCopyWithImpl<
          _$PendingApprovalLeavesItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingApprovalLeavesItemImplToJson(
      this,
    );
  }
}

abstract class _PendingApprovalLeavesItem extends PendingApprovalLeavesItem {
  const factory _PendingApprovalLeavesItem(
          {required final int id,
          required final int user_id,
          required final int leave_type_id,
          required final String start_date,
          required final String end_date,
          required final int total_days,
          required final String reason,
          required final String emergency_phone,
          required final dynamic attachment_path,
          required final String status,
          required final String target_reviewer_role,
          required final dynamic target_reviewer_id,
          required final dynamic reviewed_by_id,
          required final dynamic reviewed_at,
          required final dynamic review_notes,
          required final String created_at,
          required final String updated_at,
          required final User user,
          required final LeaveTypeItem leave_type}) =
      _$PendingApprovalLeavesItemImpl;
  const _PendingApprovalLeavesItem._() : super._();

  factory _PendingApprovalLeavesItem.fromJson(Map<String, dynamic> json) =
      _$PendingApprovalLeavesItemImpl.fromJson;

  @override
  int get id;
  @override
  int get user_id;
  @override
  int get leave_type_id;
  @override
  String get start_date;
  @override
  String get end_date;
  @override
  int get total_days;
  @override
  String get reason;
  @override
  String get emergency_phone;
  @override
  dynamic get attachment_path;
  @override
  String get status;
  @override
  String get target_reviewer_role;
  @override
  dynamic get target_reviewer_id;
  @override
  dynamic get reviewed_by_id;
  @override
  dynamic get reviewed_at;
  @override
  dynamic get review_notes;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  User get user;
  @override
  LeaveTypeItem get leave_type;
  @override
  @JsonKey(ignore: true)
  _$$PendingApprovalLeavesItemImplCopyWith<_$PendingApprovalLeavesItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get employee_code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  dynamic get email_verified_at => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get employee_type => throw _privateConstructorUsedError;
  String get work_type => throw _privateConstructorUsedError;
  int get branch_id => throw _privateConstructorUsedError;
  dynamic get supervisor_id => throw _privateConstructorUsedError;
  int get shift_id => throw _privateConstructorUsedError;
  dynamic get duty_authorized_branch_ids => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  dynamic get avatar_url => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;
  dynamic get deleted_at => throw _privateConstructorUsedError;
  Branch get branch => throw _privateConstructorUsedError;
  Shift get shift => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String employee_code,
      String name,
      String email,
      String phone,
      dynamic email_verified_at,
      String role,
      String employee_type,
      String work_type,
      int branch_id,
      dynamic supervisor_id,
      int shift_id,
      dynamic duty_authorized_branch_ids,
      bool is_active,
      dynamic avatar_url,
      String created_at,
      String updated_at,
      dynamic deleted_at,
      Branch branch,
      Shift shift});

  $BranchCopyWith<$Res> get branch;
  $ShiftCopyWith<$Res> get shift;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employee_code = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? email_verified_at = freezed,
    Object? role = null,
    Object? employee_type = null,
    Object? work_type = null,
    Object? branch_id = null,
    Object? supervisor_id = freezed,
    Object? shift_id = null,
    Object? duty_authorized_branch_ids = freezed,
    Object? is_active = null,
    Object? avatar_url = freezed,
    Object? created_at = null,
    Object? updated_at = null,
    Object? deleted_at = freezed,
    Object? branch = null,
    Object? shift = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      employee_code: null == employee_code
          ? _value.employee_code
          : employee_code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email_verified_at: freezed == email_verified_at
          ? _value.email_verified_at
          : email_verified_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      employee_type: null == employee_type
          ? _value.employee_type
          : employee_type // ignore: cast_nullable_to_non_nullable
              as String,
      work_type: null == work_type
          ? _value.work_type
          : work_type // ignore: cast_nullable_to_non_nullable
              as String,
      branch_id: null == branch_id
          ? _value.branch_id
          : branch_id // ignore: cast_nullable_to_non_nullable
              as int,
      supervisor_id: freezed == supervisor_id
          ? _value.supervisor_id
          : supervisor_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      shift_id: null == shift_id
          ? _value.shift_id
          : shift_id // ignore: cast_nullable_to_non_nullable
              as int,
      duty_authorized_branch_ids: freezed == duty_authorized_branch_ids
          ? _value.duty_authorized_branch_ids
          : duty_authorized_branch_ids // ignore: cast_nullable_to_non_nullable
              as dynamic,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      avatar_url: freezed == avatar_url
          ? _value.avatar_url
          : avatar_url // ignore: cast_nullable_to_non_nullable
              as dynamic,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res> get branch {
    return $BranchCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShiftCopyWith<$Res> get shift {
    return $ShiftCopyWith<$Res>(_value.shift, (value) {
      return _then(_value.copyWith(shift: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String employee_code,
      String name,
      String email,
      String phone,
      dynamic email_verified_at,
      String role,
      String employee_type,
      String work_type,
      int branch_id,
      dynamic supervisor_id,
      int shift_id,
      dynamic duty_authorized_branch_ids,
      bool is_active,
      dynamic avatar_url,
      String created_at,
      String updated_at,
      dynamic deleted_at,
      Branch branch,
      Shift shift});

  @override
  $BranchCopyWith<$Res> get branch;
  @override
  $ShiftCopyWith<$Res> get shift;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employee_code = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? email_verified_at = freezed,
    Object? role = null,
    Object? employee_type = null,
    Object? work_type = null,
    Object? branch_id = null,
    Object? supervisor_id = freezed,
    Object? shift_id = null,
    Object? duty_authorized_branch_ids = freezed,
    Object? is_active = null,
    Object? avatar_url = freezed,
    Object? created_at = null,
    Object? updated_at = null,
    Object? deleted_at = freezed,
    Object? branch = null,
    Object? shift = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      employee_code: null == employee_code
          ? _value.employee_code
          : employee_code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email_verified_at: freezed == email_verified_at
          ? _value.email_verified_at
          : email_verified_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      employee_type: null == employee_type
          ? _value.employee_type
          : employee_type // ignore: cast_nullable_to_non_nullable
              as String,
      work_type: null == work_type
          ? _value.work_type
          : work_type // ignore: cast_nullable_to_non_nullable
              as String,
      branch_id: null == branch_id
          ? _value.branch_id
          : branch_id // ignore: cast_nullable_to_non_nullable
              as int,
      supervisor_id: freezed == supervisor_id
          ? _value.supervisor_id
          : supervisor_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      shift_id: null == shift_id
          ? _value.shift_id
          : shift_id // ignore: cast_nullable_to_non_nullable
              as int,
      duty_authorized_branch_ids: freezed == duty_authorized_branch_ids
          ? _value.duty_authorized_branch_ids
          : duty_authorized_branch_ids // ignore: cast_nullable_to_non_nullable
              as dynamic,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      avatar_url: freezed == avatar_url
          ? _value.avatar_url
          : avatar_url // ignore: cast_nullable_to_non_nullable
              as dynamic,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.id,
      required this.employee_code,
      required this.name,
      required this.email,
      required this.phone,
      required this.email_verified_at,
      required this.role,
      required this.employee_type,
      required this.work_type,
      required this.branch_id,
      required this.supervisor_id,
      required this.shift_id,
      required this.duty_authorized_branch_ids,
      required this.is_active,
      required this.avatar_url,
      required this.created_at,
      required this.updated_at,
      required this.deleted_at,
      required this.branch,
      required this.shift})
      : super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String employee_code;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final dynamic email_verified_at;
  @override
  final String role;
  @override
  final String employee_type;
  @override
  final String work_type;
  @override
  final int branch_id;
  @override
  final dynamic supervisor_id;
  @override
  final int shift_id;
  @override
  final dynamic duty_authorized_branch_ids;
  @override
  final bool is_active;
  @override
  final dynamic avatar_url;
  @override
  final String created_at;
  @override
  final String updated_at;
  @override
  final dynamic deleted_at;
  @override
  final Branch branch;
  @override
  final Shift shift;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {required final int id,
      required final String employee_code,
      required final String name,
      required final String email,
      required final String phone,
      required final dynamic email_verified_at,
      required final String role,
      required final String employee_type,
      required final String work_type,
      required final int branch_id,
      required final dynamic supervisor_id,
      required final int shift_id,
      required final dynamic duty_authorized_branch_ids,
      required final bool is_active,
      required final dynamic avatar_url,
      required final String created_at,
      required final String updated_at,
      required final dynamic deleted_at,
      required final Branch branch,
      required final Shift shift}) = _$UserImpl;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get employee_code;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  dynamic get email_verified_at;
  @override
  String get role;
  @override
  String get employee_type;
  @override
  String get work_type;
  @override
  int get branch_id;
  @override
  dynamic get supervisor_id;
  @override
  int get shift_id;
  @override
  dynamic get duty_authorized_branch_ids;
  @override
  bool get is_active;
  @override
  dynamic get avatar_url;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  dynamic get deleted_at;
  @override
  Branch get branch;
  @override
  Shift get shift;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
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
  String get qr_secret => throw _privateConstructorUsedError;
  String get qr_token => throw _privateConstructorUsedError;
  String get qr_generated_at => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  dynamic get deleted_at => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

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
      String qr_secret,
      String qr_token,
      String qr_generated_at,
      bool is_active,
      dynamic deleted_at,
      String created_at,
      String updated_at});
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
    Object? qr_secret = null,
    Object? qr_token = null,
    Object? qr_generated_at = null,
    Object? is_active = null,
    Object? deleted_at = freezed,
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
      qr_secret: null == qr_secret
          ? _value.qr_secret
          : qr_secret // ignore: cast_nullable_to_non_nullable
              as String,
      qr_token: null == qr_token
          ? _value.qr_token
          : qr_token // ignore: cast_nullable_to_non_nullable
              as String,
      qr_generated_at: null == qr_generated_at
          ? _value.qr_generated_at
          : qr_generated_at // ignore: cast_nullable_to_non_nullable
              as String,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      String qr_secret,
      String qr_token,
      String qr_generated_at,
      bool is_active,
      dynamic deleted_at,
      String created_at,
      String updated_at});
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
    Object? qr_secret = null,
    Object? qr_token = null,
    Object? qr_generated_at = null,
    Object? is_active = null,
    Object? deleted_at = freezed,
    Object? created_at = null,
    Object? updated_at = null,
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
      qr_secret: null == qr_secret
          ? _value.qr_secret
          : qr_secret // ignore: cast_nullable_to_non_nullable
              as String,
      qr_token: null == qr_token
          ? _value.qr_token
          : qr_token // ignore: cast_nullable_to_non_nullable
              as String,
      qr_generated_at: null == qr_generated_at
          ? _value.qr_generated_at
          : qr_generated_at // ignore: cast_nullable_to_non_nullable
              as String,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
class _$BranchImpl extends _Branch {
  const _$BranchImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.geofence_radius_meters,
      required this.qr_secret,
      required this.qr_token,
      required this.qr_generated_at,
      required this.is_active,
      required this.deleted_at,
      required this.created_at,
      required this.updated_at})
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
  final String qr_secret;
  @override
  final String qr_token;
  @override
  final String qr_generated_at;
  @override
  final bool is_active;
  @override
  final dynamic deleted_at;
  @override
  final String created_at;
  @override
  final String updated_at;

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
      required final String qr_secret,
      required final String qr_token,
      required final String qr_generated_at,
      required final bool is_active,
      required final dynamic deleted_at,
      required final String created_at,
      required final String updated_at}) = _$BranchImpl;
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
  String get qr_secret;
  @override
  String get qr_token;
  @override
  String get qr_generated_at;
  @override
  bool get is_active;
  @override
  dynamic get deleted_at;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  @JsonKey(ignore: true)
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Shift _$ShiftFromJson(Map<String, dynamic> json) {
  return _Shift.fromJson(json);
}

/// @nodoc
mixin _$Shift {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get start_time => throw _privateConstructorUsedError;
  String get end_time => throw _privateConstructorUsedError;
  bool get is_overnight => throw _privateConstructorUsedError;
  int get grace_period_minutes => throw _privateConstructorUsedError;
  int get checkin_window_start_minutes => throw _privateConstructorUsedError;
  int get checkin_window_end_minutes => throw _privateConstructorUsedError;
  int get break_duration_minutes => throw _privateConstructorUsedError;
  List<int> get working_days => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  dynamic get deleted_at => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftCopyWith<Shift> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftCopyWith<$Res> {
  factory $ShiftCopyWith(Shift value, $Res Function(Shift) then) =
      _$ShiftCopyWithImpl<$Res, Shift>;
  @useResult
  $Res call(
      {int id,
      String name,
      String code,
      String start_time,
      String end_time,
      bool is_overnight,
      int grace_period_minutes,
      int checkin_window_start_minutes,
      int checkin_window_end_minutes,
      int break_duration_minutes,
      List<int> working_days,
      bool is_active,
      dynamic deleted_at,
      String created_at,
      String updated_at});
}

/// @nodoc
class _$ShiftCopyWithImpl<$Res, $Val extends Shift>
    implements $ShiftCopyWith<$Res> {
  _$ShiftCopyWithImpl(this._value, this._then);

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
    Object? start_time = null,
    Object? end_time = null,
    Object? is_overnight = null,
    Object? grace_period_minutes = null,
    Object? checkin_window_start_minutes = null,
    Object? checkin_window_end_minutes = null,
    Object? break_duration_minutes = null,
    Object? working_days = null,
    Object? is_active = null,
    Object? deleted_at = freezed,
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
      start_time: null == start_time
          ? _value.start_time
          : start_time // ignore: cast_nullable_to_non_nullable
              as String,
      end_time: null == end_time
          ? _value.end_time
          : end_time // ignore: cast_nullable_to_non_nullable
              as String,
      is_overnight: null == is_overnight
          ? _value.is_overnight
          : is_overnight // ignore: cast_nullable_to_non_nullable
              as bool,
      grace_period_minutes: null == grace_period_minutes
          ? _value.grace_period_minutes
          : grace_period_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      checkin_window_start_minutes: null == checkin_window_start_minutes
          ? _value.checkin_window_start_minutes
          : checkin_window_start_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      checkin_window_end_minutes: null == checkin_window_end_minutes
          ? _value.checkin_window_end_minutes
          : checkin_window_end_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      break_duration_minutes: null == break_duration_minutes
          ? _value.break_duration_minutes
          : break_duration_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      working_days: null == working_days
          ? _value.working_days
          : working_days // ignore: cast_nullable_to_non_nullable
              as List<int>,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$ShiftImplCopyWith<$Res> implements $ShiftCopyWith<$Res> {
  factory _$$ShiftImplCopyWith(
          _$ShiftImpl value, $Res Function(_$ShiftImpl) then) =
      __$$ShiftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String code,
      String start_time,
      String end_time,
      bool is_overnight,
      int grace_period_minutes,
      int checkin_window_start_minutes,
      int checkin_window_end_minutes,
      int break_duration_minutes,
      List<int> working_days,
      bool is_active,
      dynamic deleted_at,
      String created_at,
      String updated_at});
}

/// @nodoc
class __$$ShiftImplCopyWithImpl<$Res>
    extends _$ShiftCopyWithImpl<$Res, _$ShiftImpl>
    implements _$$ShiftImplCopyWith<$Res> {
  __$$ShiftImplCopyWithImpl(
      _$ShiftImpl _value, $Res Function(_$ShiftImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? start_time = null,
    Object? end_time = null,
    Object? is_overnight = null,
    Object? grace_period_minutes = null,
    Object? checkin_window_start_minutes = null,
    Object? checkin_window_end_minutes = null,
    Object? break_duration_minutes = null,
    Object? working_days = null,
    Object? is_active = null,
    Object? deleted_at = freezed,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(_$ShiftImpl(
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
      start_time: null == start_time
          ? _value.start_time
          : start_time // ignore: cast_nullable_to_non_nullable
              as String,
      end_time: null == end_time
          ? _value.end_time
          : end_time // ignore: cast_nullable_to_non_nullable
              as String,
      is_overnight: null == is_overnight
          ? _value.is_overnight
          : is_overnight // ignore: cast_nullable_to_non_nullable
              as bool,
      grace_period_minutes: null == grace_period_minutes
          ? _value.grace_period_minutes
          : grace_period_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      checkin_window_start_minutes: null == checkin_window_start_minutes
          ? _value.checkin_window_start_minutes
          : checkin_window_start_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      checkin_window_end_minutes: null == checkin_window_end_minutes
          ? _value.checkin_window_end_minutes
          : checkin_window_end_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      break_duration_minutes: null == break_duration_minutes
          ? _value.break_duration_minutes
          : break_duration_minutes // ignore: cast_nullable_to_non_nullable
              as int,
      working_days: null == working_days
          ? _value._working_days
          : working_days // ignore: cast_nullable_to_non_nullable
              as List<int>,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
class _$ShiftImpl extends _Shift {
  const _$ShiftImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.start_time,
      required this.end_time,
      required this.is_overnight,
      required this.grace_period_minutes,
      required this.checkin_window_start_minutes,
      required this.checkin_window_end_minutes,
      required this.break_duration_minutes,
      required final List<int> working_days,
      required this.is_active,
      required this.deleted_at,
      required this.created_at,
      required this.updated_at})
      : _working_days = working_days,
        super._();

  factory _$ShiftImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String code;
  @override
  final String start_time;
  @override
  final String end_time;
  @override
  final bool is_overnight;
  @override
  final int grace_period_minutes;
  @override
  final int checkin_window_start_minutes;
  @override
  final int checkin_window_end_minutes;
  @override
  final int break_duration_minutes;
  final List<int> _working_days;
  @override
  List<int> get working_days {
    if (_working_days is EqualUnmodifiableListView) return _working_days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_working_days);
  }

  @override
  final bool is_active;
  @override
  final dynamic deleted_at;
  @override
  final String created_at;
  @override
  final String updated_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftImplCopyWith<_$ShiftImpl> get copyWith =>
      __$$ShiftImplCopyWithImpl<_$ShiftImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftImplToJson(
      this,
    );
  }
}

abstract class _Shift extends Shift {
  const factory _Shift(
      {required final int id,
      required final String name,
      required final String code,
      required final String start_time,
      required final String end_time,
      required final bool is_overnight,
      required final int grace_period_minutes,
      required final int checkin_window_start_minutes,
      required final int checkin_window_end_minutes,
      required final int break_duration_minutes,
      required final List<int> working_days,
      required final bool is_active,
      required final dynamic deleted_at,
      required final String created_at,
      required final String updated_at}) = _$ShiftImpl;
  const _Shift._() : super._();

  factory _Shift.fromJson(Map<String, dynamic> json) = _$ShiftImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;
  @override
  String get start_time;
  @override
  String get end_time;
  @override
  bool get is_overnight;
  @override
  int get grace_period_minutes;
  @override
  int get checkin_window_start_minutes;
  @override
  int get checkin_window_end_minutes;
  @override
  int get break_duration_minutes;
  @override
  List<int> get working_days;
  @override
  bool get is_active;
  @override
  dynamic get deleted_at;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  @JsonKey(ignore: true)
  _$$ShiftImplCopyWith<_$ShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
