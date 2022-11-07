import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/auth_provider.dart';
import 'package:pekaku_app/src/widget/dialog/toast_allert.dart';

class ForgotPasswordViewModel with ChangeNotifier {
  AuthViewModel auth = AuthViewModel();

  final TextEditingController _emailResetController = TextEditingController();

  get emailResetController => _emailResetController;

  /// check email
  void checkEmail() {
    if (_emailResetController.text.isEmpty) {
      toastAllert(
        'Email tidak boleh kosong !',
        MyColor.errorColor,
        3,
      );
    } else {
      resetPassword();
    }
  }

  /// firebase reset account password
  Future<void> resetPassword() async {
    try {
      await auth.forgotPassword(email: _emailResetController.text);
      toastAllert(
        'Permintaan reset password sudah dikirim, Silahkan cek email Anda',
        MyColor.deepAqua,
        3,
      );
      _emailResetController.clear();
    } on FirebaseAuthException catch (e) {
      return toastAllert('${e.message}', MyColor.errorColor, 3);
    }
  }

  /// email controller dispose
  Future<void> emailControllerDispose() async {
    _emailResetController.dispose();
  }
}
