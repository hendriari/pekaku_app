import 'package:firebase_auth/firebase_auth.dart';
import 'package:pekaku_app/src/helper/text_editing_controller.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/dialog/toast_allert.dart';

class ChangePasswordServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
