import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/models/user_model.dart';
import 'package:pekaku_app/services/firebase_services/firebase_storage_services.dart';

class FirebaseAuthServices with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// detail user
  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('penggunaBaru').doc(currentUser.uid).get();

    return UserModel.fromSnap(documentSnapshot);
  }


  Future<void> signOut() async {
    await _auth.signOut();
  }
}
