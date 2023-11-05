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
  List<Owner> memberLaundry;
  List<Order> order;
  Owner owner;

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
    hargaRapi: json["harga_rapi"]?.toDouble(),
    hargaKering: json["harga_kering"]?.toDouble(),
    hargaBasah: json["harga_basah"]?.toDouble(),
    hargaSatuan: json["harga_satuan"]?.toDouble(),
    jamBuka: json["jam_buka"],
    gambar: gambarValues.map[json["gambar"]]!,
    gambarLink: json["gambar_link"],
    rating: json["rating"],
    ownerId: json["owner_id"],
    memberLaundry: List<Owner>.from(json["member_laundry"].map((x) => Owner.fromJson(x))),
    order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
    owner: Owner.fromJson(json["owner"]),
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
    "owner_id": ownerId,
    "member_laundry": List<dynamic>.from(memberLaundry.map((x) => x.toJson())),
    "order": List<dynamic>.from(order.map((x) => x.toJson())),
    "owner": owner.toJson(),
  };
}

enum Gambar {
  EMPTY,
  TEST,
  THE_20231023134834_D_W5_U_YW1_L_ZC5_WBMC_PNG
}

final gambarValues = EnumValues({
  "": Gambar.EMPTY,
  "test": Gambar.TEST,
  "20231023134834dW5uYW1lZC5wbmc=.png": Gambar.THE_20231023134834_D_W5_U_YW1_L_ZC5_WBMC_PNG
});

class Owner {
  String userId;
  String nama;
  String noHp;
  String email;
  String username;

  Owner({
    required this.userId,
    required this.nama,
    required this.noHp,
    required this.email,
    required this.username,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
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

class Order {
  int id;
  DateTime tanggalPesan;
  int berat;
  int harga;
  int isDibayar;
  DateTime estimasiTanggalSelesai;
  String tanggalSelesai;
  int statusPemesananId;
  int mitraLaundryId;

  Order({
    required this.id,
    required this.tanggalPesan,
    required this.berat,
    required this.harga,
    required this.isDibayar,
    required this.estimasiTanggalSelesai,
    required this.tanggalSelesai,
    required this.statusPemesananId,
    required this.mitraLaundryId,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    tanggalPesan: DateTime.parse(json["tanggal_pesan"]),
    berat: json["berat"],
    harga: json["harga"],
    isDibayar: json["is_dibayar"],
    estimasiTanggalSelesai: DateTime.parse(json["estimasi_tanggal_selesai"]),
    tanggalSelesai: json["tanggal_selesai"],
    statusPemesananId: json["status_pemesanan_id"],
    mitraLaundryId: json["mitra_laundry_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tanggal_pesan": tanggalPesan.toIso8601String(),
    "berat": berat,
    "harga": harga,
    "is_dibayar": isDibayar,
    "estimasi_tanggal_selesai": estimasiTanggalSelesai.toIso8601String(),
    "tanggal_selesai": tanggalSelesai,
    "status_pemesanan_id": statusPemesananId,
    "mitra_laundry_id": mitraLaundryId,
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
