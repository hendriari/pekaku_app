import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/models/user_model.dart';
import 'package:pekaku_app/src/services/home_services/home_services.dart';
import 'package:pekaku_app/src/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/src/view_model/user_view_model/user_view_model.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/home_widget/comment_card.dart';
import 'package:pekaku_app/src/widgets/widget/icon_button_widget.dart';
import 'package:pekaku_app/src/widgets/widget/loading_widget.dart';
import 'package:pekaku_app/src/widgets/widget/shimmer_widget.dart';
import 'package:provider/provider.dart';

class CommentsPage extends StatefulWidget {
  final String postId;

  const CommentsPage({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
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
            .collection('postinganTerbaru')
            .doc(widget.postId)
            .collection('comments')
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingWidget.deepLoading,
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
      /// text input
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [

              /// image profile
              CachedNetworkImage(
                imageUrl: user.photoUrl,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 18,
                  backgroundImage: imageProvider,
                  backgroundColor: MyColor.marble,
                ),
                placeholder: (context, url) => ShimmersLoading(
                  child: CircleAvatar(
                    backgroundColor: MyColor.gray,
                    radius: 18,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Text('Can\'t load image'),
                ),
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
                    'Kirim',
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
