import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/widget/create_post_widget/create_post_dialog.dart';
import 'package:pekaku_app/src/widget/home_widget/sliver_widget.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      createPost(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            /// header
            SliverWidget(
              onPressed: (){
                createPost(context);
              },
              headerIcon: Icon(
                FontAwesomeIcons.paperPlane,
                color: MyColor.deepAqua,
              ),
              text1: 'postingan',
              text2: '',
            ),
          ];
        },
        body: SingleChildScrollView(
          /// konten
          child: Column(
            children: const [
              /// konten postingan
              Center(
                child: Text('Belum ada postingan'),
              ),

              /// batas navigasi bar
              SizedBox(
                height: 75,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
