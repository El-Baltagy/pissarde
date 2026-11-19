// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_my_leaves_requests_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetMyLeavesRequestsRes _$GetMyLeavesRequestsResFromJson(
    Map<String, dynamic> json) {
  return _GetMyLeavesRequestsRes.fromJson(json);
}

/// @nodoc
mixin _$GetMyLeavesRequestsRes {
  int get current_page => throw _privateConstructorUsedError;
  List<LeavesRequest> get data => throw _privateConstructorUsedError;
  int get last_page => throw _privateConstructorUsedError;
  int get per_page => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetMyLeavesRequestsResCopyWith<GetMyLeavesRequestsRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMyLeavesRequestsResCopyWith<$Res> {
  factory $GetMyLeavesRequestsResCopyWith(GetMyLeavesRequestsRes value,
          $Res Function(GetMyLeavesRequestsRes) then) =
      _$GetMyLeavesRequestsResCopyWithImpl<$Res, GetMyLeavesRequestsRes>;
  @useResult
  $Res call(
      {int current_page,
      List<LeavesRequest> data,
      int last_page,
      int per_page,
      int total});
}

/// @nodoc
class _$GetMyLeavesRequestsResCopyWithImpl<$Res,
        $Val extends GetMyLeavesRequestsRes>
    implements $GetMyLeavesRequestsResCopyWith<$Res> {
  _$GetMyLeavesRequestsResCopyWithImpl(this._value, this._then);

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
    Object? per_page = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LeavesRequest>,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      per_page: null == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetMyLeavesRequestsResImplCopyWith<$Res>
    implements $GetMyLeavesRequestsResCopyWith<$Res> {
  factory _$$GetMyLeavesRequestsResImplCopyWith(
          _$GetMyLeavesRequestsResImpl value,
          $Res Function(_$GetMyLeavesRequestsResImpl) then) =
      __$$GetMyLeavesRequestsResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int current_page,
      List<LeavesRequest> data,
      int last_page,
      int per_page,
      int total});
}

/// @nodoc
class __$$GetMyLeavesRequestsResImplCopyWithImpl<$Res>
    extends _$GetMyLeavesRequestsResCopyWithImpl<$Res,
        _$GetMyLeavesRequestsResImpl>
    implements _$$GetMyLeavesRequestsResImplCopyWith<$Res> {
  __$$GetMyLeavesRequestsResImplCopyWithImpl(
      _$GetMyLeavesRequestsResImpl _value,
      $Res Function(_$GetMyLeavesRequestsResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? data = null,
    Object? last_page = null,
    Object? per_page = null,
    Object? total = null,
  }) {
    return _then(_$GetMyLeavesRequestsResImpl(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LeavesRequest>,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      per_page: null == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GetMyLeavesRequestsResImpl extends _GetMyLeavesRequestsRes {
  const _$GetMyLeavesRequestsResImpl(
      {required this.current_page,
      required final List<LeavesRequest> data,
      required this.last_page,
      required this.per_page,
      required this.total})
      : _data = data,
        super._();

  factory _$GetMyLeavesRequestsResImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetMyLeavesRequestsResImplFromJson(json);

  @override
  final int current_page;
  final List<LeavesRequest> _data;
  @override
  List<LeavesRequest> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int last_page;
  @override
  final int per_page;
  @override
  final int total;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMyLeavesRequestsResImplCopyWith<_$GetMyLeavesRequestsResImpl>
      get copyWith => __$$GetMyLeavesRequestsResImplCopyWithImpl<
          _$GetMyLeavesRequestsResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetMyLeavesRequestsResImplToJson(
      this,
    );
  }
}

abstract class _GetMyLeavesRequestsRes extends GetMyLeavesRequestsRes {
  const factory _GetMyLeavesRequestsRes(
      {required final int current_page,
      required final List<LeavesRequest> data,
      required final int last_page,
      required final int per_page,
      required final int total}) = _$GetMyLeavesRequestsResImpl;
  const _GetMyLeavesRequestsRes._() : super._();

  factory _GetMyLeavesRequestsRes.fromJson(Map<String, dynamic> json) =
      _$GetMyLeavesRequestsResImpl.fromJson;

  @override
  int get current_page;
  @override
  List<LeavesRequest> get data;
  @override
  int get last_page;
  @override
  int get per_page;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$GetMyLeavesRequestsResImplCopyWith<_$GetMyLeavesRequestsResImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LeavesRequest _$LeavesRequestFromJson(Map<String, dynamic> json) {
  return _LeavesRequest.fromJson(json);
}

/// @nodoc
mixin _$LeavesRequest {
  int get id => throw _privateConstructorUsedError;
  int get user_id => throw _privateConstructorUsedError;
  int get leave_type_id => throw _privateConstructorUsedError;
  String get start_date => throw _privateConstructorUsedError;
  String get end_date => throw _privateConstructorUsedError;
  int get total_days => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get emergency_phone => throw _privateConstructorUsedError;
  String? get attachment_path => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get reviewed_at => throw _privateConstructorUsedError;
  String? get review_notes => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;
  LeaveTypeItem get leave_type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeavesRequestCopyWith<LeavesRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeavesRequestCopyWith<$Res> {
  factory $LeavesRequestCopyWith(
          LeavesRequest value, $Res Function(LeavesRequest) then) =
      _$LeavesRequestCopyWithImpl<$Res, LeavesRequest>;
  @useResult
  $Res call(
      {int id,
      int user_id,
      int leave_type_id,
      String start_date,
      String end_date,
      int total_days,
      String? reason,
      String? emergency_phone,
      String? attachment_path,
      String status,
      String? reviewed_at,
      String? review_notes,
      String created_at,
      String updated_at,
      LeaveTypeItem leave_type });

  $LeaveTypeItemCopyWith<$Res> get leave_type;
}

/// @nodoc
class _$LeavesRequestCopyWithImpl<$Res, $Val extends LeavesRequest>
    implements $LeavesRequestCopyWith<$Res> {
  _$LeavesRequestCopyWithImpl(this._value, this._then);

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
    Object? reason = freezed,
    Object? emergency_phone = freezed,
    Object? attachment_path = freezed,
    Object? status = null,
    Object? reviewed_at = freezed,
    Object? review_notes = freezed,
    Object? created_at = null,
    Object? updated_at = null,
    Object? leave_type = null
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
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      emergency_phone: freezed == emergency_phone
          ? _value.emergency_phone
          : emergency_phone // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment_path: freezed == attachment_path
          ? _value.attachment_path
          : attachment_path // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reviewed_at: freezed == reviewed_at
          ? _value.reviewed_at
          : reviewed_at // ignore: cast_nullable_to_non_nullable
              as String?,
      review_notes: freezed == review_notes
          ? _value.review_notes
          : review_notes // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as LeaveTypeItem
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
abstract class _$$LeavesRequestImplCopyWith<$Res>
    implements $LeavesRequestCopyWith<$Res> {
  factory _$$LeavesRequestImplCopyWith(
          _$LeavesRequestImpl value, $Res Function(_$LeavesRequestImpl) then) =
      __$$LeavesRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int user_id,
      int leave_type_id,
      String start_date,
      String end_date,
      int total_days,
      String? reason,
      String? emergency_phone,
      String? attachment_path,
      String status,
      String? reviewed_at,
      String? review_notes,
      String created_at,
      String updated_at,
      LeaveTypeItem leave_type });

  @override
  $LeaveTypeItemCopyWith<$Res> get leave_type;
}

/// @nodoc
class __$$LeavesRequestImplCopyWithImpl<$Res>
    extends _$LeavesRequestCopyWithImpl<$Res, _$LeavesRequestImpl>
    implements _$$LeavesRequestImplCopyWith<$Res> {
  __$$LeavesRequestImplCopyWithImpl(
      _$LeavesRequestImpl _value, $Res Function(_$LeavesRequestImpl) _then)
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
    Object? reason = freezed,
    Object? emergency_phone = freezed,
    Object? attachment_path = freezed,
    Object? status = null,
    Object? reviewed_at = freezed,
    Object? review_notes = freezed,
    Object? created_at = null,
    Object? updated_at = null,
    Object? leave_type = null,
    Object? reviewed_by = freezed,
  }) {
    return _then(_$LeavesRequestImpl(
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
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      emergency_phone: freezed == emergency_phone
          ? _value.emergency_phone
          : emergency_phone // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment_path: freezed == attachment_path
          ? _value.attachment_path
          : attachment_path // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reviewed_at: freezed == reviewed_at
          ? _value.reviewed_at
          : reviewed_at // ignore: cast_nullable_to_non_nullable
              as String?,
      review_notes: freezed == review_notes
          ? _value.review_notes
          : review_notes // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as LeaveTypeItem
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LeavesRequestImpl extends _LeavesRequest {
  const _$LeavesRequestImpl(
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
      required this.reviewed_at,
      required this.review_notes,
      required this.created_at,
      required this.updated_at,
      required this.leave_type })
      : super._();

  factory _$LeavesRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeavesRequestImplFromJson(json);

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
  final String? reason;
  @override
  final String? emergency_phone;
  @override
  final String? attachment_path;
  @override
  final String status;
  @override
  final String? reviewed_at;
  @override
  final String? review_notes;
  @override
  final String created_at;
  @override
  final String updated_at;
  @override
  final LeaveTypeItem leave_type;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeavesRequestImplCopyWith<_$LeavesRequestImpl> get copyWith =>
      __$$LeavesRequestImplCopyWithImpl<_$LeavesRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeavesRequestImplToJson(
      this,
    );
  }
}

abstract class _LeavesRequest extends LeavesRequest {
  const factory _LeavesRequest(
      {required final int id,
      required final int user_id,
      required final int leave_type_id,
      required final String start_date,
      required final String end_date,
      required final int total_days,
      required final String? reason,
      required final String? emergency_phone,
      required final String? attachment_path,
      required final String status,
      required final String? reviewed_at,
      required final String? review_notes,
      required final String created_at,
      required final String updated_at,
      required final LeaveTypeItem leave_type }) = _$LeavesRequestImpl;
  const _LeavesRequest._() : super._();

  factory _LeavesRequest.fromJson(Map<String, dynamic> json) =
      _$LeavesRequestImpl.fromJson;

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
  String? get reason;
  @override
  String? get emergency_phone;
  @override
  String? get attachment_path;
  @override
  String get status;
  @override
  String? get reviewed_at;
  @override
  String? get review_notes;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  LeaveTypeItem get leave_type;
  @override
  @JsonKey(ignore: true)
  _$$LeavesRequestImplCopyWith<_$LeavesRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
