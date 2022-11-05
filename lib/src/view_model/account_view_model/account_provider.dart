import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/model/user_model.dart';

class AccountViewModel with ChangeNotifier {
  UserModel _userModel = UserModel();

  get userModel => _userModel;

  Future<void> specifyDataUSer() async {
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      _userModel = UserModel.fromMap(value.data());
    });
    notifyListeners();
  }
}
