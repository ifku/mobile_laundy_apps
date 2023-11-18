// To parse this JSON data, do
//
//     final mitraOrder = mitraOrderFromJson(jsonString);

import 'dart:convert';

MitraOrder mitraOrderFromJson(String str) => MitraOrder.fromJson(json.decode(str));

String mitraOrderToJson(MitraOrder data) => json.encode(data.toJson());

class MitraOrder {
  int code;
  String message;
  List<MitraOrderData> data;

  MitraOrder({
    required this.code,
    required this.message,
    required this.data,
  });

  factory MitraOrder.fromJson(Map<String, dynamic> json) => MitraOrder(
    code: json["code"],
    message: json["message"],
    data: List<MitraOrderData>.from(json["data"].map((x) => MitraOrderData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MitraOrderData {
  int id;
  DateTime tanggalPesan;
  int berat;
  int harga;
  bool isDibayar;
  DateTime estimasiTanggalSelesai;
  String tanggalSelesai;
  int statusPemesananId;
  int mitraLaundryId;
  Customer customer;

  MitraOrderData({
    required this.id,
    required this.tanggalPesan,
    required this.berat,
    required this.harga,
    required this.isDibayar,
    required this.estimasiTanggalSelesai,
    required this.tanggalSelesai,
    required this.statusPemesananId,
    required this.mitraLaundryId,
    required this.customer,
  });

  factory MitraOrderData.fromJson(Map<String, dynamic> json) => MitraOrderData(
    id: json["id"],
    tanggalPesan: DateTime.parse(json["tanggal_pesan"]),
    berat: json["berat"],
    harga: json["harga"],
    isDibayar: json["is_dibayar"],
    estimasiTanggalSelesai: DateTime.parse(json["estimasi_tanggal_selesai"]),
    tanggalSelesai: json["tanggal_selesai"],
    statusPemesananId: json["status_pemesanan_id"],
    mitraLaundryId: json["mitra_laundry_id"],
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
