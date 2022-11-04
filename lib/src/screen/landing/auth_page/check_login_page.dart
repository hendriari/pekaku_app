import 'package:flutter/material.dart';
import 'package:pekaku_app/src/screen/landing/landing_page.dart';
import 'package:pekaku_app/src/screen/menu/menu_page.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/auth_provider.dart';
import 'package:provider/provider.dart';

class CheckLogin extends StatelessWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context, listen: false);
    /// check user login
    return StreamBuilder(
      stream: authProvider.authStateChange,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MenuPage();
        } else {
          return const LandingPage();
        }
      },
    );
  }
}