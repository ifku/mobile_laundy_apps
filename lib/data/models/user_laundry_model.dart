// To parse this JSON data, do
//
//     final userLaundryModel = userLaundryModelFromJson(jsonString);

import 'dart:convert';

UserLaundryModel userLaundryModelFromJson(String str) =>
    UserLaundryModel.fromJson(json.decode(str));

String userLaundryModelToJson(UserLaundryModel data) =>
    json.encode(data.toJson());

class UserLaundryModel {
  int code;
  String message;
  List<Datum> data;
  String error;

  UserLaundryModel({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory UserLaundryModel.fromJson(Map<String, dynamic> json) =>
      UserLaundryModel(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
      };
}

class Datum {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String nama;
  String alamat;
  String noTelepon;
  String deskripsi;
  int hargaPerKilo;
  int ownerId;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
