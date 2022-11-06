import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/auth_provider.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:pekaku_app/src/widget/dialog/toast_allert.dart';
import 'package:provider/provider.dart';

class AccountViewModel with ChangeNotifier {
  final AuthViewModel auth = AuthViewModel();

  final TextEditingController _profileUsernameController =
      TextEditingController();

  final TextEditingController _profileAlamatController =
      TextEditingController();

  final TextEditingController _profileTanggalLahirController =
      TextEditingController();

  final TextEditingController _profileJenisKelaminController =
      TextEditingController();

  final TextEditingController _profileEmailController = TextEditingController();

  get profileUsernameController => _profileUsernameController;

  get profileAlamatController => _profileAlamatController;

  get profileTanggalLahirController => _profileTanggalLahirController;

  get profileJenisKelaminController => _profileJenisKelaminController;

  get profileEmailController => _profileEmailController;



  /// get data real time firestore
  final Stream<DocumentSnapshot<Map<String, dynamic>>> _data = FirebaseFirestore
      .instance
      .collection("userData")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  get userData => _data;


  /// check email
  void checkerEmail() {
    if (_profileEmailController.text.isEmpty) {
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
      await auth.forgotPassword(email: _profileEmailController.text);
      toastAllert(
        'Permintaan reset password sudah dikirim, Silahkan cek email Anda',
        MyColor.deepAqua,
        3,
      );
      _profileEmailController.clear();
    } on FirebaseAuthException catch (e) {
      return toastAllert('${e.message}', MyColor.errorColor, 3);
    }
  }

  /// update user data
  Future<void> updateDataUSer(context) async {
    try {
      await FirebaseFirestore.instance
          .collection("userData")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'name': _profileUsernameController.text,
        'kelamin': _profileJenisKelaminController.text,
        'alamat': _profileAlamatController.text,
        'tanggallahir': _profileTanggalLahirController.text,
      });

      toastAllert(
        'Data berhasil diperbarui',
        MyColor.deepAqua,
        3,
      );

      _profileTanggalLahirController.clear();
      _profileAlamatController.clear();
      _profileJenisKelaminController.clear();
      _profileUsernameController.clear();
      notifyListeners();
      Provider.of<NavigatorProvider>(context, listen: false)
          .navigasiBack(context);
    } on FirebaseAuthException catch (e) {
      return toastAllert('${e.message}', MyColor.errorColor, 3);
    }
    //
    // notifyListeners();
  }

  /// logout
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
