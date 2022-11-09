import 'package:flutter/widgets.dart';
import 'package:pekaku_app/models/user_model.dart';
import 'package:pekaku_app/services/firebase_services/firebase_auth_services.dart';

class UserViewModel with ChangeNotifier {
  UserModel? _user;
  final FirebaseAuthServices _authMethods = FirebaseAuthServices();

  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}