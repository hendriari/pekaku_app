import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/helper/text_editing_controller.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/widgets/dialog/toast_allert.dart';

class ChangePasswordServices with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// check email
  void checkEmail() {
    if (TextEditing.resetPasswordController.text.isEmpty) {
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
      await _firebaseAuth.sendPasswordResetEmail(
        email: TextEditing.resetPasswordController.text,
      );
      toastAllert(
        'Permintaan reset password sudah dikirim, Silahkan cek email Anda',
        MyColor.deepAqua,
        3,
      );
      TextEditing.resetPasswordController.clear();
    } on FirebaseAuthException catch (e) {
      return toastAllert('${e.message}', MyColor.errorColor, 3);
    }
  }
}
