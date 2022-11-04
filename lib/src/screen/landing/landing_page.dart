import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:pekaku_app/src/widget/button/button_widget.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    final paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: paddingTop + sizeHeight * .03,
          right: 20,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// header text
            Text(
              'Halo !',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: MyColor.darkBlue),
            ),

            Text(
              'Pekakuy',
              style: Theme.of(context).textTheme.headline3,
            ),

            const Spacer(),

            /// button auth login
            ButtonWidget(
              onPressed: () {
                context.read<NavigatorProvider>().navigasiToLogin(context);
              },
              sizeWidth: sizeWidth * .95,
              borderRadius: BorderRadius.circular(40),
              backgroundColor: MyColor.deepAqua,
              child: Text(
                'Mulai',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: MyColor.white),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
