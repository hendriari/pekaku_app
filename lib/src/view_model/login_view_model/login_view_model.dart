import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/utils/text_editing_controller.dart';
import 'package:pekaku_app/src/services/login_services/login_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/dialog/toast_allert.dart';

class LoginViewModel with ChangeNotifier {
  late bool _scurePassword = true;

  get scurePassword => _scurePassword;

  /// visible password
  void visiblePassword() {
    _scurePassword = !_scurePassword;
    notifyListeners();
  }
}
