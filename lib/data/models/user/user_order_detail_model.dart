// To parse this JSON data, do
//
//     final mitraLaundryDetail = mitraLaundryDetailFromJson(jsonString);

import 'dart:convert';

UserOrderHistoryDetail mitraLaundryDetailFromJson(String str) => UserOrderHistoryDetail.fromJson(json.decode(str));

String mitraLaundryDetailToJson(UserOrderHistoryDetail data) => json.encode(data.toJson());

class UserOrderHistoryDetail {
  int code;
  String message;
  Data data;
  String error;

  UserOrderHistoryDetail({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory UserOrderHistoryDetail.fromJson(Map<String, dynamic> json) => UserOrderHistoryDetail(
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
  DateTime tanggalPesan;
  dynamic berat;
  int harga;
  int isDibayar;
  DateTime estimasiTanggalSelesai;
  dynamic tanggalSelesai;
  int statusPemesananId;
  int mitraLaundryId;
  StatusPemesanan statusPemesanan;
  MitraLaundry mitraLaundry;
  Customer customer;

  Data({
    required this.id,
    required this.tanggalPesan,
    required this.berat,
    required this.harga,
    required this.isDibayar,
    required this.estimasiTanggalSelesai,
    required this.tanggalSelesai,
    required this.statusPemesananId,
    required this.mitraLaundryId,
    required this.statusPemesanan,
    required this.mitraLaundry,
    required this.customer,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    tanggalPesan: DateTime.parse(json["tanggal_pesan"]),
    berat: json["berat"],
    harga: json["harga"],
    isDibayar: json["is_dibayar"],
    estimasiTanggalSelesai: DateTime.parse(json["estimasi_tanggal_selesai"]),
    tanggalSelesai: json["tanggal_selesai"],
    statusPemesananId: json["status_pemesanan_id"],
    mitraLaundryId: json["mitra_laundry_id"],
    statusPemesanan: StatusPemesanan.fromJson(json["status_pemesanan"]),
    mitraLaundry: MitraLaundry.fromJson(json["mitra_laundry"]),
    customer: Customer.fromJson(json["customer"]),
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
    "status_pemesanan": statusPemesanan.toJson(),
    "mitra_laundry": mitraLaundry.toJson(),
    "customer": customer.toJson(),
  };
}

class Customer {
  String userId;
  String nama;
  String noHp;
  String email;
  String username;

  Customer({
    required this.userId,
    required this.nama,
    required this.noHp,
    required this.email,
    required this.username,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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

class MitraLaundry {
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
  dynamic rating;
  String ownerId;

  MitraLaundry({
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

  factory MitraLaundry.fromJson(Map<String, dynamic> json) => MitraLaundry(
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
    "jam_buka": jamBuka,
    "gambar": gambar,
    "rating": rating,
    "owner_id": ownerId,
  };
}

class StatusPemesanan {
  int id;
  String nama;

  StatusPemesanan({
    required this.id,
    required this.nama,
  });

  factory StatusPemesanan.fromJson(Map<String, dynamic> json) => StatusPemesanan(
    id: json["id"],
    nama: json["nama"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
  };
}
