// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_employees_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAllEmployeesRes _$GetAllEmployeesResFromJson(Map<String, dynamic> json) {
  return _GetAllEmployeesRes.fromJson(json);
}

/// @nodoc
mixin _$GetAllEmployeesRes {
  List<DataItem> get data => throw _privateConstructorUsedError;
  Links get links => throw _privateConstructorUsedError;
  Meta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetAllEmployeesResCopyWith<GetAllEmployeesRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllEmployeesResCopyWith<$Res> {
  factory $GetAllEmployeesResCopyWith(
          GetAllEmployeesRes value, $Res Function(GetAllEmployeesRes) then) =
      _$GetAllEmployeesResCopyWithImpl<$Res, GetAllEmployeesRes>;
  @useResult
  $Res call({List<DataItem> data, Links links, Meta meta});

  $LinksCopyWith<$Res> get links;
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$GetAllEmployeesResCopyWithImpl<$Res, $Val extends GetAllEmployeesRes>
    implements $GetAllEmployeesResCopyWith<$Res> {
  _$GetAllEmployeesResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataItem>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res> get links {
    return $LinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetAllEmployeesResImplCopyWith<$Res>
    implements $GetAllEmployeesResCopyWith<$Res> {
  factory _$$GetAllEmployeesResImplCopyWith(_$GetAllEmployeesResImpl value,
          $Res Function(_$GetAllEmployeesResImpl) then) =
      __$$GetAllEmployeesResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DataItem> data, Links links, Meta meta});

  @override
  $LinksCopyWith<$Res> get links;
  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$GetAllEmployeesResImplCopyWithImpl<$Res>
    extends _$GetAllEmployeesResCopyWithImpl<$Res, _$GetAllEmployeesResImpl>
    implements _$$GetAllEmployeesResImplCopyWith<$Res> {
  __$$GetAllEmployeesResImplCopyWithImpl(_$GetAllEmployeesResImpl _value,
      $Res Function(_$GetAllEmployeesResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_$GetAllEmployeesResImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataItem>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GetAllEmployeesResImpl extends _GetAllEmployeesRes {
  const _$GetAllEmployeesResImpl(
      {required final List<DataItem> data,
      required this.links,
      required this.meta})
      : _data = data,
        super._();

  factory _$GetAllEmployeesResImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAllEmployeesResImplFromJson(json);

  final List<DataItem> _data;
  @override
  List<DataItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final Links links;
  @override
  final Meta meta;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllEmployeesResImplCopyWith<_$GetAllEmployeesResImpl> get copyWith =>
      __$$GetAllEmployeesResImplCopyWithImpl<_$GetAllEmployeesResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllEmployeesResImplToJson(
      this,
    );
  }
}

abstract class _GetAllEmployeesRes extends GetAllEmployeesRes {
  const factory _GetAllEmployeesRes(
      {required final List<DataItem> data,
      required final Links links,
      required final Meta meta}) = _$GetAllEmployeesResImpl;
  const _GetAllEmployeesRes._() : super._();

  factory _GetAllEmployeesRes.fromJson(Map<String, dynamic> json) =
      _$GetAllEmployeesResImpl.fromJson;

  @override
  List<DataItem> get data;
  @override
  Links get links;
  @override
  Meta get meta;
  @override
  @JsonKey(ignore: true)
  _$$GetAllEmployeesResImplCopyWith<_$GetAllEmployeesResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataItem _$DataItemFromJson(Map<String, dynamic> json) {
  return _DataItem.fromJson(json);
}

/// @nodoc
mixin _$DataItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get employee_code => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  Employeetype get employee_type => throw _privateConstructorUsedError;
  Worktype get work_type => throw _privateConstructorUsedError;
  Branch get branch => throw _privateConstructorUsedError;
  Supervisor? get supervisor => throw _privateConstructorUsedError;
  Shift get shift => throw _privateConstructorUsedError;
  dynamic get duty_authorized_branch_ids => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
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
      String email,
      String employee_code,
      String phone,
      Role role,
      Employeetype employee_type,
      Worktype work_type,
      Branch branch,
      Supervisor? supervisor,
      Shift shift,
      dynamic duty_authorized_branch_ids,
      bool is_active,
      String created_at});

  $RoleCopyWith<$Res> get role;
  $EmployeetypeCopyWith<$Res> get employee_type;
  $WorktypeCopyWith<$Res> get work_type;
  $BranchCopyWith<$Res> get branch;
  $SupervisorCopyWith<$Res>? get supervisor;
  $ShiftCopyWith<$Res> get shift;
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
    Object? email = null,
    Object? employee_code = null,
    Object? phone = null,
    Object? role = null,
    Object? employee_type = null,
    Object? work_type = null,
    Object? branch = null,
    Object? supervisor = freezed,
    Object? shift = null,
    Object? duty_authorized_branch_ids = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      employee_code: null == employee_code
          ? _value.employee_code
          : employee_code // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      employee_type: null == employee_type
          ? _value.employee_type
          : employee_type // ignore: cast_nullable_to_non_nullable
              as Employeetype,
      work_type: null == work_type
          ? _value.work_type
          : work_type // ignore: cast_nullable_to_non_nullable
              as Worktype,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
      supervisor: freezed == supervisor
          ? _value.supervisor
          : supervisor // ignore: cast_nullable_to_non_nullable
              as Supervisor?,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift,
      duty_authorized_branch_ids: freezed == duty_authorized_branch_ids
          ? _value.duty_authorized_branch_ids
          : duty_authorized_branch_ids // ignore: cast_nullable_to_non_nullable
              as dynamic,
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

  @override
  @pragma('vm:prefer-inline')
  $RoleCopyWith<$Res> get role {
    return $RoleCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EmployeetypeCopyWith<$Res> get employee_type {
    return $EmployeetypeCopyWith<$Res>(_value.employee_type, (value) {
      return _then(_value.copyWith(employee_type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WorktypeCopyWith<$Res> get work_type {
    return $WorktypeCopyWith<$Res>(_value.work_type, (value) {
      return _then(_value.copyWith(work_type: value) as $Val);
    });
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
  $SupervisorCopyWith<$Res>? get supervisor {
    if (_value.supervisor == null) {
      return null;
    }

    return $SupervisorCopyWith<$Res>(_value.supervisor!, (value) {
      return _then(_value.copyWith(supervisor: value) as $Val);
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
      String email,
      String employee_code,
      String phone,
      Role role,
      Employeetype employee_type,
      Worktype work_type,
      Branch branch,
      Supervisor? supervisor,
      Shift shift,
      dynamic duty_authorized_branch_ids,
      bool is_active,
      String created_at});

  @override
  $RoleCopyWith<$Res> get role;
  @override
  $EmployeetypeCopyWith<$Res> get employee_type;
  @override
  $WorktypeCopyWith<$Res> get work_type;
  @override
  $BranchCopyWith<$Res> get branch;
  @override
  $SupervisorCopyWith<$Res>? get supervisor;
  @override
  $ShiftCopyWith<$Res> get shift;
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
    Object? email = null,
    Object? employee_code = null,
    Object? phone = null,
    Object? role = null,
    Object? employee_type = null,
    Object? work_type = null,
    Object? branch = null,
    Object? supervisor = freezed,
    Object? shift = null,
    Object? duty_authorized_branch_ids = freezed,
    Object? is_active = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      employee_code: null == employee_code
          ? _value.employee_code
          : employee_code // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      employee_type: null == employee_type
          ? _value.employee_type
          : employee_type // ignore: cast_nullable_to_non_nullable
              as Employeetype,
      work_type: null == work_type
          ? _value.work_type
          : work_type // ignore: cast_nullable_to_non_nullable
              as Worktype,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
      supervisor: freezed == supervisor
          ? _value.supervisor
          : supervisor // ignore: cast_nullable_to_non_nullable
              as Supervisor?,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift,
      duty_authorized_branch_ids: freezed == duty_authorized_branch_ids
          ? _value.duty_authorized_branch_ids
          : duty_authorized_branch_ids // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
class _$DataItemImpl extends _DataItem {
  const _$DataItemImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.employee_code,
      required this.phone,
      required this.role,
      required this.employee_type,
      required this.work_type,
      required this.branch,
      required this.supervisor,
      required this.shift,
      required this.duty_authorized_branch_ids,
      required this.is_active,
      required this.created_at})
      : super._();

  factory _$DataItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String employee_code;
  @override
  final String phone;
  @override
  final Role role;
  @override
  final Employeetype employee_type;
  @override
  final Worktype work_type;
  @override
  final Branch branch;
  @override
  final Supervisor? supervisor;
  @override
  final Shift shift;
  @override
  final dynamic duty_authorized_branch_ids;
  @override
  final bool is_active;
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
      required final String email,
      required final String employee_code,
      required final String phone,
      required final Role role,
      required final Employeetype employee_type,
      required final Worktype work_type,
      required final Branch branch,
      required final Supervisor? supervisor,
      required final Shift shift,
      required final dynamic duty_authorized_branch_ids,
      required final bool is_active,
      required final String created_at}) = _$DataItemImpl;
  const _DataItem._() : super._();

  factory _DataItem.fromJson(Map<String, dynamic> json) =
      _$DataItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get employee_code;
  @override
  String get phone;
  @override
  Role get role;
  @override
  Employeetype get employee_type;
  @override
  Worktype get work_type;
  @override
  Branch get branch;
  @override
  Supervisor? get supervisor;
  @override
  Shift get shift;
  @override
  dynamic get duty_authorized_branch_ids;
  @override
  bool get is_active;
  @override
  String get created_at;
  @override
  @JsonKey(ignore: true)
  _$$DataItemImplCopyWith<_$DataItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Role _$RoleFromJson(Map<String, dynamic> json) {
  return _Role.fromJson(json);
}

/// @nodoc
mixin _$Role {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleCopyWith<Role> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) then) =
      _$RoleCopyWithImpl<$Res, Role>;
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class _$RoleCopyWithImpl<$Res, $Val extends Role>
    implements $RoleCopyWith<$Res> {
  _$RoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleImplCopyWith<$Res> implements $RoleCopyWith<$Res> {
  factory _$$RoleImplCopyWith(
          _$RoleImpl value, $Res Function(_$RoleImpl) then) =
      __$$RoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class __$$RoleImplCopyWithImpl<$Res>
    extends _$RoleCopyWithImpl<$Res, _$RoleImpl>
    implements _$$RoleImplCopyWith<$Res> {
  __$$RoleImplCopyWithImpl(_$RoleImpl _value, $Res Function(_$RoleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_$RoleImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RoleImpl extends _Role {
  const _$RoleImpl({required this.value, required this.label}) : super._();

  factory _$RoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleImplFromJson(json);

  @override
  final String value;
  @override
  final String label;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleImplCopyWith<_$RoleImpl> get copyWith =>
      __$$RoleImplCopyWithImpl<_$RoleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleImplToJson(
      this,
    );
  }
}

abstract class _Role extends Role {
  const factory _Role(
      {required final String value, required final String label}) = _$RoleImpl;
  const _Role._() : super._();

  factory _Role.fromJson(Map<String, dynamic> json) = _$RoleImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$RoleImplCopyWith<_$RoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Employeetype _$EmployeetypeFromJson(Map<String, dynamic> json) {
  return _Employeetype.fromJson(json);
}

/// @nodoc
mixin _$Employeetype {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeetypeCopyWith<Employeetype> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeetypeCopyWith<$Res> {
  factory $EmployeetypeCopyWith(
          Employeetype value, $Res Function(Employeetype) then) =
      _$EmployeetypeCopyWithImpl<$Res, Employeetype>;
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class _$EmployeetypeCopyWithImpl<$Res, $Val extends Employeetype>
    implements $EmployeetypeCopyWith<$Res> {
  _$EmployeetypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeetypeImplCopyWith<$Res>
    implements $EmployeetypeCopyWith<$Res> {
  factory _$$EmployeetypeImplCopyWith(
          _$EmployeetypeImpl value, $Res Function(_$EmployeetypeImpl) then) =
      __$$EmployeetypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class __$$EmployeetypeImplCopyWithImpl<$Res>
    extends _$EmployeetypeCopyWithImpl<$Res, _$EmployeetypeImpl>
    implements _$$EmployeetypeImplCopyWith<$Res> {
  __$$EmployeetypeImplCopyWithImpl(
      _$EmployeetypeImpl _value, $Res Function(_$EmployeetypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_$EmployeetypeImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EmployeetypeImpl extends _Employeetype {
  const _$EmployeetypeImpl({required this.value, required this.label})
      : super._();

  factory _$EmployeetypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeetypeImplFromJson(json);

  @override
  final String value;
  @override
  final String label;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeetypeImplCopyWith<_$EmployeetypeImpl> get copyWith =>
      __$$EmployeetypeImplCopyWithImpl<_$EmployeetypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeetypeImplToJson(
      this,
    );
  }
}

abstract class _Employeetype extends Employeetype {
  const factory _Employeetype(
      {required final String value,
      required final String label}) = _$EmployeetypeImpl;
  const _Employeetype._() : super._();

  factory _Employeetype.fromJson(Map<String, dynamic> json) =
      _$EmployeetypeImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$EmployeetypeImplCopyWith<_$EmployeetypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Worktype _$WorktypeFromJson(Map<String, dynamic> json) {
  return _Worktype.fromJson(json);
}

/// @nodoc
mixin _$Worktype {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool get requires_qr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorktypeCopyWith<Worktype> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorktypeCopyWith<$Res> {
  factory $WorktypeCopyWith(Worktype value, $Res Function(Worktype) then) =
      _$WorktypeCopyWithImpl<$Res, Worktype>;
  @useResult
  $Res call({String value, String label, bool requires_qr});
}

/// @nodoc
class _$WorktypeCopyWithImpl<$Res, $Val extends Worktype>
    implements $WorktypeCopyWith<$Res> {
  _$WorktypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? requires_qr = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      requires_qr: null == requires_qr
          ? _value.requires_qr
          : requires_qr // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorktypeImplCopyWith<$Res>
    implements $WorktypeCopyWith<$Res> {
  factory _$$WorktypeImplCopyWith(
          _$WorktypeImpl value, $Res Function(_$WorktypeImpl) then) =
      __$$WorktypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label, bool requires_qr});
}

/// @nodoc
class __$$WorktypeImplCopyWithImpl<$Res>
    extends _$WorktypeCopyWithImpl<$Res, _$WorktypeImpl>
    implements _$$WorktypeImplCopyWith<$Res> {
  __$$WorktypeImplCopyWithImpl(
      _$WorktypeImpl _value, $Res Function(_$WorktypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? requires_qr = null,
  }) {
    return _then(_$WorktypeImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      requires_qr: null == requires_qr
          ? _value.requires_qr
          : requires_qr // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$WorktypeImpl extends _Worktype {
  const _$WorktypeImpl(
      {required this.value, required this.label, required this.requires_qr})
      : super._();

  factory _$WorktypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorktypeImplFromJson(json);

  @override
  final String value;
  @override
  final String label;
  @override
  final bool requires_qr;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorktypeImplCopyWith<_$WorktypeImpl> get copyWith =>
      __$$WorktypeImplCopyWithImpl<_$WorktypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorktypeImplToJson(
      this,
    );
  }
}

abstract class _Worktype extends Worktype {
  const factory _Worktype(
      {required final String value,
      required final String label,
      required final bool requires_qr}) = _$WorktypeImpl;
  const _Worktype._() : super._();

  factory _Worktype.fromJson(Map<String, dynamic> json) =
      _$WorktypeImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  bool get requires_qr;
  @override
  @JsonKey(ignore: true)
  _$$WorktypeImplCopyWith<_$WorktypeImpl> get copyWith =>
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
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  int get geofence_radius_meters => throw _privateConstructorUsedError;

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
      double latitude,
      double longitude,
      int geofence_radius_meters});
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
    Object? latitude = null,
    Object? longitude = null,
    Object? geofence_radius_meters = null,
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
      double latitude,
      double longitude,
      int geofence_radius_meters});
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
    Object? latitude = null,
    Object? longitude = null,
    Object? geofence_radius_meters = null,
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
class _$BranchImpl extends _Branch {
  const _$BranchImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.latitude,
      required this.longitude,
      required this.geofence_radius_meters})
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
  final double latitude;
  @override
  final double longitude;
  @override
  final int geofence_radius_meters;

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
      required final double latitude,
      required final double longitude,
      required final int geofence_radius_meters}) = _$BranchImpl;
  const _Branch._() : super._();

  factory _Branch.fromJson(Map<String, dynamic> json) = _$BranchImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  int get geofence_radius_meters;
  @override
  @JsonKey(ignore: true)
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Supervisor _$SupervisorFromJson(Map<String, dynamic> json) {
  return _Supervisor.fromJson(json);
}

/// @nodoc
mixin _$Supervisor {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupervisorCopyWith<Supervisor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupervisorCopyWith<$Res> {
  factory $SupervisorCopyWith(
          Supervisor value, $Res Function(Supervisor) then) =
      _$SupervisorCopyWithImpl<$Res, Supervisor>;
  @useResult
  $Res call({int id, String name, String email});
}

/// @nodoc
class _$SupervisorCopyWithImpl<$Res, $Val extends Supervisor>
    implements $SupervisorCopyWith<$Res> {
  _$SupervisorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupervisorImplCopyWith<$Res>
    implements $SupervisorCopyWith<$Res> {
  factory _$$SupervisorImplCopyWith(
          _$SupervisorImpl value, $Res Function(_$SupervisorImpl) then) =
      __$$SupervisorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String email});
}

/// @nodoc
class __$$SupervisorImplCopyWithImpl<$Res>
    extends _$SupervisorCopyWithImpl<$Res, _$SupervisorImpl>
    implements _$$SupervisorImplCopyWith<$Res> {
  __$$SupervisorImplCopyWithImpl(
      _$SupervisorImpl _value, $Res Function(_$SupervisorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$SupervisorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SupervisorImpl extends _Supervisor {
  const _$SupervisorImpl(
      {required this.id, required this.name, required this.email})
      : super._();

  factory _$SupervisorImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupervisorImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SupervisorImplCopyWith<_$SupervisorImpl> get copyWith =>
      __$$SupervisorImplCopyWithImpl<_$SupervisorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupervisorImplToJson(
      this,
    );
  }
}

abstract class _Supervisor extends Supervisor {
  const factory _Supervisor(
      {required final int id,
      required final String name,
      required final String email}) = _$SupervisorImpl;
  const _Supervisor._() : super._();

  factory _Supervisor.fromJson(Map<String, dynamic> json) =
      _$SupervisorImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$SupervisorImplCopyWith<_$SupervisorImpl> get copyWith =>
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
  List<int> get working_days => throw _privateConstructorUsedError;

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
      List<int> working_days});
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
    Object? working_days = null,
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
      working_days: null == working_days
          ? _value.working_days
          : working_days // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
      List<int> working_days});
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
    Object? working_days = null,
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
      working_days: null == working_days
          ? _value._working_days
          : working_days // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
      required final List<int> working_days})
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
  final List<int> _working_days;
  @override
  List<int> get working_days {
    if (_working_days is EqualUnmodifiableListView) return _working_days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_working_days);
  }

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
      required final List<int> working_days}) = _$ShiftImpl;
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
  List<int> get working_days;
  @override
  @JsonKey(ignore: true)
  _$$ShiftImplCopyWith<_$ShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Links _$LinksFromJson(Map<String, dynamic> json) {
  return _Links.fromJson(json);
}

/// @nodoc
mixin _$Links {
  String get first => throw _privateConstructorUsedError;
  String get last => throw _privateConstructorUsedError;
  dynamic get prev => throw _privateConstructorUsedError;
  dynamic get next => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinksCopyWith<Links> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksCopyWith<$Res> {
  factory $LinksCopyWith(Links value, $Res Function(Links) then) =
      _$LinksCopyWithImpl<$Res, Links>;
  @useResult
  $Res call({String first, String last, dynamic prev, dynamic next});
}

/// @nodoc
class _$LinksCopyWithImpl<$Res, $Val extends Links>
    implements $LinksCopyWith<$Res> {
  _$LinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as dynamic,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinksImplCopyWith<$Res> implements $LinksCopyWith<$Res> {
  factory _$$LinksImplCopyWith(
          _$LinksImpl value, $Res Function(_$LinksImpl) then) =
      __$$LinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String first, String last, dynamic prev, dynamic next});
}

/// @nodoc
class __$$LinksImplCopyWithImpl<$Res>
    extends _$LinksCopyWithImpl<$Res, _$LinksImpl>
    implements _$$LinksImplCopyWith<$Res> {
  __$$LinksImplCopyWithImpl(
      _$LinksImpl _value, $Res Function(_$LinksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_$LinksImpl(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as dynamic,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LinksImpl extends _Links {
  const _$LinksImpl(
      {required this.first,
      required this.last,
      required this.prev,
      required this.next})
      : super._();

  factory _$LinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinksImplFromJson(json);

  @override
  final String first;
  @override
  final String last;
  @override
  final dynamic prev;
  @override
  final dynamic next;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      __$$LinksImplCopyWithImpl<_$LinksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinksImplToJson(
      this,
    );
  }
}

abstract class _Links extends Links {
  const factory _Links(
      {required final String first,
      required final String last,
      required final dynamic prev,
      required final dynamic next}) = _$LinksImpl;
  const _Links._() : super._();

  factory _Links.fromJson(Map<String, dynamic> json) = _$LinksImpl.fromJson;

  @override
  String get first;
  @override
  String get last;
  @override
  dynamic get prev;
  @override
  dynamic get next;
  @override
  @JsonKey(ignore: true)
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  int get current_page => throw _privateConstructorUsedError;
  int get from => throw _privateConstructorUsedError;
  int get last_page => throw _privateConstructorUsedError;
  List<LinkItem> get links => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  int get per_page => throw _privateConstructorUsedError;
  int get to => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call(
      {int current_page,
      int from,
      int last_page,
      List<LinkItem> links,
      String path,
      int per_page,
      int to,
      int total});
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? from = null,
    Object? last_page = null,
    Object? links = null,
    Object? path = null,
    Object? per_page = null,
    Object? to = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinkItem>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      per_page: null == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int current_page,
      int from,
      int last_page,
      List<LinkItem> links,
      String path,
      int per_page,
      int to,
      int total});
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? from = null,
    Object? last_page = null,
    Object? links = null,
    Object? path = null,
    Object? per_page = null,
    Object? to = null,
    Object? total = null,
  }) {
    return _then(_$MetaImpl(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinkItem>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      per_page: null == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
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
class _$MetaImpl extends _Meta {
  const _$MetaImpl(
      {required this.current_page,
      required this.from,
      required this.last_page,
      required final List<LinkItem> links,
      required this.path,
      required this.per_page,
      required this.to,
      required this.total})
      : _links = links,
        super._();

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  final int current_page;
  @override
  final int from;
  @override
  final int last_page;
  final List<LinkItem> _links;
  @override
  List<LinkItem> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  final String path;
  @override
  final int per_page;
  @override
  final int to;
  @override
  final int total;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta extends Meta {
  const factory _Meta(
      {required final int current_page,
      required final int from,
      required final int last_page,
      required final List<LinkItem> links,
      required final String path,
      required final int per_page,
      required final int to,
      required final int total}) = _$MetaImpl;
  const _Meta._() : super._();

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  int get current_page;
  @override
  int get from;
  @override
  int get last_page;
  @override
  List<LinkItem> get links;
  @override
  String get path;
  @override
  int get per_page;
  @override
  int get to;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LinkItem _$LinkItemFromJson(Map<String, dynamic> json) {
  return _LinkItem.fromJson(json);
}

/// @nodoc
mixin _$LinkItem {
  dynamic get url => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  dynamic get page => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinkItemCopyWith<LinkItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkItemCopyWith<$Res> {
  factory $LinkItemCopyWith(LinkItem value, $Res Function(LinkItem) then) =
      _$LinkItemCopyWithImpl<$Res, LinkItem>;
  @useResult
  $Res call({dynamic url, String label, dynamic page, bool active});
}

/// @nodoc
class _$LinkItemCopyWithImpl<$Res, $Val extends LinkItem>
    implements $LinkItemCopyWith<$Res> {
  _$LinkItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? page = freezed,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as dynamic,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as dynamic,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinkItemImplCopyWith<$Res>
    implements $LinkItemCopyWith<$Res> {
  factory _$$LinkItemImplCopyWith(
          _$LinkItemImpl value, $Res Function(_$LinkItemImpl) then) =
      __$$LinkItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic url, String label, dynamic page, bool active});
}

/// @nodoc
class __$$LinkItemImplCopyWithImpl<$Res>
    extends _$LinkItemCopyWithImpl<$Res, _$LinkItemImpl>
    implements _$$LinkItemImplCopyWith<$Res> {
  __$$LinkItemImplCopyWithImpl(
      _$LinkItemImpl _value, $Res Function(_$LinkItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? page = freezed,
    Object? active = null,
  }) {
    return _then(_$LinkItemImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as dynamic,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as dynamic,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LinkItemImpl extends _LinkItem {
  const _$LinkItemImpl(
      {required this.url,
      required this.label,
      required this.page,
      required this.active})
      : super._();

  factory _$LinkItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkItemImplFromJson(json);

  @override
  final dynamic url;
  @override
  final String label;
  @override
  final dynamic page;
  @override
  final bool active;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkItemImplCopyWith<_$LinkItemImpl> get copyWith =>
      __$$LinkItemImplCopyWithImpl<_$LinkItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkItemImplToJson(
      this,
    );
  }
}

abstract class _LinkItem extends LinkItem {
  const factory _LinkItem(
      {required final dynamic url,
      required final String label,
      required final dynamic page,
      required final bool active}) = _$LinkItemImpl;
  const _LinkItem._() : super._();

  factory _LinkItem.fromJson(Map<String, dynamic> json) =
      _$LinkItemImpl.fromJson;

  @override
  dynamic get url;
  @override
  String get label;
  @override
  dynamic get page;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$LinkItemImplCopyWith<_$LinkItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
