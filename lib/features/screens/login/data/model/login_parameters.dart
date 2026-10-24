class LoginParameters {
  LoginParameters(this.email, this.password);

  final String email, password;

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
