import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/helper/text_editing_controller.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/widgets/dialog/toast_allert.dart';
import 'package:provider/provider.dart';

class AccountViewModel with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// get data real time firestore
  final Stream<DocumentSnapshot<Map<String, dynamic>>> _data = FirebaseFirestore
      .instance
      .collection("penggunaBaru")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  get userData => _data;


  /// check email
  void checkerEmail() {
    if (TextEditing.resetPasswordProfileController.text.isEmpty) {
      toastAllert(
        'Email tidak boleh kosong !',
        MyColor.errorColor,
        3,
      );
    } else {
      resetProfilePassword();
    }
  }

  /// reset password
  Future<void> resetProfilePassword() async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: TextEditing.resetPasswordProfileController.text,
      );
      toastAllert(
        'Permintaan reset password sudah dikirim, Silahkan cek email Anda',
        MyColor.deepAqua,
        3,
      );
      TextEditing.resetPasswordProfileController.clear();
    } on FirebaseAuthException catch (e) {
      return toastAllert('${e.message}', MyColor.errorColor, 3);
    }
  }

  /// update user data
  Future<void> updateDataUSer(context) async {
    try {
      await FirebaseFirestore.instance
          .collection("penggunaBaru")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'name': TextEditing.usernameUpdateProfilController.text,
        'kelamin': TextEditing.jenisKelaminRegisterController.text,
        'alamat': TextEditing.alamatUpdateProfileController.text,
        'tanggallahir': TextEditing.tanggalLahirUpdateProfileController.text,
      });

      toastAllert(
        'Data berhasil diperbarui',
        MyColor.deepAqua,
        3,
      );

      TextEditing.usernameUpdateProfilController.clear();
      TextEditing.jenisKelaminRegisterController.clear();
      TextEditing.alamatUpdateProfileController.clear();
      TextEditing.tanggalLahirUpdateProfileController.clear();
      notifyListeners();
      Provider.of<NavigasiViewModel>(context, listen: false)
          .navigasiBack(context);
    } on FirebaseAuthException catch (e) {
      return toastAllert('${e.message}', MyColor.errorColor, 3);
    }
  }

  /// logout
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

}
