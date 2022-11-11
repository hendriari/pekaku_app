import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class HistoryViewModel with ChangeNotifier{

  final _getHistoryPost = FirebaseFirestore.instance
      .collection('postinganTerbaru')
      .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  get getHistoryPost => _getHistoryPost;
}