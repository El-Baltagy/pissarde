class UpdateEmployeeReqParam {
  final String name;
  final String phone;
  final String is_active;

  const UpdateEmployeeReqParam({
    required this.name,
    required this.phone,
    required this.is_active,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'is_active': is_active,
      };
}
