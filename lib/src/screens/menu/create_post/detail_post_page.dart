import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/helper/text_editing_controller.dart';
import 'package:pekaku_app/src/services/create_post_services/create_post_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/createpost_view_model/createpost_view_model.dart';
import 'package:pekaku_app/src/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/src/view_model/user_view_model/user_view_model.dart';
import 'package:pekaku_app/src/widgets/widget/button_widget.dart';
import 'package:pekaku_app/src/widgets/widget/text_field_widget.dart';
import 'package:pekaku_app/src/widgets/widget/icon_button_widget.dart';
import 'package:pekaku_app/src/widgets/widget/text_header.dart';
import 'package:provider/provider.dart';

class DetailPostPage extends StatefulWidget {
  const DetailPostPage({Key? key}) : super(key: key);

  @override
  State<DetailPostPage> createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  @override
  void initState() {
    super.initState();

    final locationPost =
        Provider.of<CreatePostViewModel>(context, listen: false);
    locationPost.getAddressFromLongLat(
        locationPost.posLatitude, locationPost.posLongitude);
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   TextEditing.keteranganPostController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final UserViewModel users = Provider.of<UserViewModel>(context, listen: false);
    final double sizeHeight = MediaQuery.of(context).size.height;
    final double paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: paddingTop),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// text Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// back button
                  IconButtonWidget(
                    onTap: () {
                      context.read<CreatePostViewModel>().clearImage(context);
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
                    'detail ',
                    'postingan',
                  ),

                  const Spacer(),

                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              /// foto
              Consumer<CreatePostViewModel>(builder: (context, value, child) {
                return Container(
                  height: sizeHeight * .5,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: MyColor.deepAqua),
                  ),
                  child: Image.file(
                    value.images!,
                    fit: BoxFit.contain,
                  ),
                );
              }),

              const SizedBox(
                height: 18,
              ),

              /// date create post
              Consumer<CreatePostViewModel>(
                builder: (context, value, child) => Align(
                  alignment: Alignment.bottomRight,
                  child: Text('${value.dateCreatePost}'),
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              const Text('Lokasi'),

              const SizedBox(
                height: 10,
              ),

              /// lokasi
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: MyColor.deepAqua,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      /// alamat user
                      Consumer<CreatePostViewModel>(
                        builder: (context, value, child) => Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '${value.address}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),

                      /// google maps button
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          splashColor: MyColor.lichen,
                          borderRadius: BorderRadius.circular(40),
                          onTap: () {
                            context
                                .read<NavigasiViewModel>()
                                .navigasiOpenGoogleMaps(context);
                          },
                          child: SvgPicture.asset(
                              'assets/svg_assets/google_maps.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Text('Keterangan'),

              const SizedBox(
                height: 10,
              ),

              /// field keterangan
          TextFormFields(
            obscureText: false,
            controller: TextEditing.keteranganPostController,
            maxLines: 5,
            textInputAction: TextInputAction.done,
            label: '',
          ),

              const SizedBox(
                height: 30,
              ),

              /// button submit
              ButtonWidget(
                sizeWidth: double.infinity,
                backgroundColor: MyColor.deepAqua,
                borderRadius: BorderRadius.circular(40),
                onPressed: () {
                  context.read<CreatePostServices>().postImage(
                        context,
                        users.getUser.uid,
                        users.getUser.username,
                        users.getUser.photoUrl,
                      );
                },
                child: const Text('Posting'),
              ),

              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
