import 'package:flutter/material.dart';
import 'package:pekaku_app/helper/text_editing_controller.dart';
import 'package:pekaku_app/services/register_services/register_services.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/view_model/register_view_model/register_view_model.dart';
import 'package:pekaku_app/widgets/dialog/bottom_sheed.dart';
import 'package:pekaku_app/widgets/register_widget/date_picker_widget.dart';
import 'package:pekaku_app/widgets/register_widget/select_gender_widget.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);
//
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _bioController = TextEditingController();
//   bool _isLoading = false;
//   Uint8List? _image;
//
//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _usernameController.dispose();
//   }
//
//   void signUpUser() async {
//     // set loading to true
//     setState(() {
//       _isLoading = true;
//     });
//
//     // signup user using our authmethodds
//     String res = await FirebaseAuthServices().signUpUser(
//         email: _emailController.text,
//         password: _passwordController.text,
//         username: _usernameController.text,
//         bio: _bioController.text,
//         file: _image!);
//     // if string returned is sucess, user has been created
//     if (res == "success") {
//       setState(() {
//         _isLoading = false;
//       });
//       // navigate to the home screen
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => const MenuPage(),
//
//         ),
//       );
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       // show the error
//       showSnackBar(context, res);
//     }
//   }
//
//   selectImage() async {
//     Uint8List im = await pickImage(ImageSource.gallery);
//     // set state because we need to display the image we selected on the circle avatar
//     setState(() {
//       _image = im;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 32),
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
//               Stack(
//                 children: [
//                   _image != null
//                       ? CircleAvatar(
//                           radius: 64,
//                           backgroundImage: MemoryImage(_image!),
//                           backgroundColor: Colors.red,
//                         )
//                       : const CircleAvatar(
//                           radius: 64,
//                           backgroundImage: NetworkImage(
//                               'https://i.stack.imgur.com/l60Hf.png'),
//                           backgroundColor: Colors.red,
//                         ),
//                   Positioned(
//                     bottom: -10,
//                     left: 80,
//                     child: IconButton(
//                       onPressed: selectImage,
//                       icon: const Icon(Icons.add_a_photo),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               TextFieldInput(
//                 hintText: 'Enter your username',
//                 textInputType: TextInputType.text,
//                 textEditingController: _usernameController,
//               ),
//               const SizedBox(
//                 height: 24,
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
//               TextFieldInput(
//                 hintText: 'Enter your bio',
//                 textInputType: TextInputType.text,
//                 textEditingController: _bioController,
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               InkWell(
//                 child: Container(
//                   child: !_isLoading
//                       ? const Text(
//                           'Sign up',
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
//                 onTap: signUpUser,
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
//                       'Already have an account?',
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                   ),
//                   GestureDetector(
//                     onTap: () => Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const LoginScreen(),
//                       ),
//                     ),
//                     child: Container(
//                       child: const Text(
//                         ' Login.',
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
//

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/widgets/widget/button_widget.dart';
import 'package:pekaku_app/widgets/widget/icon_button_widget.dart';
import 'package:pekaku_app/widgets/widget/read_only_textfield.dart';
import 'package:pekaku_app/widgets/widget/text_field_widget.dart';
import 'package:provider/provider.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final registerProvider =
    Provider.of<RegisterViewModel>(context, listen: false);
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: paddingTop + 8),
          child: Column(
            children: [
              /// button back
              Align(
                alignment: Alignment.topLeft,
                child: IconButtonWidget(
                    onTap: () {
                      context.read<NavigasiViewModel>().navigasiBack(context);
                    },
                    heightContainer: 40,
                    widthContainer: 40,
                    iconColor: MyColor.deepAqua,
                    icon: FontAwesomeIcons.handPointLeft,
                    borderColor: MyColor.outlineBorder),
              ),

              /// text header
              Padding(
                padding: EdgeInsets.only(top: sizeHeight * .1 - 40),
                child: Text(
                  'Daftar',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: MyColor.deepAqua),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              /// username textfields
              TextFormFields(
                controller: TextEditing.usernameRegisterController,
                label: 'Username',
                maxLines: 1,
                obscureText: false,
              ),

              const SizedBox(
                height: 20,
              ),

              /// alamat textfields
              TextFormFields(
                controller: TextEditing.alamatRegisterController,
                label: 'Alamat',
                textInputAction: TextInputAction.done,
                minLines: 1,
                maxLines: null,
                obscureText: false,
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  /// tanggal lahir textfields
                  Flexible(
                    child: Consumer<RegisterServices>(
                        builder: (context, value, child) {
                          return ReadOnlyTextFields(
                            controller: TextEditing.tanggalLahirRegisterController,
                            onTap: () {
                              birthDayPicker(context);
                            },
                            label: Text(
                              'Tanggal Lahir',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: MyColor.deepAqua),
                            ),
                          );
                        }),
                  ),

                  const SizedBox(
                    width: 5,
                  ),

                  /// jenis kelamin textfields
                  Flexible(
                    child: Consumer<RegisterServices>(
                        builder: (context, value, child) {
                          return ReadOnlyTextFields(
                            controller: TextEditing.jenisKelaminRegisterController,
                            onTap: () {
                              modalBottomSheed(
                                context,
                                const SelectGenderWidget(),
                              );
                            },
                            label: Text(
                              'Jenis Kelamin',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: MyColor.deepAqua),
                            ),
                          );
                        }),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              /// email textfields
              TextFormFields(
                controller: TextEditing.emailRegisterController,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                obscureText: false,
              ),

              const SizedBox(
                height: 20,
              ),

              /// password textfields
              Consumer<RegisterViewModel>(builder: (context, value, child) {
                return TextFormFields(
                  controller: TextEditing.passwordRegisterController,
                  obscureText: value.scureRegisterPassword,
                  label: 'Password',
                  maxLines: 1,
                  suffixIcon: IconButton(
                    onPressed: () {
                      value.visibleRegisterPassword();
                    },
                    icon: FaIcon(
                      value.scureRegisterPassword
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: MyColor.deepAqua,
                    ),
                  ),
                );
              }),

              const SizedBox(
                height: 20,
              ),

              /// confirm password
              Consumer<RegisterViewModel>(builder: (context, value, child) {
                return TextFormFields(
                  controller: TextEditing.cekPasswordRegisterController,
                  obscureText: value.scureRegisterConfirmPassword,
                  label: 'Confirm Password',
                  maxLines: 1,
                  suffixIcon: IconButton(
                    onPressed: () {
                      value.visibleConfirmRegisterPassword();
                    },
                    icon: FaIcon(
                      value.scureRegisterConfirmPassword
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: MyColor.deepAqua,
                    ),
                  ),
                );
              }),

              const SizedBox(
                height: 30,
              ),

              /// button register
              ButtonWidget(
                borderRadius: BorderRadius.circular(40),
                onPressed: () async {
                  registerProvider.checkBeforeRegister(context);
                },
                backgroundColor: MyColor.deepAqua,
                sizeWidth: sizeWidth * .95,
                child: Text(
                  'Daftar',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: MyColor.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
