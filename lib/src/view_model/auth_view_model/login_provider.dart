import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/auth_provider.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:pekaku_app/src/widget/dialog/toast_allert.dart';
import 'package:provider/provider.dart';

class LoginViewModel with ChangeNotifier {
  AuthViewModel auth = AuthViewModel();

  late bool _scurePassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  get scurePassword => _scurePassword;

  get emailController => _emailController;

  get passwordController => _passwordController;

  /// visible password
  void visiblePassword() {
    _scurePassword = !_scurePassword;
    notifyListeners();
  }

  /// firebase account login
  Future<void> login(context) async {
    try {
      await auth.authLogin(
          email: _emailController.text, password: _passwordController.text);
      toastAllert(
        'Login berhasil',
        MyColor.deepAqua,
        1,
      );
      _emailController.clear();
      _passwordController.clear();
      Provider.of<NavigatorProvider>(context, listen: false)
          .navigasiCheckLogin(context);
      // _emailController.dispose();
      // _passwordController.dispose();
    } on FirebaseAuthException catch (e) {
      return toastAllert('${e.message}', MyColor.errorColor, 3);
    }
  }

  /// login controller dispose
// Future<void> loginControllerDispose() async {
//   _emailController.dispose();
//   _passwordController.dispose();
// }
}
