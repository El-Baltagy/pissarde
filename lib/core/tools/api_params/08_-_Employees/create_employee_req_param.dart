class CreateEmployeeReqParam {
  final String name;
  final String email;
  final String password;
  final String employee_code;
  final String phone;
  final String role;
  final String employee_type;
  final String work_type;
  final String branch_id;
  final String supervisor_id;
  final String shift_id;
  final String is_active;

  const CreateEmployeeReqParam({
    required this.name,
    required this.email,
    required this.password,
    required this.employee_code,
    required this.phone,
    required this.role,
    required this.employee_type,
    required this.work_type,
    required this.branch_id,
    required this.supervisor_id,
    required this.shift_id,
    required this.is_active,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'employee_code': employee_code,
        'phone': phone,
        'role': role,
        'employee_type': employee_type,
        'work_type': work_type,
        'branch_id': branch_id,
        'supervisor_id': supervisor_id,
        'shift_id': shift_id,
        'is_active': is_active,
      };
}
