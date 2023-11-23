// To parse this JSON data, do
//
//     final userLaundryJamOperasional = userLaundryJamOperasionalFromJson(jsonString);

import 'dart:convert';

UserLaundryJamOperasional userLaundryJamOperasionalFromJson(String str) => UserLaundryJamOperasional.fromJson(json.decode(str));

String userLaundryJamOperasionalToJson(UserLaundryJamOperasional data) => json.encode(data.toJson());

class UserLaundryJamOperasional {
  int code;
  String message;
  JamOperasionalData data;
  String error;

  UserLaundryJamOperasional({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory UserLaundryJamOperasional.fromJson(Map<String, dynamic> json) => UserLaundryJamOperasional(
    code: json["code"],
    message: json["message"],
    data: JamOperasionalData.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
    "error": error,
  };
}

class JamOperasionalData {
  String jamOperasionalSenin;
  String jamOperasionalSelasa;
  String jamOperasionalRabu;
  String jamOperasionalKamis;
  String jamOperasionalJumat;
  String jamOperasionalSabtu;
  String jamOperasionalMinggu;

  JamOperasionalData({
    required this.jamOperasionalSenin,
    required this.jamOperasionalSelasa,
    required this.jamOperasionalRabu,
    required this.jamOperasionalKamis,
    required this.jamOperasionalJumat,
    required this.jamOperasionalSabtu,
    required this.jamOperasionalMinggu,
  });

  factory JamOperasionalData.fromJson(Map<String, dynamic> json) => JamOperasionalData(
    jamOperasionalSenin: json["jam_operasional_senin"],
    jamOperasionalSelasa: json["jam_operasional_selasa"],
    jamOperasionalRabu: json["jam_operasional_rabu"],
    jamOperasionalKamis: json["jam_operasional_kamis"],
    jamOperasionalJumat: json["jam_operasional_jumat"],
    jamOperasionalSabtu: json["jam_operasional_sabtu"],
    jamOperasionalMinggu: json["jam_operasional_minggu"],
  );

  Map<String, dynamic> toJson() => {
    "jam_operasional_senin": jamOperasionalSenin,
    "jam_operasional_selasa": jamOperasionalSelasa,
    "jam_operasional_rabu": jamOperasionalRabu,
    "jam_operasional_kamis": jamOperasionalKamis,
    "jam_operasional_jumat": jamOperasionalJumat,
    "jam_operasional_sabtu": jamOperasionalSabtu,
    "jam_operasional_minggu": jamOperasionalMinggu,
  };
}
