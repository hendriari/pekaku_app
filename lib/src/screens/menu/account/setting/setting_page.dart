import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/helper/text_editing_controller.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/src/widgets/account_widget/row_widget.dart';
import 'package:pekaku_app/src/widgets/account_widget/setting_widget/reset_password_profile.dart';
import 'package:pekaku_app/src/widgets/widget/button_widget.dart';
import 'package:pekaku_app/src/widgets/widget/icon_button_widget.dart';
import 'package:pekaku_app/src/widgets/widget/text_field_widget.dart';
import 'package:pekaku_app/src/widgets/widget/text_header.dart';
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
                    context.read<NavigasiViewModel>().navigasiBack(context);
                  },
                  heightContainer: 40,
                  widthContainer: 40,
                  iconColor: MyColor.deepAqua,
                  icon: FontAwesomeIcons.handPointLeft,
                  borderColor: MyColor.outlineBorder,
                ),

                const Spacer(),

                /// textheader
                textHeader(
                  'set',
                  'tings',
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
                    controller: TextEditing.resetPasswordProfileController,
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
