// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  int code;
  String message;
  Data data;
  String error;

  Login({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
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
