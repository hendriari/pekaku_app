import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AccountViewModel with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late final CollectionReference _users = _firestore.collection('users');

  late final _usersFirestore = _users.snapshots();

  get usersFirestore => _usersFirestore;
}
