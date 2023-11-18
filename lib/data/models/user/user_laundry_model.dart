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
  int hargaRapi;
  int hargaKering;
  int hargaBasah;
  int hargaSatuan;
  String jamBuka;
  String gambar;
  String gambarLink;
  dynamic rating;
  String ownerId;
  List<Owner> memberLaundry;
  List<Order> order;
  Owner owner;
  bool isJoined;

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
    required this.isJoined,
  });

  factory LaundryData.fromJson(Map<String, dynamic> json) => LaundryData(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    nama: json["nama"],
    alamat: json["alamat"],
    noTelepon: json["no_telepon"],
    deskripsi: json["deskripsi"],
    hargaRapi: json["harga_rapi"],
    hargaKering: json["harga_kering"],
    hargaBasah: json["harga_basah"],
    hargaSatuan: json["harga_satuan"],
    jamBuka: json["jam_buka"],
    gambar: json["gambar"],
    gambarLink: json["gambar_link"],
    rating: json["rating"],
    ownerId: json["owner_id"],
    memberLaundry: List<Owner>.from(json["member_laundry"].map((x) => Owner.fromJson(x))),
    order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
    owner: Owner.fromJson(json["owner"]),
    isJoined: json["is_joined"],
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
    "gambar_link": gambarLink,
    "rating": rating,
    "owner_id": ownerId,
    "member_laundry": List<dynamic>.from(memberLaundry.map((x) => x.toJson())),
    "order": List<dynamic>.from(order.map((x) => x.toJson())),
    "owner": owner.toJson(),
    "is_joined": isJoined,
  };
}

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
  bool isDibayar;
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
