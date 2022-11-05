import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/utils/custom_fonts.dart';
import 'package:pekaku_app/src/view_model/account_view_model/account_provider.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:pekaku_app/src/widget/account_widget/row_widget.dart';
import 'package:pekaku_app/src/widget/account_widget/setting_widget/reset_password_profile.dart';
import 'package:pekaku_app/src/widget/button/button_widget.dart';
import 'package:pekaku_app/src/widget/button/icon_button_widget.dart';
import 'package:pekaku_app/src/widget/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: paddingTop),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// back button
                IconButtonWidget(
                  onTap: () {
                    context.read<NavigatorProvider>().navigasiBack(context);
                  },
                  heightContainer: 40,
                  widthContainer: 40,
                  iconColor: MyColor.deepAqua,
                  icon: FontAwesomeIcons.handPointLeft,
                  borderColor: MyColor.outlineBorder,
                ),

                const Spacer(),

                /// textheader
                RichText(
                  text: TextSpan(
                    text: 'set',
                    style: CustomFonts.customHeaderText
                        .copyWith(color: MyColor.deepAqua),
                    children: [
                      TextSpan(
                        text: 'tings',
                        style: CustomFonts.customHeaderText.copyWith(
                          color: MyColor.deepAqua.withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                const SizedBox(
                  width: 40,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),

            /// setting menu
            Card(
              color: MyColor.mist,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: rowWidget(
                  context: context,
                  icon: CupertinoIcons.padlock,
                  text: 'Reset Password',
                  onTap: () {
                    showDialogResetPassword(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// dialog reset password
  Future showDialogResetPassword(context) {
    final settingProvider =
        Provider.of<AccountViewModel>(context, listen: false);
    final double sizeWidth = MediaQuery.of(context).size.width;

    return showDialog(
        context: context,
        builder: (context) {
          return Material(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// field email chekker
                  TextFormFields(
                    obscureText: false,
                    label: 'Konfirmasi Email',
                    controller: settingProvider.profileEmailController,
                    textInputAction: TextInputAction.done,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  /// button submit
                  ButtonWidget(
                    borderRadius: BorderRadius.circular(40),
                    onPressed: () async {
                      resetPasswordProfileDialog(context);
                    },
                    backgroundColor: MyColor.deepAqua,
                    sizeWidth: sizeWidth * .95,
                    child: Text(
                      'Konfirmasi',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: MyColor.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
