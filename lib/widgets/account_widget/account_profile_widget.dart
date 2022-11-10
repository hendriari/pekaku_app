import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pekaku_app/helper/text_editing_controller.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/view_model/account_view_model/account_view_model.dart';
import 'package:pekaku_app/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/widgets/account_widget/edit_birthday_profile.dart';
import 'package:pekaku_app/widgets/account_widget/edit_gender_profile.dart';
import 'package:pekaku_app/widgets/account_widget/logout_dialog.dart';
import 'package:pekaku_app/widgets/account_widget/row_widget.dart';
import 'package:pekaku_app/widgets/account_widget/text_field_account.dart';
import 'package:pekaku_app/widgets/dialog/bottom_sheed.dart';
import 'package:pekaku_app/widgets/widget/button_widget.dart';
import 'package:pekaku_app/widgets/widget/read_only_textfield.dart';
import 'package:pekaku_app/widgets/widget/shimmer_widget.dart';
import 'package:pekaku_app/widgets/widget/text_header.dart';
import 'package:provider/provider.dart';

class AccountProfileWidget extends StatelessWidget {
  final String imageUser;
  final String textNameHeader;
  final String textEmailUser;
  final String nameTextForm;
  final String tanggalLahirTextForm;
  final String jenisKelaminTextForm;
  final String alamatTextForm;

  const AccountProfileWidget({
    Key? key,
    required this.imageUser,
    required this.textNameHeader,
    required this.textEmailUser,
    required this.nameTextForm,
    required this.tanggalLahirTextForm,
    required this.jenisKelaminTextForm,
    required this.alamatTextForm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.of(context).padding.top;
    final double sizeHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: paddingTop),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// text header
            textHeader('Profil', 'ku'),

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
                    /// image header
                    CachedNetworkImage(
                      imageUrl: imageUser,
                      imageBuilder: (context, imageProvider) => InkWell(
                        onTap: () {
                          /// show profile image
                          showProfileImage(context);
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: MyColor.marble,
                          backgroundImage: imageProvider,
                        ),
                      ),
                      placeholder: (context, url) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const ShimmersLoading(
                          child: CircleAvatar(
                            radius: 50,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Text('Can\'t load image'),
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),

                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// name user
                          Text(
                            textNameHeader,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: MyColor.white),
                            overflow: TextOverflow.ellipsis,
                          ),

                          /// email user
                          Text(
                            textEmailUser,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: MyColor.marble),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
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
                      text: 'Edit Profil',
                      onTap: () {
                        profileDetail(context);
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
                            .read<NavigasiViewModel>()
                            .navigasiToSettingProfile(context);
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
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

            SizedBox(
              height: sizeHeight * .13,
            ),

            SizedBox(
              width: 120,
              child: Column(
                children: [
                  /// nama aplikasi
                  Text(
                    'Pekakuy',
                    style: GoogleFonts.merienda(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: MyColor.deepAqua,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  /// versi aplikasi
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'v 1.0.0',
                      style: TextStyle(color: MyColor.gray),
                    ),
                  ),
                ],
              ),
            ),

            /// batas bawah
            SizedBox(
              height: sizeHeight * .13,
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

  /// show image profile
  Future showProfileImage(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(
              imageUser,
            ),
          );
        });
  }

  /// widget edit profile
  Future profileDetail(context) {
    final accountProvider =
        Provider.of<AccountViewModel>(context, listen: false);
    final double paddingTop = MediaQuery.of(context).padding.top;
    final double sizeWidth = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 15,
          ),
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
              CachedNetworkImage(
                imageUrl:
                    'https://cdn3d.iconscout.com/3d/premium/thumb/man-avatar-6299539-5187871.png',
                imageBuilder: (context, imageProvider) => InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: MyColor.marble,
                    backgroundImage: imageProvider,
                  ),
                ),
                placeholder: (context, url) => ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const ShimmersLoading(
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Text('Can\'t load image'),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              /// textfield name
              TextFormAccount(
                hint: nameTextForm,
                controller: TextEditing.usernameUpdateProfilController,
                obscureText: false,
                textInputAction: TextInputAction.done,
              ),

              const SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  /// textfield tanggal lahir
                  Flexible(
                    child: ReadOnlyTextFields(
                      hint: tanggalLahirTextForm,
                      controller: TextEditing.tanggalLahirUpdateProfileController,
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
                      hint: jenisKelaminTextForm,
                      controller: TextEditing.jenisKelaminRegisterController,
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

              ///textfield alamat
              TextFormAccount(
                hint: alamatTextForm,
                controller: TextEditing.alamatUpdateProfileController,
                maxLines: 2,
                minLines: 1,
                textInputAction: TextInputAction.done,
                obscureText: false,
              ),

              const SizedBox(
                height: 15,
              ),

              ///button update data
              ButtonWidget(
                borderRadius: BorderRadius.circular(40),
                onPressed: () async {
                  accountProvider.updateDataUSer(context);
                },
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
      },
    );
  }
}
