class ForgetPasswordParameter{
  ForgetPasswordParameter(this.email);
  final String email;
 Map<String,dynamic> toJson()=>{
    'email': email
  };

}
