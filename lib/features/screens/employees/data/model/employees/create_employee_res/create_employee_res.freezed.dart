// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_employee_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateEmployeeRes _$CreateEmployeeResFromJson(Map<String, dynamic> json) {
  return _CreateEmployeeRes.fromJson(json);
}

/// @nodoc
mixin _$CreateEmployeeRes {
  String get message => throw _privateConstructorUsedError;
  Employee get employee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateEmployeeResCopyWith<CreateEmployeeRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEmployeeResCopyWith<$Res> {
  factory $CreateEmployeeResCopyWith(
          CreateEmployeeRes value, $Res Function(CreateEmployeeRes) then) =
      _$CreateEmployeeResCopyWithImpl<$Res, CreateEmployeeRes>;
  @useResult
  $Res call({String message, Employee employee});

  $EmployeeCopyWith<$Res> get employee;
}

/// @nodoc
class _$CreateEmployeeResCopyWithImpl<$Res, $Val extends CreateEmployeeRes>
    implements $CreateEmployeeResCopyWith<$Res> {
  _$CreateEmployeeResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? employee = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as Employee,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EmployeeCopyWith<$Res> get employee {
    return $EmployeeCopyWith<$Res>(_value.employee, (value) {
      return _then(_value.copyWith(employee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateEmployeeResImplCopyWith<$Res>
    implements $CreateEmployeeResCopyWith<$Res> {
  factory _$$CreateEmployeeResImplCopyWith(_$CreateEmployeeResImpl value,
          $Res Function(_$CreateEmployeeResImpl) then) =
      __$$CreateEmployeeResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Employee employee});

  @override
  $EmployeeCopyWith<$Res> get employee;
}

/// @nodoc
class __$$CreateEmployeeResImplCopyWithImpl<$Res>
    extends _$CreateEmployeeResCopyWithImpl<$Res, _$CreateEmployeeResImpl>
    implements _$$CreateEmployeeResImplCopyWith<$Res> {
  __$$CreateEmployeeResImplCopyWithImpl(_$CreateEmployeeResImpl _value,
      $Res Function(_$CreateEmployeeResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? employee = null,
  }) {
    return _then(_$CreateEmployeeResImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as Employee,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CreateEmployeeResImpl extends _CreateEmployeeRes {
  const _$CreateEmployeeResImpl({required this.message, required this.employee})
      : super._();

  factory _$CreateEmployeeResImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateEmployeeResImplFromJson(json);

  @override
  final String message;
  @override
  final Employee employee;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEmployeeResImplCopyWith<_$CreateEmployeeResImpl> get copyWith =>
      __$$CreateEmployeeResImplCopyWithImpl<_$CreateEmployeeResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateEmployeeResImplToJson(
      this,
    );
  }
}

abstract class _CreateEmployeeRes extends CreateEmployeeRes {
  const factory _CreateEmployeeRes(
      {required final String message,
      required final Employee employee}) = _$CreateEmployeeResImpl;
  const _CreateEmployeeRes._() : super._();

  factory _CreateEmployeeRes.fromJson(Map<String, dynamic> json) =
      _$CreateEmployeeResImpl.fromJson;

  @override
  String get message;
  @override
  Employee get employee;
  @override
  @JsonKey(ignore: true)
  _$$CreateEmployeeResImplCopyWith<_$CreateEmployeeResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return _Employee.fromJson(json);
}

/// @nodoc
mixin _$Employee {
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
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res, Employee>;
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
class _$EmployeeCopyWithImpl<$Res, $Val extends Employee>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

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
abstract class _$$EmployeeImplCopyWith<$Res>
    implements $EmployeeCopyWith<$Res> {
  factory _$$EmployeeImplCopyWith(
          _$EmployeeImpl value, $Res Function(_$EmployeeImpl) then) =
      __$$EmployeeImplCopyWithImpl<$Res>;
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
class __$$EmployeeImplCopyWithImpl<$Res>
    extends _$EmployeeCopyWithImpl<$Res, _$EmployeeImpl>
    implements _$$EmployeeImplCopyWith<$Res> {
  __$$EmployeeImplCopyWithImpl(
      _$EmployeeImpl _value, $Res Function(_$EmployeeImpl) _then)
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
    return _then(_$EmployeeImpl(
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
class _$EmployeeImpl extends _Employee {
  const _$EmployeeImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.employee_code,
      required this.phone,
      required this.role,
      required this.employee_type,
      required this.work_type,
      required this.branch,
      this.supervisor,
      required this.shift,
      required this.duty_authorized_branch_ids,
      required this.is_active,
      required this.created_at})
      : super._();

  factory _$EmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeImplFromJson(json);

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
  _$$EmployeeImplCopyWith<_$EmployeeImpl> get copyWith =>
      __$$EmployeeImplCopyWithImpl<_$EmployeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeImplToJson(
      this,
    );
  }
}

abstract class _Employee extends Employee {
  const factory _Employee(
      {required final int id,
      required final String name,
      required final String email,
      required final String employee_code,
      required final String phone,
      required final Role role,
      required final Employeetype employee_type,
      required final Worktype work_type,
      required final Branch branch,
      final Supervisor? supervisor,
      required final Shift shift,
      required final dynamic duty_authorized_branch_ids,
      required final bool is_active,
      required final String created_at}) = _$EmployeeImpl;
  const _Employee._() : super._();

  factory _Employee.fromJson(Map<String, dynamic> json) =
      _$EmployeeImpl.fromJson;

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
  _$$EmployeeImplCopyWith<_$EmployeeImpl> get copyWith =>
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
