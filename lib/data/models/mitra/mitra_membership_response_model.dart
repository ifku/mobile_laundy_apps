// To parse this JSON data, do
//
//     final mitraMembershipRequest = mitraMembershipRequestFromJson(jsonString);

import 'dart:convert';

MitraMembershipResponse mitraMembershipRequestFromJson(String str) => MitraMembershipResponse.fromJson(json.decode(str));

String mitraMembershipRequestToJson(MitraMembershipResponse data) => json.encode(data.toJson());

class MitraMembershipResponse {
  int code;
  String message;
  Data data;
  String error;

  MitraMembershipResponse({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory MitraMembershipResponse.fromJson(Map<String, dynamic> json) => MitraMembershipResponse(
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
  int harga;
  int estimasiTanggalSelesai;
  String customerId;
  int statusPemesananId;
  int mitraLaundryId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.harga,
    required this.estimasiTanggalSelesai,
    required this.customerId,
    required this.statusPemesananId,
    required this.mitraLaundryId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    harga: json["harga"],
    estimasiTanggalSelesai: json["estimasi_tanggal_selesai"],
    customerId: json["customer_id"],
    statusPemesananId: json["status_pemesanan_id"],
    mitraLaundryId: json["mitra_laundry_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "harga": harga,
    "estimasi_tanggal_selesai": estimasiTanggalSelesai,
    "customer_id": customerId,
    "status_pemesanan_id": statusPemesananId,
    "mitra_laundry_id": mitraLaundryId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
