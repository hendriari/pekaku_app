import 'package:flutter/material.dart';
import 'package:pekaku_app/src/screen/splash_screen.dart';

void main()=>runApp(const PekakuApp());

class PekakuApp extends StatelessWidget {
  const PekakuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
