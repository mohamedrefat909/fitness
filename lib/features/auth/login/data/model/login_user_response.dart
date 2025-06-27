class LoginUserRequest {
final String email;
final String password;
//final bool rememberMe;
LoginUserRequest({/*required this.rememberMe*/required this.email , required this.password});

Map<String,dynamic> toJson(){
  return {
    "email":email,
    "password":password
  };
}
}