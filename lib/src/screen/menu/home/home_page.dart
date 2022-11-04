import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/widget/home_widget/post_widget.dart';
import 'package:pekaku_app/src/widget/home_widget/sliver_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [

            /// header
            SliverWidget(
              onPressed: (){},
              headerIcon: Icon(
                CupertinoIcons.bell,
                color: MyColor.deepAqua,
              ),
              text1: 'peka',
              text2: 'kuy',
            ),
          ];
        },
        body: SingleChildScrollView(
          /// konten
          child: Column(
            children: const [
              /// konten postingan
              PostWidget(),
              PostWidget(),
              PostWidget(),

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
