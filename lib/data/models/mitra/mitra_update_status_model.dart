// To parse this JSON data, do
//
//     final mitraUpdateStatus = mitraUpdateStatusFromJson(jsonString);

import 'dart:convert';

String mitraUpdateStatusToJson(MitraUpdateStatus data) => json.encode(data.toJson());

class MitraUpdateStatus {
  int statusPemesananId;
  bool isDibayar;

  MitraUpdateStatus({
    required this.statusPemesananId,
    required this.isDibayar,
  });

  Map<String, dynamic> toJson() => {
    "status_pemesanan_id": statusPemesananId,
    "is_dibayar": isDibayar,
  };
}
