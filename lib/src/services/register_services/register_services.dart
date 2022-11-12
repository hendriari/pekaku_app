import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/utils/text_editing_controller.dart';
import 'package:pekaku_app/src/models/user_model.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/src/widgets/dialog/toast_allert.dart';
import 'package:provider/provider.dart';

class RegisterServices with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// register
  Future<void> signUpUser(context) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: TextEditing.emailRegisterController.text,
        password: TextEditing.passwordRegisterController.text,
      );

      UserModel userModel = UserModel(
        username: TextEditing.usernameRegisterController.text,
        uid: cred.user!.uid,
        photoUrl:
            'https://cdn3d.iconscout.com/3d/premium/thumb/man-avatar-6299539-5187871.png',
        email: TextEditing.emailRegisterController.text,
        alamat: TextEditing.alamatRegisterController.text,
        tanggallahir: TextEditing.tanggalLahirRegisterController.text,
        jeniskelamin: TextEditing.jenisKelaminRegisterController.text,
      );
      await _firestore
          .collection("penggunaTerbaru")
          .doc(cred.user!.uid)
          .set(userModel.toJson());

      toastAllert('Daftar berhasil', MyColor.deepAqua, 1);

      Provider.of<NavigasiViewModel>(context, listen: false)
          .navigasiCheckLogin(context);
    } on FirebaseAuthException catch (e) {
      return toastAllert('${e.message}', MyColor.errorColor, 1);
    }
  }
}
