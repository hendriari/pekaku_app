import 'package:flutter/material.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<NavigatorProvider>(context, listen: false)
          .navigasiSplash2(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
