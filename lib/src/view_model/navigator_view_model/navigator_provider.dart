import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/screen/landing/auth_page/check_login_page.dart';
import 'package:pekaku_app/src/screen/landing/auth_page/lupa_password_page.dart';
import 'package:pekaku_app/src/screen/landing/auth_page/login_page.dart';
import 'package:pekaku_app/src/screen/landing/auth_page/register_page.dart';
import 'package:pekaku_app/src/screen/landing/splash_screen2.dart';

class NavigatorProvider with ChangeNotifier {
  /// navigasi splash 1 ke splash 2
  void navigasiSplash1(BuildContext context) {
    Timer(
      const Duration(milliseconds: 800),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondAnimation) =>
                  const SplashScreen2(),
              transitionsBuilder:
                  (context, animation, secondAnimation, child) =>
                      FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
            (route) => false);
      },
    );
    notifyListeners();
  }

  /// navigasi splash 2 ke landing
  void navigasiSplash2(BuildContext context) {
    Timer(
      const Duration(milliseconds: 300),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondAnimation) =>
                  const CheckLogin(),
              transitionsBuilder:
                  (context, animation, secondAnimation, child) =>
                      FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
            (route) => false);
      },
    );
    notifyListeners();
  }

  /// landing ke login page
  void navigasiToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
    notifyListeners();
  }

  /// navigasi kembali
  void navigasiBack(BuildContext context) {
    Navigator.pop(context);
    notifyListeners();
  }

  /// navigasi dari login ke register
  void navigasiLoginToRegister(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
    notifyListeners();
  }

  /// navigasi lupa password
  void navigasiChangePassword(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const ChangePassword(),
      ),
    );
    notifyListeners();
  }

  /// navigasi auth check login
  void navigasiCheckLogin(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondAnimation) =>
              const CheckLogin(),
          transitionDuration: const Duration(milliseconds: 1200),
          transitionsBuilder: (context, animation, secondAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.linearToEaseOut;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
        (route) => false);
  }
}
