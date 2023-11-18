class MitraData {
  String name;
  String nik;
  String phone;
  String username;
  String email;
  String password;

  MitraData({
    required this.name,
    required this.nik,
    required this.phone,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "nik": nik,
    "phone": phone,
    "username": username,
    "email": email,
    "password": password,
  };
}
