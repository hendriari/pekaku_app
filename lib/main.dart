import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/forgot_password_provider.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/login_provider.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/register_provider.dart';
import 'firebase_options.dart';
import 'package:pekaku_app/src/screen/landing/splash_screen.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/utils/font.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/auth_provider.dart';
import 'package:pekaku_app/src/view_model/createpost_view_model/createpost_provider.dart';
import 'package:pekaku_app/src/view_model/menu_view_model/menu_provider.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:provider/provider.dart';
import 'src/view_model/account_view_model/account_provider.dart';

void main() async {
  runApp(const PekakuApp());
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class PekakuApp extends StatelessWidget {
  const PekakuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigatorProvider()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => MenuViewModel()),
        ChangeNotifierProvider(create: (_) => CreatePostViewModel()),
        ChangeNotifierProvider(create: (_) => AccountViewModel()),
      ],
      child: MaterialApp(
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: myTextTheme,
          colorScheme:
              Theme.of(context).colorScheme.copyWith(secondary: MyColor.white),
        ),
      ),
    );
  }
}
