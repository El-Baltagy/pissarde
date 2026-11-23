class ListEmployeesReqParam {
  final String search;
  final String branch_id;
  final String role;
  final String employee_type;
  final String work_type;

  const ListEmployeesReqParam({
    required this.search,
    required this.branch_id,
    required this.role,
    required this.employee_type,
    required this.work_type,
  });

  Map<String, dynamic> toJson() => {
        'search': search,
        'branch_id': branch_id,
        'role': role,
        'employee_type': employee_type,
        'work_type': work_type,
      };
}
