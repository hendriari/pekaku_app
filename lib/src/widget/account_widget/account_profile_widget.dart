import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/model/user_model.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/utils/custom_fonts.dart';
import 'package:pekaku_app/src/view_model/account_view_model/account_provider.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:pekaku_app/src/widget/account_widget/edit_birthday_profile.dart';
import 'package:pekaku_app/src/widget/account_widget/edit_gender_profile.dart';
import 'package:pekaku_app/src/widget/account_widget/logout_dialog.dart';
import 'package:pekaku_app/src/widget/account_widget/row_widget.dart';
import 'package:pekaku_app/src/widget/account_widget/text_field_account.dart';
import 'package:pekaku_app/src/widget/button/button_widget.dart';
import 'package:pekaku_app/src/widget/dialog/bottom_sheed.dart';
import 'package:pekaku_app/src/widget/widget/read_only_textfield.dart';
import 'package:provider/provider.dart';

class AccountProfileWidget extends StatelessWidget {
  const AccountProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accountProvider =
        Provider.of<AccountViewModel>(context, listen: false);
    final UserModel users = accountProvider.userModel;
    final double paddingTop = MediaQuery.of(context).padding.top;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: paddingTop),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// text header
            RichText(
              text: TextSpan(
                text: 'Profil',
                style: CustomFonts.customHeaderText
                    .copyWith(color: MyColor.deepAqua),
                children: [
                  TextSpan(
                    text: 'ku',
                    style: CustomFonts.customHeaderText.copyWith(
                      color: MyColor.deepAqua.withOpacity(.6),
                    ),
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
                color: MyColor.deepAqua,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(2, 3),
                    color: MyColor.lichen,
                    blurRadius: 4,
                  )
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 3,
                  colorFilter: ColorFilter.mode(
                    MyColor.deepAqua.withOpacity(.8),
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
                    InkWell(
                      onTap: (){},
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://cdn1-production-images-kly.akamaized.net/sBbpp2jnXav0YR8a_VVFjMtCCJQ=/1200x1200/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/882764/original/054263300_1432281574-Boruto-Naruto-the-Movie-trailer.jpg',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${users.name}',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: MyColor.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${users.email}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: MyColor.marble),
                          overflow: TextOverflow.ellipsis,
                        ),
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
              color: MyColor.mist,
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
                      onTap: () {
                        modalBottomSheed(
                          context,
                          profileDetail(context),
                        );
                      },
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    /// tentang app
                    rowWidget(
                      context: context,
                      icon: CupertinoIcons.info,
                      text: 'Tentang Aplikasi',
                      onTap: () {
                        modalBottomSheed(
                          context,
                          aboutApp(),
                        );
                      },
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    /// pengaturan
                    rowWidget(
                      context: context,
                      icon: CupertinoIcons.settings,
                      text: 'Pengaturan',
                      onTap: () {
                        context
                            .read<NavigatorProvider>()
                            .navigasiToSettingProfile(context);
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            /// logout
            Container(
              height: 70,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: MyColor.mist,
                borderRadius: BorderRadius.circular(20),
              ),
              child: rowWidget(
                  context: context,
                  icon: Icons.logout,
                  text: 'Logout',
                  onTap: () {
                    logoutDialog(context);
                  }),
            ),

            /// batas bawah
            const SizedBox(
              height: 75,
            ),
          ],
        ),
      ),
    );
  }

  /// tentang aplikasi
  Widget aboutApp() {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12, bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 50,
            child: Divider(
              color: MyColor.dark,
              thickness: 2,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'PekakuApp adalah aplikasi pelaporan fasilitas umum yang rusak, aplikasi ini memberikan kesempatan bagi masyarakat umum untuk memposting fasilitas umum yang rusak, fasilitas tersebut berupa kursi umum, jalan raya berlubang, jembatan yang akan rubuh, dan lain sebagainya. Harapan dibuat aplikasi ini untuk menyampaikan Kepada Pihak Berwajib atau Pemerintah terhadap fasilitas umum yang rusak, agar Pihak Berwajib atau Pemerintah dapat segera menangani kerusakan tersebut. Applikasi ini dibuat untuk memenuhi tugas Mini Projek yang telah menjadi kurikulum Alterra Academy.',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  /// widget edit profile
  Widget profileDetail(context) {
    final accountProvider =
        Provider.of<AccountViewModel>(context, listen: false);
    final UserModel users = accountProvider.userModel;
    final double paddingTop = MediaQuery.of(context).padding.top;
    final double sizeWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
      child: Column(
        children: [
          SizedBox(
            width: 50,
            child: Divider(
              color: MyColor.dark,
              thickness: 2,
            ),
          ),
          SizedBox(
            height: paddingTop,
          ),

          /// image profile
          const CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
              'https://cdn1-production-images-kly.akamaized.net/sBbpp2jnXav0YR8a_VVFjMtCCJQ=/1200x1200/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/882764/original/054263300_1432281574-Boruto-Naruto-the-Movie-trailer.jpg',
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          /// textfield name
          TextFormAccount(
            hint: '${users.name}',
            controller: accountProvider.profileUsernameController,
            obscureText: false,
            textInputAction: TextInputAction.done,
          ),

          const SizedBox(
            height: 10,
          ),

          ///textfield alamat
          TextFormAccount(
            hint: '${users.alamat}',
            controller: accountProvider.profileAlamatController,
            maxLines: 2,
            minLines: 1,
            obscureText: false,
          ),

          const SizedBox(
            height: 10,
          ),

          Row(
            children: [
              /// textfield tanggal lahir
              Flexible(
                child: ReadOnlyTextFields(
                  hint: '${users.tanggallahir}',
                  controller: accountProvider.profileTanggalLahirController,
                  onTap: () {
                    profileBirthDayPicker(context);
                  },
                ),
              ),

              const SizedBox(
                width: 7,
              ),

              /// textfield kelamin
              Flexible(
                child: ReadOnlyTextFields(
                  hint: '${users.kelamin}',
                  controller: accountProvider.profileJenisKelaminController,
                  onTap: () {
                    modalBottomSheed(
                      context,
                      const EditGenderProfile(),
                    );
                  },
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          ///textfield email
          TextFormAccount(
            hint: '${users.email}',
            controller: accountProvider.profileEmailController,
            obscureText: false,
            textInputAction: TextInputAction.done,
          ),

          const SizedBox(
            height: 15,
          ),

          ///button update data
          ButtonWidget(
            borderRadius: BorderRadius.circular(40),
            onPressed: () async {},
            backgroundColor: MyColor.deepAqua,
            sizeWidth: sizeWidth * .95,
            child: Text(
              'Simpan',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: MyColor.white),
            ),
          ),
        ],
      ),
    );
  }
}
