import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/home_widget/home_shimmer_loading.dart';
import 'package:pekaku_app/src/widgets/home_widget/post_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/widgets/home_widget/sliver_widget.dart';
import 'package:pekaku_app/src/widgets/widget/shimmer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            /// header
            const SliverWidget(
              text1: 'peka',
              text2: 'kuy',
            ),
          ];
        },
        body: SingleChildScrollView(
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('postinganTerbaru')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ShimmersLoading(
                    child: HomeShimmerLoading(),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => PostCard(
                      snap: snapshot.data!.docs[index].data(),
                    ),
                  );
                }
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sorry an error occurred',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.faceSadCry,
                        color: MyColor.deepAqua,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
