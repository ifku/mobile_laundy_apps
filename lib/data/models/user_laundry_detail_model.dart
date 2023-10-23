// To parse this JSON data, do
//
//     final userLaundryDetailModel = userLaundryDetailModelFromJson(jsonString);

import 'dart:convert';

UserLaundryDetailModel userLaundryDetailModelFromJson(String str) => UserLaundryDetailModel.fromJson(json.decode(str));

String userLaundryDetailModelToJson(UserLaundryDetailModel data) => json.encode(data.toJson());

class UserLaundryDetailModel {
  int code;
  String message;
  LaundryDetailData data;
  String error;

  UserLaundryDetailModel({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory UserLaundryDetailModel.fromJson(Map<String, dynamic> json) => UserLaundryDetailModel(
    code: json["code"],
    message: json["message"],
    data: LaundryDetailData.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
    "error": error,
  };
}

class LaundryDetailData {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String nama;
  String alamat;
  String noTelepon;
  String deskripsi;
  int hargaPerKilo;
  String ownerId;

  LaundryDetailData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.nama,
    required this.alamat,
    required this.noTelepon,
    required this.deskripsi,
    required this.hargaPerKilo,
    required this.ownerId,
  });

  factory LaundryDetailData.fromJson(Map<String, dynamic> json) => LaundryDetailData(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    nama: json["nama"],
    alamat: json["alamat"],
    noTelepon: json["no_telepon"],
    deskripsi: json["deskripsi"],
    hargaPerKilo: json["harga_per_kilo"],
    ownerId: json["owner_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "nama": nama,
    "alamat": alamat,
    "no_telepon": noTelepon,
    "deskripsi": deskripsi,
    "harga_per_kilo": hargaPerKilo,
    "owner_id": ownerId,
  };
}
