import 'package:flutter/material.dart';
import 'package:pekaku_app/src/services/account_services/account_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/utils/text_editing_controller.dart';
import 'package:pekaku_app/src/widgets/dialog/toast_allert.dart';

class AccountViewModel{

  /// check email
  void checkerEmail() {
    if (TextEditing.resetPasswordProfileController.text.isEmpty) {
      toastAllert(
        'Email tidak boleh kosong !',
        MyColor.errorColor,
        3,
      );
    } else {
      AccountServices().resetProfilePassword();
    }
  }

}