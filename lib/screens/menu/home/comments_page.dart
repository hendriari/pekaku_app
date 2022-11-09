import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/models/user_model.dart';
import 'package:pekaku_app/services/home_services/home_services.dart';
import 'package:pekaku_app/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/view_model/user_view_model/user_view_model.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/widgets/home_widget/comment_card.dart';
import 'package:pekaku_app/widgets/widget/icon_button_widget.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  final dynamic postId;

  const CommentsScreen({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserViewModel>(context).getUser;
    final homeServices = Provider.of<HomeServices>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.transparan,
        elevation: 0,
        actions: [
          const SizedBox(width: 10,),
          IconButtonWidget(
            onTap: () {
              context.read<NavigasiViewModel>().navigasiBack(context);
            },
            heightContainer: 40,
            widthContainer: 50,
            iconColor: MyColor.deepAqua,
            icon: FontAwesomeIcons.handPointLeft,
            borderColor: MyColor.outlineBorder,
          ),

          const Spacer(),
        ],
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('postinganBaru')
            .doc(widget.postId)
            .collection('comments')
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => CommentCard(
              snap: snapshot.data!.docs[index],
            ),
          );
        },
      ),
      // text input
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    controller: homeServices.commentController,
                    decoration: InputDecoration(
                      hintText: 'Comment as ${user.username}',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<HomeServices>().postComment(context,
                      widget.postId, user.uid, user.username, user.photoUrl);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: const Text(
                    'Post',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
