import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/auth_provider.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:pekaku_app/src/widget/dialog/toast_allert.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';

class RegisterViewModel with ChangeNotifier {
  AuthViewModel auth = AuthViewModel();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late bool _scureRegisterPassword = true;
  late bool _scureRegisterConfirmPassword = true;

  final TextEditingController _registerUsernameController =
      TextEditingController();
  final TextEditingController _registerAlamatController =
      TextEditingController();
  final TextEditingController _registerTanggalLahirController =
      TextEditingController();
  final TextEditingController _registerJenisKelaminLahirController =
      TextEditingController();
  final TextEditingController _registerEmailController =
      TextEditingController();
  final TextEditingController _registerPasswordController =
      TextEditingController();
  final TextEditingController _confirmRegisterPasswordController =
      TextEditingController();

  get scureRegisterPassword => _scureRegisterPassword;

  get scureRegisterConfirmPassword => _scureRegisterConfirmPassword;

  get registerUsernameController => _registerUsernameController;

  get registerAlamatController => _registerAlamatController;

  get registerTanggalLahirController => _registerTanggalLahirController;

  get registerJenisKelaminLahirController =>
      _registerJenisKelaminLahirController;

  get registerEmailController => _registerEmailController;

  get registerPasswordController => _registerPasswordController;

  get confirmRegisterPasswordController => _confirmRegisterPasswordController;

  /// visible password
  void visibleRegisterPassword() {
    _scureRegisterPassword = !_scureRegisterPassword;
    notifyListeners();
  }

  /// visible confirm password
  void visibleConfirmRegisterPassword() {
    _scureRegisterConfirmPassword = !_scureRegisterConfirmPassword;
    notifyListeners();
  }

  /// user firestore
  Future<void> userFirestore() async {
    CollectionReference users = _firestore.collection('users');
    users.add({
      'name': _registerUsernameController.text,
      'kelamin': _registerJenisKelaminLahirController.text,
      'tanggallahir': _registerTanggalLahirController.text,
      'alamat': _registerAlamatController.text,
      'email': _registerEmailController.text,
    });
  }

  /// firebase register account
  Future<void> register(context) async {
    try {
      await auth.authRegister(
        email: _registerEmailController.text,
        password: _registerPasswordController.text,
      );
      toastAllert(
        'Berhasil mendaftar',
        MyColor.deepAqua,
        2,
      );
      _registerUsernameController.clear();
      _registerAlamatController.clear();
      _registerTanggalLahirController.clear();
      _registerJenisKelaminLahirController.clear();
      _registerEmailController.clear();
      _registerPasswordController.clear();
      _confirmRegisterPasswordController.clear();
      Provider.of<NavigatorProvider>(context, listen: false)
          .navigasiCheckLogin(context);
    } on FirebaseAuthException catch (e) {
      //return toastAllert('${e.message}', MyColor.errorColor, 3);
      if (e.code == 'weak-password') {
        return toastAllert('Password lemah', MyColor.errorColor, 1);
      } else if (e.code == 'email-already-in-use') {
        return toastAllert('Email sudah digunakan', MyColor.errorColor, 1);
      } else {
        return toastAllert('${e.message}', MyColor.errorColor, 1);
      }
    }
  }

  /// check register
  void checkBeforeRegister(context) {
    if (_registerUsernameController.text.isEmpty) {
      toastAllert('Username tidak boleh kosong !', MyColor.errorColor, 1);
    } else if (_registerUsernameController.text.length < 4) {
      toastAllert(
          'Username harus lebih dari 4 karakter', MyColor.errorColor, 1);
    } else if (_registerAlamatController.text.isEmpty) {
      toastAllert('Alamat tidak boleh kosong !', MyColor.errorColor, 1);
    } else if (_registerTanggalLahirController.text.isEmpty) {
      toastAllert('Tanggal lahir tidak boleh kosong !', MyColor.errorColor, 1);
    } else if (_registerJenisKelaminLahirController.text.isEmpty) {
      toastAllert('Jenis kelamin tidak boleh kosong !', MyColor.errorColor, 1);
    } else if (_registerPasswordController.text !=
        _confirmRegisterPasswordController.text) {
      toastAllert('Password harus sama', MyColor.errorColor, 1);
    } else if (_registerPasswordController.text.length < 8 &&
        _confirmRegisterPasswordController.text.length < 8) {
      toastAllert(
          'Password harus lebih dari 8 karakter', MyColor.errorColor, 1);
    } else {
      register(context);
    }
  }

  /// controller dispose
  Future<void> disposeTextController() async {
    _registerUsernameController.dispose();
    _registerEmailController.dispose();
    _registerAlamatController.dispose();
    _registerJenisKelaminLahirController.dispose();
    _registerTanggalLahirController.dispose();
    _confirmRegisterPasswordController.dispose();
    _registerPasswordController.dispose();
  }
}
