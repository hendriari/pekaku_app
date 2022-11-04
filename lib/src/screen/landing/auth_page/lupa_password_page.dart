import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/forgot_password_provider.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:pekaku_app/src/widget/button/button_widget.dart';
import 'package:pekaku_app/src/widget/button/icon_button_widget.dart';
import 'package:pekaku_app/src/widget/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final forgotPasswordAuth =
        Provider.of<ForgotPasswordViewModel>(context, listen: false);
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: paddingTop + 8,
        ),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              /// button kembali
              Align(
                alignment: Alignment.topLeft,
                child: IconButtonWidget(
                    onTap: () {
                      context.read<NavigatorProvider>().navigasiBack(context);
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
                  'Lupa Password',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: MyColor.deepAqua),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              /// email textfields
              TextFormFields(
                controller: forgotPasswordAuth.emailResetController,
                keyboardType: TextInputType.emailAddress,
                label: 'Email',
                maxLines: 1,
                obscureText: false,
              ),

              const SizedBox(
                height: 20,
              ),

              /// button submit
              ButtonWidget(
                borderRadius: BorderRadius.circular(40),
                onPressed: () async {
                  forgotPasswordAuth.checkEmail();
                  forgotPasswordAuth.emailControllerDispose();
                },
                backgroundColor: MyColor.deepAqua,
                sizeWidth: sizeWidth * .95,
                child: Text(
                  'Reset',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: MyColor.white),
                ),
              ),

              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
