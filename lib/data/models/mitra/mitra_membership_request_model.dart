// To parse this JSON data, do
//
//     final mitraMembershipRequestModel = mitraMembershipRequestModelFromJson(jsonString);

import 'dart:convert';

MitraMembershipRequestModel mitraMembershipRequestModelFromJson(String str) =>
    MitraMembershipRequestModel.fromJson(json.decode(str));

String mitraMembershipRequestModelToJson(MitraMembershipRequestModel data) =>
    json.encode(data.toJson());

class MitraMembershipRequestModel {
  String harga;
  String estimasiTanggalSelesai;
  String customerId;
  String statusPemesananId;
  bool isDibayar;

  MitraMembershipRequestModel({
    required this.harga,
    required this.estimasiTanggalSelesai,
    required this.customerId,
    required this.statusPemesananId,
    required this.isDibayar,
  });

  factory MitraMembershipRequestModel.fromJson(Map<String, dynamic> json) =>
      MitraMembershipRequestModel(
        harga: json["harga"],
        estimasiTanggalSelesai: json["estimasi_tanggal_selesai"],
        customerId: json["customer_id"],
        statusPemesananId: json["status_pemesanan_id"],
        isDibayar: json["is_dibayar"],
      );

  Map<String, dynamic> toJson() => {
        "harga": harga,
        "estimasi_tanggal_selesai": estimasiTanggalSelesai,
        "customer_id": customerId,
        "status_pemesanan_id": statusPemesananId,
        "is_dibayar": isDibayar.toString(),
      };
}
