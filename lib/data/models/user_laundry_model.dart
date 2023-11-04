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
  double hargaRapi;
  double hargaKering;
  double hargaBasah;
  double hargaSatuan;
  String jamBuka;
  Gambar gambar;
  String gambarLink;
  dynamic rating;
  String ownerId;

  LaundryData({
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
    required this.gambarLink,
    required this.rating,
    required this.ownerId,
  });

  factory LaundryData.fromJson(Map<String, dynamic> json) => LaundryData(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    nama: json["nama"]!,
    alamat: json["alamat"],
    noTelepon: json["no_telepon"],
    deskripsi: json["deskripsi"],
    hargaRapi: json["harga_rapi"]?.toDouble(),
    hargaKering: json["harga_kering"]?.toDouble(),
    hargaBasah: json["harga_basah"]?.toDouble(),
    hargaSatuan: json["harga_satuan"]?.toDouble(),
    jamBuka: json["jam_buka"],
    gambar: gambarValues.map[json["gambar"]]!,
    gambarLink: json["gambar_link"],
    rating: json["rating"],
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
    "jam_buka": jamBukaValues.reverse[jamBuka],
    "gambar": gambarValues.reverse[gambar],
    "gambar_link": gambarLink,
    "rating": rating,
  };
}

enum Gambar {
  NULL,
  TEST,
  THE_20231023134834_D_W5_U_YW1_L_ZC5_WBMC_PNG
}

final gambarValues = EnumValues({
  "null": Gambar.NULL,
  "test": Gambar.TEST,
  "20231023134834dW5uYW1lZC5wbmc=.png": Gambar.THE_20231023134834_D_W5_U_YW1_L_ZC5_WBMC_PNG
});

enum JamBuka {
  NULL,
  THE_0000_AM_0000_PM
}

final jamBukaValues = EnumValues({
  "null": JamBuka.NULL,
  "00.00 AM - 00.00 PM": JamBuka.THE_0000_AM_0000_PM
});

class MemberLaundry {
  String userId;
  String nik;
  String nama;
  String noHp;
  String email;
  String username;
  String password;
  Gambar passwordSalt;
  int rolesId;
  dynamic isAktif;
  int? jumlahSalahLogin;
  dynamic terkunciPada;
  DateTime createdAt;
  DateTime updatedAt;
  Gambar checksumId;
  Gambar apiKey;
  Pivot? pivot;

  MemberLaundry({
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
    this.pivot,
  });

  factory MemberLaundry.fromJson(Map<String, dynamic> json) => MemberLaundry(
    userId: json["user_id"],
    nik: json["nik"],
    nama: json["nama"],
    noHp: json["no_hp"],
    email: json["email"],
    username: json["username"],
    password: json["password"],
    passwordSalt: gambarValues.map[json["password_salt"]]!,
    rolesId: json["roles_id"],
    isAktif: json["is_aktif"],
    jumlahSalahLogin: json["jumlah_salah_login"],
    terkunciPada: json["terkunci_pada"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    checksumId: gambarValues.map[json["checksum_id"]]!,
    apiKey: gambarValues.map[json["api_key"]]!,
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "nik": nik,
    "nama": nama,
    "no_hp": noHp,
    "email": email,
    "username": username,
    "password": password,
    "password_salt": gambarValues.reverse[passwordSalt],
    "roles_id": rolesId,
    "is_aktif": isAktif,
    "jumlah_salah_login": jumlahSalahLogin,
    "terkunci_pada": terkunciPada,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "checksum_id": gambarValues.reverse[checksumId],
    "api_key": gambarValues.reverse[apiKey],
    "pivot": pivot?.toJson(),
  };
}

class Pivot {
  int mitraLaundryId;
  String memberId;

  Pivot({
    required this.mitraLaundryId,
    required this.memberId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    mitraLaundryId: json["mitra_laundry_id"],
    memberId: json["member_id"],
  );

  Map<String, dynamic> toJson() => {
    "mitra_laundry_id": mitraLaundryId,
    "member_id": memberId,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
