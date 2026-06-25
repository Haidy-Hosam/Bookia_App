import 'user.dart';

class AuthData {
  User? user;
  String? token;

  AuthData({this.user, this.token});

  factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String?,
  );

  Map<String, dynamic> toJson() => {'user': user?.toJson(), 'token': token};
}
