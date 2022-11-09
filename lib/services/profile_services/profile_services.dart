import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ProfileServices with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // var _userData = {};
  // late int _postLen = 0;
  // late bool _isLoading;
  //
  // get posLen => _postLen;
  //
  // get isLoading => _isLoading;
  //
  // get userData => _userData;

  var _userData = {};
  late int _postLen = 0;
  late bool _isLoading;

  Future<void> getUserData() async {

    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('penggunaBaru')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();

      // get post lENGTH
      var postSnap = await _firestore
          .collection('penggunaBaru')
          .where('uid', isEqualTo: _firebaseAuth.currentUser!.uid)
          .get();

      _postLen = postSnap.docs.length;
      _userData = userSnap.data()!;
      // _followers = userSnap.data()!['followers'].length;
      // _following = userSnap.data()!['following'].length;
      // _isFollowing = userSnap
      //     .data()!['followers']
      //     .contains(_firebaseAuth.currentUser!.uid);
    } catch (e) {
      debugPrint(e.toString());
    }

  }



  get posLen => _postLen;

  get isLoading => _isLoading;

  get userData => _userData;
}
