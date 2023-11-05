class UserRegisterRequestModel {
  final String name;
  final String noHp;
  final String rolesId;
  final String email;
  final String userName;
  final String password;

  UserRegisterRequestModel({
    required this.name,
    required this.noHp,
    required this.rolesId,
    required this.email,
    required this.userName,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'nama': name,
      'no_hp': noHp,
      'roles_id': rolesId,
      'username': userName,
      'email': email,
      'password': password,
      'password_konfirmasi': password,
    };
  }
}
