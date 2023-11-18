// To parse this JSON data, do
//
//     final mitraRegisterRequestModel = mitraRegisterRequestModelFromJson(jsonString);

import 'dart:convert';

MitraRegisterRequestModel mitraRegisterRequestModelFromJson(String str) => MitraRegisterRequestModel.fromJson(json.decode(str));

String mitraRegisterRequestModelToJson(MitraRegisterRequestModel data) => json.encode(data.toJson());

class MitraRegisterRequestModel {
  String nik;
  String nama;
  String noHp;
  String rolesId;
  String email;
  String username;
  String password;
  String passwordKonfirmasi;
  String namaLaundry;
  String alamat;
  String noTelepon;
  String deskripsi;
  String hargaRapi;
  String hargaKering;
  String hargaSatuan;
  String hargaBasah;
  String gambar;
  String jamBuka;

  MitraRegisterRequestModel({
    required this.nik,
    required this.nama,
    required this.noHp,
    required this.rolesId,
    required this.email,
    required this.username,
    required this.password,
    required this.passwordKonfirmasi,
    required this.namaLaundry,
    required this.alamat,
    required this.noTelepon,
    required this.deskripsi,
    required this.hargaRapi,
    required this.hargaKering,
    required this.hargaSatuan,
    required this.hargaBasah,
    required this.gambar,
    required this.jamBuka,
  });

  factory MitraRegisterRequestModel.fromJson(Map<String, dynamic> json) => MitraRegisterRequestModel(
    nik: json["nik"],
    nama: json["nama"],
    noHp: json["no_hp"],
    rolesId: json["roles_id"],
    email: json["email"],
    username: json["username"],
    password: json["password"],
    passwordKonfirmasi: json["password_konfirmasi"],
    namaLaundry: json["nama_laundry"],
    alamat: json["alamat"],
    noTelepon: json["no_telepon"],
    deskripsi: json["deskripsi"],
    hargaRapi: json["harga_rapi"],
    hargaKering: json["harga_kering"],
    hargaSatuan: json["harga_satuan"],
    hargaBasah: json["harga_basah"],
    gambar: json["gambar"],
    jamBuka: json["jam_buka"],
  );

  Map<String, dynamic> toJson() => {
    "nik": nik,
    "nama": nama,
    "no_hp": noHp,
    "roles_id": rolesId,
    "email": email,
    "username": username,
    "password": password,
    "password_konfirmasi": passwordKonfirmasi,
    "nama_laundry": namaLaundry,
    "alamat": alamat,
    "no_telepon": noTelepon,
    "deskripsi": deskripsi,
    "harga_rapi": hargaRapi,
    "harga_kering": hargaKering,
    "harga_satuan": hargaSatuan,
    "harga_basah": hargaBasah,
    // "gambar": gambar,
    // "jam_buka": jamBuka,
  };
}
