import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/helper/text_editing_controller.dart';
import 'package:pekaku_app/services/login_services/login_services.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/view_model/login_view_model/login_view_model.dart';
import 'package:pekaku_app/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/widgets/widget/button_widget.dart';
import 'package:pekaku_app/widgets/widget/text_button.dart';
import 'package:pekaku_app/widgets/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;
//
//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//   }
//
//   void loginUser() async {
//     setState(() {
//       _isLoading = true;
//     });
//     String res = await FirebaseAuthServices().loginUser(
//         email: _emailController.text, password: _passwordController.text);
//     if (res == 'success') {
//       Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(
//             builder: (context) => const MenuPage(),
//           ),
//           (route) => false);
//
//       setState(() {
//         _isLoading = false;
//       });
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       showSnackBar(context, res);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.all(20),
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Flexible(
//                 child: Container(),
//                 flex: 2,
//               ),
//               SvgPicture.asset(
//                 'assets/ic_instagram.svg',
//                 color: primaryColor,
//                 height: 64,
//               ),
//               const SizedBox(
//                 height: 64,
//               ),
//               TextFieldInput(
//                 hintText: 'Enter your email',
//                 textInputType: TextInputType.emailAddress,
//                 textEditingController: _emailController,
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               TextFieldInput(
//                 hintText: 'Enter your password',
//                 textInputType: TextInputType.text,
//                 textEditingController: _passwordController,
//                 isPass: true,
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               InkWell(
//                 child: Container(
//                   child: !_isLoading
//                       ? const Text(
//                           'Log in',
//                         )
//                       : const CircularProgressIndicator(
//                           color: primaryColor,
//                         ),
//                   width: double.infinity,
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   decoration: const ShapeDecoration(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(4)),
//                     ),
//                     color: blueColor,
//                   ),
//                 ),
//                 onTap: loginUser,
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               Flexible(
//                 child: Container(),
//                 flex: 2,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     child: const Text(
//                       'Dont have an account?',
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                   ),
//                   GestureDetector(
//                     onTap: () => Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const SignupScreen(),
//                       ),
//                     ),
//                     child: Container(
//                       child: const Text(
//                         ' Signup.',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


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
                context.read<LoginServices>().loginUser();
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
