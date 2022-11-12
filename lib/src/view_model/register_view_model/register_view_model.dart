import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/utils/text_editing_controller.dart';
import 'package:pekaku_app/src/services/register_services/register_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/dialog/toast_allert.dart';

class RegisterViewModel with ChangeNotifier {

  late bool _scureRegisterPassword = true;

  late bool _scureRegisterConfirmPassword = true;

  get scureRegisterPassword => _scureRegisterPassword;

  get scureRegisterConfirmPassword => _scureRegisterConfirmPassword;

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

  /// check register
  void checkBeforeRegister(context) {
    if (TextEditing.emailRegisterController.text.isEmpty) {
      toastAllert('Username tidak boleh kosong !', MyColor.errorColor, 1);
    } else if (TextEditing.usernameRegisterController.text.length < 6) {
      toastAllert(
          'Username harus lebih dari 6 karakter', MyColor.errorColor, 1);
    } else if (TextEditing.alamatRegisterController.text.isEmpty) {
      toastAllert('Alamat tidak boleh kosong !', MyColor.errorColor, 1);
    } else if (TextEditing.tanggalLahirRegisterController.text.isEmpty) {
      toastAllert('Tanggal lahir tidak boleh kosong !', MyColor.errorColor, 1);
    } else if (TextEditing.jenisKelaminRegisterController.text.isEmpty) {
      toastAllert('Jenis kelamin tidak boleh kosong !', MyColor.errorColor, 1);
    } else if (TextEditing.passwordRegisterController.text !=
        TextEditing.cekPasswordRegisterController.text) {
      toastAllert('Password harus sama', MyColor.errorColor, 1);
    } else if (TextEditing.passwordRegisterController.text.length < 8 &&
        TextEditing.cekPasswordRegisterController.text.length < 8) {
      toastAllert(
          'Password harus lebih dari 8 karakter', MyColor.errorColor, 1);
    } else {
      RegisterServices().signUpUser(context);
    }
  }
}
