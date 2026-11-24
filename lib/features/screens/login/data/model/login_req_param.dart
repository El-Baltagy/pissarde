class LoginReqParam {
  final String email;
  final String password;

  // final String device_name;
  final String? device_id;

  const LoginReqParam({
    required this.email,
    required this.password,
    // required this.device_name,
    this.device_id,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    if (device_id != null) 'device_name': device_id,
    // if (device_id != null) 'device_id': device_id,
  };
}
