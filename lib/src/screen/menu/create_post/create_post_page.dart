import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/createpost_view_model/createpost_provider.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:pekaku_app/src/widget/button/button_widget.dart';
import 'package:pekaku_app/src/widget/button/icon_button_widget.dart';
import 'package:pekaku_app/src/widget/widget/text_field_widget.dart';
import 'package:pekaku_app/src/widget/widget/text_header.dart';
import 'package:provider/provider.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  void initState() {
    super.initState();

    final mapsPost = Provider.of<CreatePostViewModel>(context, listen: false);

    mapsPost.getAddressFromLongLat(mapsPost.posLatitude, mapsPost.posLongitude);
  }

  @override
  Widget build(BuildContext context) {
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
                      context.read<NavigatorProvider>().navigasiBack(context);
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
                    'buat ',
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
                                .read<NavigatorProvider>()
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
              const TextFormFields(
                obscureText: false,
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
                onPressed: () {},
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
