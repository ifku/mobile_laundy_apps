// To parse this JSON data, do
//
//     final userOrderHistory = userOrderHistoryFromJson(jsonString);

import 'dart:convert';

UserOrderHistory userOrderHistoryFromJson(String str) => UserOrderHistory.fromJson(json.decode(str));

String userOrderHistoryToJson(UserOrderHistory data) => json.encode(data.toJson());

class UserOrderHistory {
  int code;
  String message;
  List<UserOrderData> data;
  String error;

  UserOrderHistory({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory UserOrderHistory.fromJson(Map<String, dynamic> json) => UserOrderHistory(
    code: json["code"],
    message: json["message"],
    data: List<UserOrderData>.from(json["data"].map((x) => UserOrderData.fromJson(x))),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "error": error,
  };
}

class UserOrderData {
  int id;
  DateTime tanggalPesan;
  int berat;
  int harga;
  int isDibayar;
  DateTime estimasiTanggalSelesai;
  String tanggalSelesai;
  int statusPemesananId;
  int mitraLaundryId;
  Customer customer;

  UserOrderData({
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

  factory UserOrderData.fromJson(Map<String, dynamic> json) => UserOrderData(
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
