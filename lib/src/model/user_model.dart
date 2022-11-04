class UserModel {
  final String email;
  final String password;
  final String? image;
  final String? noTelp;
  final String? alamat;

  UserModel({
    required this.email,
    required this.password,
    this.image,
    this.noTelp,
    this.alamat,
  });
}