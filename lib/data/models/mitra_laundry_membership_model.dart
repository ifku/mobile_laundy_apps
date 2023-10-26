// To parse this JSON data, do
//
//     final mitraLaundryMembership = mitraLaundryMembershipFromJson(jsonString);

import 'dart:convert';

MitraLaundryMembership mitraLaundryMembershipFromJson(String str) => MitraLaundryMembership.fromJson(json.decode(str));

String mitraLaundryMembershipToJson(MitraLaundryMembership data) => json.encode(data.toJson());

class MitraLaundryMembership {
  int code;
  String message;
  List<MitraLaundryMembershipData> data;
  String error;

  MitraLaundryMembership({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory MitraLaundryMembership.fromJson(Map<String, dynamic> json) => MitraLaundryMembership(
    code: json["code"],
    message: json["message"],
    data: List<MitraLaundryMembershipData>.from(json["data"].map((x) => MitraLaundryMembershipData.fromJson(x))),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "error": error,
  };
}

class MitraLaundryMembershipData {
  String userId;
  String nama;
  String noHp;
  String email;
  String username;

  MitraLaundryMembershipData({
    required this.userId,
    required this.nama,
    required this.noHp,
    required this.email,
    required this.username,
  });

  factory MitraLaundryMembershipData.fromJson(Map<String, dynamic> json) => MitraLaundryMembershipData(
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
