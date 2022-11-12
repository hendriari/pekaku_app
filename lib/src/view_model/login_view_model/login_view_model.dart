import 'package:flutter/cupertino.dart';

class LoginViewModel with ChangeNotifier {
  late bool _scurePassword = true;

  get scurePassword => _scurePassword;

  /// visible password
  void visiblePassword() {
    _scurePassword = !_scurePassword;
    notifyListeners();
  }
}
