class MitraRegisterRequestModel {
  String name;
  String nik;
  String address;
  String phone;
  String username;
  String email;
  int role_id;
  String password;

  String laundryName;
  String laundryAddress;
  String laundryPhone;
  String laundryPriceNeat;
  String laundryPriceDry;
  String laundryPriceWet;
  String laundryPriceSingle;
  String laundryDescription;

  MitraRegisterRequestModel({
    required this.name,
    required this.nik,
    required this.address,
    required this.phone,
    required this.username,
    required this.email,
    required this.role_id,
    required this.password,
    required this.laundryName,
    required this.laundryAddress,
    required this.laundryPhone,
    required this.laundryPriceNeat,
    required this.laundryPriceDry,
    required this.laundryPriceWet,
    required this.laundryPriceSingle,
    required this.laundryDescription,
  });

  Map<String, dynamic> toJson() {
    return {
      "nik": nik,
      "nama": name,
      "no_hp": phone,
      "role_id": role_id,
      "email": email,
      "username": username,
      "password": password,
      "password_konfirmasi": password,
      "nama_laundry": laundryName,
      "alamat": laundryAddress,
      "no_telepon": laundryPhone,
      "deskripsi": laundryDescription,
      "harga_rapi": laundryPriceNeat,
      "harga_kering": laundryPriceDry,
      "harga_basah": laundryPriceWet,
      "harga_satuan": laundryPriceSingle,
      /* *gambar
      * rating
      * jam_buka*/
    };
  }
}
