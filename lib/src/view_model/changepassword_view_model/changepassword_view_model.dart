import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/helper/text_editing_controller.dart';
import 'package:pekaku_app/src/services/change_password_services/change_password_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/dialog/toast_allert.dart';

class ChangePasswordViewModel with ChangeNotifier{

  /// check email
  void checkEmail() {
    if (TextEditing.resetPasswordController.text.isEmpty) {
      toastAllert(
        'Email tidak boleh kosong !',
        MyColor.errorColor,
        3,
      );
    } else {
      ChangePasswordServices().resetPassword();
    }
  }

}