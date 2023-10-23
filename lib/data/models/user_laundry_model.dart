// To parse this JSON data, do
//
//     final userLaundryModel = userLaundryModelFromJson(jsonString);

import 'dart:convert';

UserLaundryModel userLaundryModelFromJson(String str) => UserLaundryModel.fromJson(json.decode(str));

String userLaundryModelToJson(UserLaundryModel data) => json.encode(data.toJson());

class UserLaundryModel {
  int code;
  String message;
  List<LaundryData> data;
  String error;

  UserLaundryModel({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory UserLaundryModel.fromJson(Map<String, dynamic> json) => UserLaundryModel(
    code: json["code"],
    message: json["message"],
    data: List<LaundryData>.from(json["data"].map((x) => LaundryData.fromJson(x))),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "error": error,
  };
}

class LaundryData {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String nama;
  String alamat;
  String noTelepon;
  String deskripsi;
  int hargaPerKilo;
  String jamBuka;
  String gambar;
  dynamic rating;
  String ownerId;
  List<dynamic> memberLaundry;
  List<dynamic> order;
  Owner? owner;

  LaundryData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.nama,
    required this.alamat,
    required this.noTelepon,
    required this.deskripsi,
    required this.hargaPerKilo,
    required this.jamBuka,
    required this.gambar,
    required this.rating,
    required this.ownerId,
    required this.memberLaundry,
    required this.order,
    required this.owner,
  });

  factory LaundryData.fromJson(Map<String, dynamic> json) => LaundryData(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    nama: json["nama"],
    alamat: json["alamat"],
    noTelepon: json["no_telepon"],
    deskripsi: json["deskripsi"],
    hargaPerKilo: json["harga_per_kilo"],
    jamBuka: json["jam_buka"],
    gambar: json["gambar"],
    rating: json["rating"],
    ownerId: json["owner_id"],
    memberLaundry: List<dynamic>.from(json["memberLaundry"].map((x) => x)),
    order: List<dynamic>.from(json["order"].map((x) => x)),
    owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
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
    "jam_buka": jamBuka,
    "gambar": gambar,
    "rating": rating,
    "owner_id": ownerId,
    "memberLaundry": List<dynamic>.from(memberLaundry.map((x) => x)),
    "order": List<dynamic>.from(order.map((x) => x)),
    "owner": owner?.toJson(),
  };
}

class Owner {
  String userId;
  String nik;
  String nama;
  String noHp;
  String email;
  String username;
  String password;
  dynamic passwordSalt;
  int rolesId;
  dynamic isAktif;
  dynamic jumlahSalahLogin;
  dynamic terkunciPada;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic checksumId;
  dynamic apiKey;

  Owner({
    required this.userId,
    required this.nik,
    required this.nama,
    required this.noHp,
    required this.email,
    required this.username,
    required this.password,
    required this.passwordSalt,
    required this.rolesId,
    required this.isAktif,
    required this.jumlahSalahLogin,
    required this.terkunciPada,
    required this.createdAt,
    required this.updatedAt,
    required this.checksumId,
    required this.apiKey,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    userId: json["user_id"],
    nik: json["nik"],
    nama: json["nama"],
    noHp: json["no_hp"],
    email: json["email"],
    username: json["username"],
    password: json["password"],
    passwordSalt: json["password_salt"],
    rolesId: json["roles_id"],
    isAktif: json["is_aktif"],
    jumlahSalahLogin: json["jumlah_salah_login"],
    terkunciPada: json["terkunci_pada"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    checksumId: json["checksum_id"],
    apiKey: json["api_key"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "nik": nik,
    "nama": nama,
    "no_hp": noHp,
    "email": email,
    "username": username,
    "password": password,
    "password_salt": passwordSalt,
    "roles_id": rolesId,
    "is_aktif": isAktif,
    "jumlah_salah_login": jumlahSalahLogin,
    "terkunci_pada": terkunciPada,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "checksum_id": checksumId,
    "api_key": apiKey,
  };
}
