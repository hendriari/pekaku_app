import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/createpost_view_model/createpost_provider.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:provider/provider.dart';

Future createPost(BuildContext context) {
  final createPostProvider =
      Provider.of<CreatePostViewModel>(context, listen: false);
  final double sizeHeight = MediaQuery.of(context).size.height;
  final double sizeWidth = MediaQuery.of(context).size.width;
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(8),
            height: sizeHeight * .35,
            width: sizeWidth * .75,
            decoration: BoxDecoration(
              color: MyColor.marble,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// pick foto
                Flexible(
                  fit: FlexFit.tight,
                  child: Material(
                    elevation: 0,
                    color: MyColor.transparan,
                    child: InkWell(
                      onTap: () {
                        createPostProvider.pickImage();
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
                ),

                /// action
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ///back button
                    TextButton(
                      onPressed: () {
                        context.read<NavigatorProvider>().navigasiBack(context);
                      },
                      child: Text(
                        'Batal',
                        style: TextStyle(color: MyColor.errorColor),
                      ),
                    ),

                    ///next button
                    TextButton(
                      onPressed: () {
                        createPostProvider.checkImages(context);

                      },
                      child: Text(
                        'Selanjutnya',
                        style: TextStyle(color: MyColor.lichen),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
