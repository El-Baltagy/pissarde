class LoginReqParam {
  final String email;
  final String password;
  final String device_name;

  const LoginReqParam({
    required this.email,
    required this.password,
    required this.device_name,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'device_name': device_name,
      };
}
