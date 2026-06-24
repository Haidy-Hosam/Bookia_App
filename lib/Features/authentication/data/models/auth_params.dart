class AuthParams {
  String? username;
  String? email;
  String? password;
  String? passwordconfirmation; 


  AuthParams({
    this.username,
    this.email,
    this.password,
    this.passwordconfirmation,
  });


  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'password_confirmation': passwordconfirmation,
    };
  }
}