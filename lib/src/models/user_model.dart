import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String alamat;
  final String tanggallahir;
  final String jeniskelamin;

  const UserModel({
    required this.username,
    required this.uid,
    required this.photoUrl,
    required this.email,
    required this.alamat,
    required this.tanggallahir,
    required this.jeniskelamin,
  });

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      alamat: snapshot["alamat"],
      tanggallahir: snapshot["tanggallahir"],
      jeniskelamin: snapshot["jeniskelamin"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "alamat": alamat,
        "tanggallahir": tanggallahir,
        "jeniskelamin": jeniskelamin,
      };
}
