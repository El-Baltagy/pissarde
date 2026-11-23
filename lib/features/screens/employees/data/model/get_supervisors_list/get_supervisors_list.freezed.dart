// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_supervisors_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetSupervisorsList _$GetSupervisorsListFromJson(Map<String, dynamic> json) {
  return _GetSupervisorsList.fromJson(json);
}

/// @nodoc
mixin _$GetSupervisorsList {
  List<Supervisortem> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetSupervisorsListCopyWith<GetSupervisorsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSupervisorsListCopyWith<$Res> {
  factory $GetSupervisorsListCopyWith(
          GetSupervisorsList value, $Res Function(GetSupervisorsList) then) =
      _$GetSupervisorsListCopyWithImpl<$Res, GetSupervisorsList>;
  @useResult
  $Res call({List<Supervisortem> data});
}

/// @nodoc
class _$GetSupervisorsListCopyWithImpl<$Res, $Val extends GetSupervisorsList>
    implements $GetSupervisorsListCopyWith<$Res> {
  _$GetSupervisorsListCopyWithImpl(this._value, this._then);

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
              as List<Supervisortem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetSupervisorsListImplCopyWith<$Res>
    implements $GetSupervisorsListCopyWith<$Res> {
  factory _$$GetSupervisorsListImplCopyWith(_$GetSupervisorsListImpl value,
          $Res Function(_$GetSupervisorsListImpl) then) =
      __$$GetSupervisorsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Supervisortem> data});
}

/// @nodoc
class __$$GetSupervisorsListImplCopyWithImpl<$Res>
    extends _$GetSupervisorsListCopyWithImpl<$Res, _$GetSupervisorsListImpl>
    implements _$$GetSupervisorsListImplCopyWith<$Res> {
  __$$GetSupervisorsListImplCopyWithImpl(_$GetSupervisorsListImpl _value,
      $Res Function(_$GetSupervisorsListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GetSupervisorsListImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Supervisortem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GetSupervisorsListImpl extends _GetSupervisorsList {
  const _$GetSupervisorsListImpl({required final List<Supervisortem> data})
      : _data = data,
        super._();

  factory _$GetSupervisorsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetSupervisorsListImplFromJson(json);

  final List<Supervisortem> _data;
  @override
  List<Supervisortem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSupervisorsListImplCopyWith<_$GetSupervisorsListImpl> get copyWith =>
      __$$GetSupervisorsListImplCopyWithImpl<_$GetSupervisorsListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSupervisorsListImplToJson(
      this,
    );
  }
}

abstract class _GetSupervisorsList extends GetSupervisorsList {
  const factory _GetSupervisorsList({required final List<Supervisortem> data}) =
      _$GetSupervisorsListImpl;
  const _GetSupervisorsList._() : super._();

  factory _GetSupervisorsList.fromJson(Map<String, dynamic> json) =
      _$GetSupervisorsListImpl.fromJson;

  @override
  List<Supervisortem> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetSupervisorsListImplCopyWith<_$GetSupervisorsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Supervisortem _$SupervisortemFromJson(Map<String, dynamic> json) {
  return _Supervisortem.fromJson(json);
}

/// @nodoc
mixin _$Supervisortem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get employee_code => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  Employeetype get employee_type => throw _privateConstructorUsedError;
  Worktype get work_type => throw _privateConstructorUsedError;
  Branch get branch => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupervisortemCopyWith<Supervisortem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupervisortemCopyWith<$Res> {
  factory $SupervisortemCopyWith(
          Supervisortem value, $Res Function(Supervisortem) then) =
      _$SupervisortemCopyWithImpl<$Res, Supervisortem>;
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
      bool is_active,
      String created_at});

  $RoleCopyWith<$Res> get role;
  $EmployeetypeCopyWith<$Res> get employee_type;
  $WorktypeCopyWith<$Res> get work_type;
  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class _$SupervisortemCopyWithImpl<$Res, $Val extends Supervisortem>
    implements $SupervisortemCopyWith<$Res> {
  _$SupervisortemCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
abstract class _$$SupervisortemImplCopyWith<$Res>
    implements $SupervisortemCopyWith<$Res> {
  factory _$$SupervisortemImplCopyWith(
          _$SupervisortemImpl value, $Res Function(_$SupervisortemImpl) then) =
      __$$SupervisortemImplCopyWithImpl<$Res>;
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
}

/// @nodoc
class __$$SupervisortemImplCopyWithImpl<$Res>
    extends _$SupervisortemCopyWithImpl<$Res, _$SupervisortemImpl>
    implements _$$SupervisortemImplCopyWith<$Res> {
  __$$SupervisortemImplCopyWithImpl(
      _$SupervisortemImpl _value, $Res Function(_$SupervisortemImpl) _then)
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
    Object? is_active = null,
    Object? created_at = null,
  }) {
    return _then(_$SupervisortemImpl(
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
class _$SupervisortemImpl extends _Supervisortem {
  const _$SupervisortemImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.employee_code,
      required this.phone,
      required this.role,
      required this.employee_type,
      required this.work_type,
      required this.branch,
      required this.is_active,
      required this.created_at})
      : super._();

  factory _$SupervisortemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupervisortemImplFromJson(json);

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
  final bool is_active;
  @override
  final String created_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SupervisortemImplCopyWith<_$SupervisortemImpl> get copyWith =>
      __$$SupervisortemImplCopyWithImpl<_$SupervisortemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupervisortemImplToJson(
      this,
    );
  }
}

abstract class _Supervisortem extends Supervisortem {
  const factory _Supervisortem(
      {required final int id,
      required final String name,
      required final String email,
      required final String employee_code,
      required final String phone,
      required final Role role,
      required final Employeetype employee_type,
      required final Worktype work_type,
      required final Branch branch,
      required final bool is_active,
      required final String created_at}) = _$SupervisortemImpl;
  const _Supervisortem._() : super._();

  factory _Supervisortem.fromJson(Map<String, dynamic> json) =
      _$SupervisortemImpl.fromJson;

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
  bool get is_active;
  @override
  String get created_at;
  @override
  @JsonKey(ignore: true)
  _$$SupervisortemImplCopyWith<_$SupervisortemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Role _$RoleFromJson(Map<String, dynamic> json) {
  return _Role.fromJson(json);
}

/// @nodoc
mixin _$Role {
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleCopyWith<Role> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) then) =
      _$RoleCopyWithImpl<$Res, Role>;
  @useResult
  $Res call({String value});
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
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
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
  $Res call({String value});
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
  }) {
    return _then(_$RoleImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RoleImpl extends _Role {
  const _$RoleImpl({required this.value}) : super._();

  factory _$RoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleImplFromJson(json);

  @override
  final String value;

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
  const factory _Role({required final String value}) = _$RoleImpl;
  const _Role._() : super._();

  factory _Role.fromJson(Map<String, dynamic> json) = _$RoleImpl.fromJson;

  @override
  String get value;
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
  $Res call({String value});
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
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
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
  $Res call({String value});
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
  }) {
    return _then(_$EmployeetypeImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EmployeetypeImpl extends _Employeetype {
  const _$EmployeetypeImpl({required this.value}) : super._();

  factory _$EmployeetypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeetypeImplFromJson(json);

  @override
  final String value;

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
  const factory _Employeetype({required final String value}) =
      _$EmployeetypeImpl;
  const _Employeetype._() : super._();

  factory _Employeetype.fromJson(Map<String, dynamic> json) =
      _$EmployeetypeImpl.fromJson;

  @override
  String get value;
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
  $Res call({String value});
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
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String value});
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
  }) {
    return _then(_$WorktypeImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$WorktypeImpl extends _Worktype {
  const _$WorktypeImpl({required this.value}) : super._();

  factory _$WorktypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorktypeImplFromJson(json);

  @override
  final String value;

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
  const factory _Worktype({required final String value}) = _$WorktypeImpl;
  const _Worktype._() : super._();

  factory _Worktype.fromJson(Map<String, dynamic> json) =
      _$WorktypeImpl.fromJson;

  @override
  String get value;
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
