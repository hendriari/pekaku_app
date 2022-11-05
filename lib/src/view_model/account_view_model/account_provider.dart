import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/model/user_model.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/auth_provider.dart';
import 'package:pekaku_app/src/widget/dialog/toast_allert.dart';

class AccountViewModel with ChangeNotifier {
  UserModel _userModel = UserModel();

  AuthViewModel auth = AuthViewModel();

  get userModel => _userModel;

  final TextEditingController _profileUsernameController =
  TextEditingController();

  final TextEditingController _profileAlamatController =
  TextEditingController();

  final TextEditingController _profileTanggalLahirController =
  TextEditingController();

  final TextEditingController _profileJenisKelaminController =
  TextEditingController();

  final TextEditingController _profileEmailController =
  TextEditingController();

  get profileUsernameController => _profileUsernameController;

  get profileAlamatController => _profileAlamatController;

  get profileTanggalLahirController => _profileTanggalLahirController;

  get profileJenisKelaminController => _profileJenisKelaminController;

  get profileEmailController => _profileEmailController;


  /// get user data
  Future<void> specifyDataUSer() async {
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      _userModel = UserModel.fromMap(value.data());
    });
    notifyListeners();
  }


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

}
