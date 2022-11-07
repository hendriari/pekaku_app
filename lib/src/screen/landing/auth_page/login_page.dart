import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/services/auth_services_provider.dart';
import 'package:pekaku_app/src/services/login_services_provider.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:pekaku_app/src/widget/button/button_widget.dart';
import 'package:pekaku_app/src/widget/button/text_button.dart';
import 'package:pekaku_app/src/widget/widget/text_field_widget.dart';
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
        Provider.of<NavigatorProvider>(context, listen: false);
    final loginProvider = Provider.of<LoginServices>(context, listen: false);
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

            /// username textfields
            TextFormFields(
              controller: loginProvider.emailController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              obscureText: false,
            ),

            const SizedBox(
              height: 20,
            ),

            /// password textfields
            Consumer<LoginServices>(builder: (context, value, child) {
              return TextFormFields(
                controller: loginProvider.passwordController,
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
                loginProvider.login(context);
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

            /// text login with google
            Row(
              children: [
                Flexible(
                  child: Divider(
                    color: MyColor.gray,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Login  Dengan',
                    style: TextStyle(color: MyColor.gray),
                  ),
                ),
                Flexible(
                  child: Divider(
                    color: MyColor.gray,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            /// button login with google
            InkWell(
              onTap: () {
                context.read<AuthServicesProvider>().googleAuthLogin(context);
              },
              borderRadius: BorderRadius.circular(40),
              splashColor: MyColor.greySolid.withOpacity(.3),
              child: SvgPicture.asset('assets/svg_assets/google.svg'),
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
