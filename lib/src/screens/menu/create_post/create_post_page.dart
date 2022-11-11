import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/view_model/createpost_view_model/createpost_view_model.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/widget/icon_button_widget.dart';
import 'package:pekaku_app/src/widgets/widget/text_header.dart';
import 'package:provider/provider.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    final double sizeHeight = MediaQuery.of(context).size.height;
    final double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColor.white,
      appBar: AppBar(
        title: textHeader('buat ', 'postingan'),
        centerTitle: true,
        backgroundColor: MyColor.transparan,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              height: sizeHeight * .35,
              width: sizeWidth * .75,
              decoration: BoxDecoration(
                color: MyColor.mist,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// pick foto
                  Flexible(
                    fit: FlexFit.tight,
                    child: InkWell(
                      onTap: () {
                        context
                            .read<CreatePostViewModel>()
                            .pickedImage(context);
                      },
                      child: Consumer<CreatePostViewModel>(
                          builder: (context, value, child) {
                        return value.images != null
                            ? Image.file(
                                value.images!,
                                fit: BoxFit.cover,
                              )
                            : Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: MyColor.mist.withOpacity(.6),
                                child: Center(
                                  child: Icon(
                                    CupertinoIcons.camera,
                                    color: MyColor.marble,
                                    size: 45,
                                  ),
                                ),
                              );
                      }),
                    ),
                  ),

                  /// button lanjut
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5,
                        top: 10,
                        right: 12,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          const Spacer(),
                          Text(
                            'Ambil Foto',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: MyColor.deepAqua),
                          ),
                          const Spacer(),
                          IconButtonWidget(
                            onTap: () {
                              context
                                  .read<CreatePostViewModel>()
                                  .checkImages(context);
                            },
                            heightContainer: 40,
                            widthContainer: 40,
                            iconColor: MyColor.deepAqua,
                            icon: FontAwesomeIcons.handPointRight,
                            borderColor: MyColor.outlineBorder,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 75,
            ),
          ],
        ),
      ),
    );
  }
}
