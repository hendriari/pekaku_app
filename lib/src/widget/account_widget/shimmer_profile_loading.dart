import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/utils/custom_fonts.dart';
import 'package:pekaku_app/src/widget/account_widget/row_widget.dart';

class ShimmerProfileLoading extends StatelessWidget {
  const ShimmerProfileLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.of(context).padding.top;
    final double sizeHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: paddingTop),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// text header
            RichText(
              text: TextSpan(
                text: 'Profil',
                style: CustomFonts.customHeaderText,
                children: [
                  TextSpan(
                    text: 'ku',
                    style: CustomFonts.customHeaderText,
                  ),
                ],
              ),
            ),

            /// header profile
            Container(
              height: 110,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyColor.gray,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(2, 3),
                    color: MyColor.gray,
                    blurRadius: 4,
                  )
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 3,
                  colorFilter: ColorFilter.mode(
                    MyColor.gray,
                    BlendMode.darken,
                  ),
                  image: const AssetImage(
                    'assets/image_assets/batik.png',
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'name',
                        ),
                        Text('name'),
                      ],
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            /// account menu
            Card(
              color: MyColor.gray,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    /// profile
                    rowWidget(
                      context: context,
                      icon: CupertinoIcons.person,
                      text: 'Profil',
                      onTap: () {},
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    /// tentang app
                    rowWidget(
                      context: context,
                      icon: CupertinoIcons.info,
                      text: 'Tentang Aplikasi',
                      onTap: () {},
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    /// pengaturan
                    rowWidget(
                        context: context,
                        icon: CupertinoIcons.settings,
                        text: 'Pengaturan',
                        onTap: () {}),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            /// logout
            Container(
              height: 70,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: MyColor.gray,
                borderRadius: BorderRadius.circular(20),
              ),
              child: rowWidget(
                  context: context,
                  icon: Icons.logout,
                  text: 'Logout',
                  onTap: () {}),
            ),

            SizedBox(
              height: sizeHeight * .13,
            ),

            SizedBox(
              width: 120,
              child: Column(
                children: [
                  /// nama aplikasi
                  Text(
                    'Pekakuy',
                    style: GoogleFonts.merienda(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: MyColor.gray,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  /// versi aplikasi
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'v 1.0.1',
                      style: TextStyle(color: MyColor.gray),
                    ),
                  ),
                ],
              ),
            ),

            /// batas bawah
            SizedBox(
              height: sizeHeight * .13,
            ),
          ],
        ),
      ),
    );
  }
}
