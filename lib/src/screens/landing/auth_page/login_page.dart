import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/helper/text_editing_controller.dart';
import 'package:pekaku_app/src/services/login_services/login_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/login_view_model/login_view_model.dart';
import 'package:pekaku_app/src/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/src/widgets/widget/button_widget.dart';
import 'package:pekaku_app/src/widgets/widget/text_button.dart';
import 'package:pekaku_app/src/widgets/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final navigasiProvider =
    Provider.of<NavigasiViewModel>(context, listen: false);
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            left: 20.0, right: 20.0, top: paddingTop + sizeHeight * .1),
        child: Column(
          children: [
            /// text header
            Text(
              'Log in',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: MyColor.deepAqua),
            ),

            const SizedBox(
              height: 30,
            ),

            /// email textfields
            TextFormFields(
              controller: TextEditing.emailLoginController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              obscureText: false,
            ),

            const SizedBox(
              height: 20,
            ),

            /// password textfields
            Consumer<LoginViewModel>(builder: (context, value, child) {
              return TextFormFields(
                controller: TextEditing.passwordLoginController,
                obscureText: value.scurePassword,
                label: 'Password',
                maxLines: 1,
                suffixIcon: IconButton(
                  onPressed: () {
                    value.visiblePassword();
                  },
                  icon: FaIcon(
                      value.scurePassword
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: MyColor.deepAqua),
                ),
              );
            }),

            const SizedBox(
              height: 30,
            ),

            /// button lupa password
            Align(
              alignment: Alignment.centerRight,
              child: ButtonText(
                  onPressed: () {
                    navigasiProvider.navigasiChangePassword(context);
                  },
                  text: 'Lupa password ?'),
            ),

            const SizedBox(
              height: 10,
            ),

            /// button login
            ButtonWidget(
              borderRadius: BorderRadius.circular(40),
              onPressed: () async {
                ///loginProvider.login(context);
                context.read<LoginServices>().loginUser(context);
              },
              backgroundColor: MyColor.deepAqua,
              sizeWidth: sizeWidth * .95,
              child: Text(
                'Log in',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: MyColor.white),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            const Spacer(),

            /// button register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya akun ?',
                  style: Theme.of(context).textTheme.headline6,
                ),
                ButtonText(
                    onPressed: () {
                      navigasiProvider.navigasiLoginToRegister(context);
                    },
                    text: 'Daftar'),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
