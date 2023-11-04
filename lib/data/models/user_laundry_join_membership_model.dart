// To parse this JSON data, do
//
//     final userLaundryJoinMembership = userLaundryJoinMembershipFromJson(jsonString);

import 'dart:convert';

UserLaundryJoinMembership userLaundryJoinMembershipFromJson(String str) => UserLaundryJoinMembership.fromJson(json.decode(str));

String userLaundryJoinMembershipToJson(UserLaundryJoinMembership data) => json.encode(data.toJson());

class UserLaundryJoinMembership {
  int code;
  String message;
  Data data;
  String error;

  UserLaundryJoinMembership({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory UserLaundryJoinMembership.fromJson(Map<String, dynamic> json) => UserLaundryJoinMembership(
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
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String nama;
  String alamat;
  String noTelepon;
  String deskripsi;
  double hargaRapi;
  double hargaKering;
  double hargaBasah;
  double hargaSatuan;
  String jamBuka;
  String gambar;
  double rating;
  String ownerId;

  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.nama,
    required this.alamat,
    required this.noTelepon,
    required this.deskripsi,
    required this.hargaRapi,
    required this.hargaKering,
    required this.hargaBasah,
    required this.hargaSatuan,
    required this.jamBuka,
    required this.gambar,
    required this.rating,
    required this.ownerId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    nama: json["nama"],
    alamat: json["alamat"],
    noTelepon: json["no_telepon"],
    deskripsi: json["deskripsi"],
    hargaRapi: json["harga_rapi"]?.toDouble(),
    hargaKering: json["harga_kering"]?.toDouble(),
    hargaBasah: json["harga_basah"]?.toDouble(),
    hargaSatuan: json["harga_satuan"]?.toDouble(),
    jamBuka: json["jam_buka"],
    gambar: json["gambar"],
    rating: json["rating"]?.toDouble(),
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
    "harga_rapi": hargaRapi,
    "harga_kering": hargaKering,
    "harga_basah": hargaBasah,
    "harga_satuan": hargaSatuan,
    "jam_buka": jamBuka,
    "gambar": gambar,
    "rating": rating,
    "owner_id": ownerId,
  };
}
