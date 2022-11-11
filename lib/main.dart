import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/screens/landing/splash_screen.dart';
import 'package:pekaku_app/src/services/create_post_services/create_post_services.dart';
import 'package:pekaku_app/src/services/login_services/login_services.dart';
import 'package:pekaku_app/src/services/register_services/register_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/utils/text_theme_font.dart';
import 'package:pekaku_app/src/view_model/account_view_model/account_view_model.dart';
import 'package:pekaku_app/src/view_model/createpost_view_model/createpost_view_model.dart';
import 'package:pekaku_app/src/view_model/history_view_model/history_view_model.dart';
import 'package:pekaku_app/src/view_model/home_view_model/home_view_model.dart';
import 'package:pekaku_app/src/view_model/login_view_model/login_view_model.dart';
import 'package:pekaku_app/src/view_model/menu_view_model/menu_provider.dart';
import 'package:pekaku_app/src/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/src/view_model/register_view_model/register_view_model.dart';
import 'package:pekaku_app/src/view_model/user_view_model/user_view_model.dart';
import 'package:pekaku_app/src/services/home_services/home_services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const PekakuApp());
}

class PekakuApp extends StatelessWidget {
  const PekakuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => HomeServices()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => NavigasiViewModel()),
        ChangeNotifierProvider(create: (_) => MenuViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => LoginServices()),
        ChangeNotifierProvider(create: (_) => RegisterServices()),
        ChangeNotifierProvider(create: (_) => AccountViewModel()),
        ChangeNotifierProvider(create: (_) => CreatePostViewModel()),
        ChangeNotifierProvider(create: (_) => HistoryViewModel()),
        ChangeNotifierProvider(create: (_) => CreatePostServices()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData(
          textTheme: myTextTheme,
          colorScheme:
              Theme.of(context).colorScheme.copyWith(secondary: MyColor.white),
        ),
      ),
    );
  }
}
