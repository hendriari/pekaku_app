import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pekaku_app/src/models/user_model.dart';

class FirebaseAuthServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// detail user
  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot = await _firestore
        .collection('penggunaTerbaru')
        .doc(currentUser.uid)
        .get();

    return UserModel.fromSnap(documentSnapshot);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
