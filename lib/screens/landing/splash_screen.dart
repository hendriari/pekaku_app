import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<NavigasiViewModel>(context, listen: false)
          .navigasiSplash1(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double sizeHeight = MediaQuery.of(context).size.height;
    final double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          /// canvas
          Container(
            height: sizeHeight,
            width: sizeWidth,
            color: MyColor.lichen,
          ),

          /// header image
          SizedBox(
            width: double.infinity,
            height: sizeHeight * .6,
            child: SvgPicture.asset(
              'assets/svg_assets/bg1.svg',
              fit: BoxFit.cover,
            ),
          ),

          /// logo
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 190,
              width: 190,
              decoration: BoxDecoration(
                color: MyColor.deepAqua,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(2, 4),
                    color: Colors.black45,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Pekakuy',
                  style: GoogleFonts.merienda(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 38,
                      color: MyColor.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
