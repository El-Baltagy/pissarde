class LoginReqParam {
  final String email;
  final String password;
  final String device_name;
  final String? device_id;

  const LoginReqParam({
    required this.email,
    required this.password,
    required this.device_name,
    this.device_id,
  });

  LoginReqParam copyWith({
    String? email,
    String? password,
    String? device_name,
    String? device_id,
  }) {
    return LoginReqParam(
      email: email ?? this.email,
      password: password ?? this.password,
      device_name: device_name ?? this.device_name,
      device_id: device_id ?? this.device_id,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'device_name': device_name,
        if (device_id != null) 'device_id': device_id,
      };
}
