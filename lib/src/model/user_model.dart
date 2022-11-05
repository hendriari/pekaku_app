class UserModel {
  String? uid;
  String? email;
  String? name;
  String? image;
  String? kelamin;
  String? alamat;
  String? tanggallahir;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.image,
    this.kelamin,
    this.alamat,
    this.tanggallahir,
  });

  /// data dari server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      kelamin: map['kelamin'],
      image: map['image'],
      alamat: map['alamat'],
      tanggallahir: map['tanggallahir'],
    );
  }

  /// kirim data ke server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'kelamin' : kelamin,
      'image': image,
      'alamat': alamat,
      'tanggallahir': tanggallahir,
    };
  }
}
