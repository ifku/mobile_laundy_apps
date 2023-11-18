// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int code;
  String message;
  Data data;
  String error;

  LoginModel({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
    "error": error,
  };
}

class Data {
  String apiKey;
  int rolesId;
  bool isMitra;
  UserData user;

  Data({
    required this.apiKey,
    required this.rolesId,
    required this.isMitra,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    apiKey: json["api_key"],
    rolesId: json["roles_id"],
    isMitra: json["is_mitra"],
    user: UserData.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "api_key": apiKey,
    "roles_id": rolesId,
    "is_mitra": isMitra,
    "user": user.toJson(),
  };
}

class UserData {
  String userId;
  String nama;
  String noHp;
  String email;
  String username;

  UserData({
    required this.userId,
    required this.nama,
    required this.noHp,
    required this.email,
    required this.username,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    userId: json["user_id"],
    nama: json["nama"],
    noHp: json["no_hp"],
    email: json["email"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "nama": nama,
    "no_hp": noHp,
    "email": email,
    "username": username,
  };
}
