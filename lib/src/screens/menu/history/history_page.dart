import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/history_view_model/history_view_model.dart';
import 'package:pekaku_app/src/widgets/home_widget/home_shimmer_loading.dart';
import 'package:pekaku_app/src/widgets/home_widget/post_card.dart';
import 'package:pekaku_app/src/widgets/home_widget/sliver_widget.dart';
import 'package:pekaku_app/src/widgets/widget/shimmer_widget.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final getHistory = Provider.of<HistoryViewModel>(context, listen: false);
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColor.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            /// header
            const SliverWidget(
              text1: 'postingan',
              text2: 'ku',
            ),
          ];
        },
        body: SingleChildScrollView(
          /// konten
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: StreamBuilder(
              stream: getHistory.getHistoryPost,
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ShimmersLoading(
                    child: HomeShimmerLoading(),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: sizeWidth / 4,
                      right: sizeWidth / 4,
                      top: sizeHeight / 2.5,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Belum Ada Postingan',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (ctx, index) => PostCard(
                      snap: snapshot.data!.docs[index].data(),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(
                    left: sizeWidth / 3,
                    top: sizeHeight / 2.5,
                  ),
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

      //
    );
  }
}
