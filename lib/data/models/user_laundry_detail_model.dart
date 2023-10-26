// To parse this JSON data, do
//
//     final userLaundryDetailModel = userLaundryDetailModelFromJson(jsonString);

import 'dart:convert';

UserLaundryDetailModel userLaundryDetailModelFromJson(String str) => UserLaundryDetailModel.fromJson(json.decode(str));

String userLaundryDetailModelToJson(UserLaundryDetailModel data) => json.encode(data.toJson());

class UserLaundryDetailModel {
  int code;
  String message;
  LaundryDetailData data;
  String error;

  UserLaundryDetailModel({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory UserLaundryDetailModel.fromJson(Map<String, dynamic> json) => UserLaundryDetailModel(
    code: json["code"],
    message: json["message"],
    data: LaundryDetailData.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
    "error": error,
  };
}

class LaundryDetailData {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String nama;
  String alamat;
  String noTelepon;
  String deskripsi;
  int hargaPerKilo;
  String jamBuka;
  String gambar;
  String gambarLink;
  double rating;
  String ownerId;
  List<MemberLaundry> memberLaundry;
  List<dynamic> order;
  dynamic owner;

  LaundryDetailData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.nama,
    required this.alamat,
    required this.noTelepon,
    required this.deskripsi,
    required this.hargaPerKilo,
    required this.jamBuka,
    required this.gambar,
    required this.gambarLink,
    required this.rating,
    required this.ownerId,
    required this.memberLaundry,
    required this.order,
    required this.owner,
  });

  factory LaundryDetailData.fromJson(Map<String, dynamic> json) => LaundryDetailData(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    nama: json["nama"],
    alamat: json["alamat"],
    noTelepon: json["no_telepon"],
    deskripsi: json["deskripsi"],
    hargaPerKilo: json["harga_per_kilo"],
    jamBuka: json["jam_buka"],
    gambar: json["gambar"],
    gambarLink: json["gambar_link"],
    rating: json["rating"]?.toDouble(),
    ownerId: json["owner_id"],
    memberLaundry: List<MemberLaundry>.from(json["member_laundry"].map((x) => MemberLaundry.fromJson(x))),
    order: List<dynamic>.from(json["order"].map((x) => x)),
    owner: json["owner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "nama": nama,
    "alamat": alamat,
    "no_telepon": noTelepon,
    "deskripsi": deskripsi,
    "harga_per_kilo": hargaPerKilo,
    "jam_buka": jamBuka,
    "gambar": gambar,
    "gambar_link": gambarLink,
    "rating": rating,
    "owner_id": ownerId,
    "member_laundry": List<dynamic>.from(memberLaundry.map((x) => x.toJson())),
    "order": List<dynamic>.from(order.map((x) => x)),
    "owner": owner,
  };
}

class MemberLaundry {
  String userId;
  String nama;
  String noHp;
  String email;
  String username;

  MemberLaundry({
    required this.userId,
    required this.nama,
    required this.noHp,
    required this.email,
    required this.username,
  });

  factory MemberLaundry.fromJson(Map<String, dynamic> json) => MemberLaundry(
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
