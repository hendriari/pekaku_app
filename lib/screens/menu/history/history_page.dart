import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/widgets/home_widget/home_shimmer_loading.dart';
import 'package:pekaku_app/widgets/home_widget/post_card.dart';
import 'package:pekaku_app/widgets/home_widget/sliver_widget.dart';
import 'package:pekaku_app/widgets/widget/shimmer_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            /// header
            SliverWidget(
              onPressed: () {},
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
              stream: FirebaseFirestore.instance
                  .collection('postinganBaru')
                  .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ShimmersLoading(
                    child: HomeShimmerLoading(),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (ctx, index) => PostCard(
                    snap: snapshot.data!.docs[index].data(),
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
