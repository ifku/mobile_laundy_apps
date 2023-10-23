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
  String laundryPriceRange;
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
    required this.laundryPriceRange,
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
      "harga_per_kilo": laundryPriceRange,
      /* *gambar
      * rating
      * jam_buka*/
    };
  }
}
