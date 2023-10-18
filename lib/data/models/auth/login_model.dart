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

  Data({
    required this.apiKey,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    apiKey: json["api_key"],
  );

  Map<String, dynamic> toJson() => {
    "api_key": apiKey,
  };
}
