import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/utils/text_editing_controller.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/dialog/toast_allert.dart';

class LoginServices with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late bool _loginLoading = false;

  get loginLoading => _loginLoading;

  /// user login
  Future<void> loginUser() async {
    _loginLoading = true;
    notifyListeners();
    try {
      await _auth.signInWithEmailAndPassword(
        email: TextEditing.emailLoginController.text,
        password: TextEditing.passwordLoginController.text,
      );
      TextEditing.emailLoginController.clear();
      TextEditing.passwordLoginController.clear();
      _loginLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _loginLoading = false;
      return toastAllert('${e.message}', MyColor.errorColor, 1);
    }
  }
}
