import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/widget/create_post_widget/create_post_dialog.dart';
import 'package:pekaku_app/src/widget/home_widget/sliver_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeHeight = MediaQuery.of(context).size.height;
    final double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            /// header
            SliverWidget(
              onPressed: () {
                createPost(context);
              },
              headerIcon: Icon(
                FontAwesomeIcons.paperPlane,
                color: MyColor.deepAqua,
              ),
              text1: 'postingan',
              text2: 'ku',
            ),
          ];
        },
        body: SingleChildScrollView(
          /// konten
          child: Padding(
            padding:
                EdgeInsets.only(left: sizeWidth / 3, top: sizeHeight / 2.5),
            child: const Text('Belum ada postingan'),
          ),
        ),
      ),
    );
  }
}
