import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/register_provider.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:pekaku_app/src/widget/button/button_widget.dart';
import 'package:pekaku_app/src/widget/button/icon_button_widget.dart';
import 'package:pekaku_app/src/widget/dialog/bottom_sheed.dart';
import 'package:pekaku_app/src/widget/register_widget/date_picker_widget.dart';
import 'package:pekaku_app/src/widget/register_widget/select_gender_widget.dart';
import 'package:pekaku_app/src/widget/widget/read_only_textfield.dart';
import 'package:pekaku_app/src/widget/widget/text_field_widget.dart';
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
                controller: registerProvider.registerUsernameController,
                label: 'Username',
                maxLines: 1,
                obscureText: false,
              ),

              const SizedBox(
                height: 20,
              ),

              /// alamat textfields
              TextFormFields(
                controller: registerProvider.registerAlamatController,
                label: 'Alamat',
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
                    child: Consumer<RegisterViewModel>(
                        builder: (context, value, child) {
                      return ReadOnlyTextFields(
                        controller: value.registerTanggalLahirController,
                        onTap: () {
                          birthDayPicker(context);
                        },
                        label: 'Tanggal Lahir',
                      );
                    }),
                  ),

                  const SizedBox(
                    width: 5,
                  ),

                  /// jenis kelamin textfields
                  Flexible(
                    child: Consumer<RegisterViewModel>(
                        builder: (context, value, child) {
                      return ReadOnlyTextFields(
                        controller: value.registerJenisKelaminController,
                        onTap: () {
                          modalBottomSheed(
                            context,
                            const SelectGenderWidget(),
                          );
                        },
                        label: 'Jenis Kelamin',
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
                controller: registerProvider.registerEmailController,
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
                  controller: value.registerPasswordController,
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
                  controller: value.confirmRegisterPasswordController,
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
