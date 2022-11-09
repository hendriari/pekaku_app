import 'package:flutter/cupertino.dart';

class TextEditing {
  /// login text editing controller
  static TextEditingController emailLoginController = TextEditingController();
  static TextEditingController passwordLoginController =
      TextEditingController();

  /// reset password controller
  static TextEditingController resetPasswordController =
      TextEditingController();

  /// register editing controller
  static TextEditingController emailRegisterController =
      TextEditingController();
  static TextEditingController usernameRegisterController =
      TextEditingController();
  static TextEditingController alamatRegisterController =
      TextEditingController();
  static TextEditingController tanggalLahirRegisterController =
      TextEditingController();
  static TextEditingController jenisKelaminRegisterController =
      TextEditingController();
  static TextEditingController passwordRegisterController =
      TextEditingController();
  static TextEditingController cekPasswordRegisterController =
      TextEditingController();

  /// edit profil controller
  static TextEditingController emailUpdateProfilController =
      TextEditingController();
  static TextEditingController usernameUpdateProfilController =
      TextEditingController();
  static TextEditingController alamatUpdateProfileController =
      TextEditingController();
  static TextEditingController tanggalLahirUpdateProfileController =
      TextEditingController();
  static TextEditingController jenisKelaminUpdateProfileController =
      TextEditingController();

  /// profile reset password
  static TextEditingController resetPasswordProfileController =
      TextEditingController();
}
