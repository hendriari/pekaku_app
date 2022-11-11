import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/helper/text_editing_controller.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/dialog/toast_allert.dart';

class LoginServices with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// user login
  Future<void> loginUser() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: TextEditing.emailLoginController.text,
        password: TextEditing.passwordLoginController.text,
      );
      TextEditing.emailLoginController.clear();
      TextEditing.passwordLoginController.clear();
    } on FirebaseAuthException catch (e) {
      return toastAllert('${e.message}', MyColor.errorColor, 1);
    }
  }
}
