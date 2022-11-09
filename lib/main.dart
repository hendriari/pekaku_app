import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/screens/landing/splash_screen.dart';
import 'package:pekaku_app/services/change_password_services/change_password_services.dart';
import 'package:pekaku_app/services/firebase_services/firebase_auth_services.dart';
import 'package:pekaku_app/services/firebase_services/firebase_storage_services.dart';
import 'package:pekaku_app/services/firebase_services/firestore_services.dart';
import 'package:pekaku_app/services/login_services/login_services.dart';
import 'package:pekaku_app/services/register_services/register_services.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/utils/text_theme_font.dart';
import 'package:pekaku_app/view_model/account_view_model/account_view_model.dart';
import 'package:pekaku_app/view_model/createpost_view_model/post_with_maps.dart';
import 'package:pekaku_app/view_model/login_view_model/login_view_model.dart';
import 'package:pekaku_app/view_model/menu_view_model/menu_provider.dart';
import 'package:pekaku_app/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/view_model/register_view_model/register_view_model.dart';
import 'package:pekaku_app/view_model/user_view_model/user_view_model.dart';
import 'package:pekaku_app/services/home_services/home_services.dart';
import 'package:pekaku_app/view_model/home_view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'services/profile_services/profile_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileServices()),
        ChangeNotifierProvider(create: (_) => HomeServices()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => FirebaseStorageServices()),
        ChangeNotifierProvider(create: (_) => FirebaseAuthServices()),
        ChangeNotifierProvider(create: (_) => FireStoreServices()),
        ChangeNotifierProvider(create: (_) => NavigasiViewModel()),
        ChangeNotifierProvider(create: (_) => MenuViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => HomeServices()),
        ChangeNotifierProvider(create: (_) => LoginServices()),
        ChangeNotifierProvider(create: (_) => RegisterServices()),
        ChangeNotifierProvider(create: (_) => ChangePasswordServices()),
        ChangeNotifierProvider(create: (_) => AccountViewModel()),
        ChangeNotifierProvider(create: (_) => CreatePostViewModel()),
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
