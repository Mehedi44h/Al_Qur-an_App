// To parse this JSON data, do
//
//     final signupData = signupDataFromJson(jsonString);

import 'dart:convert';

SignupData signupDataFromJson(String str) =>
    SignupData.fromJson(json.decode(str));

String signupDataToJson(SignupData data) => json.encode(data.toJson());

class SignupData {
  SignupData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory SignupData.fromJson(Map<dynamic, dynamic> json) => SignupData(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.user,
    required this.token,
    required this.email_verified,
  });

  User user;
  String token;
  bool? email_verified;
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        token: json["token"],
        email_verified: json["email_verified"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
        "email_verified": email_verified,
      };
}

class User {
  User({
    required this.name,
    required this.email,
    required this.password,
    this.loginType,
    required this.id,
  });

  String name;
  String email;
  String password;
  dynamic loginType;

  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        loginType: json["login_type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "login_type": loginType,
        "id": id,
      };
}
