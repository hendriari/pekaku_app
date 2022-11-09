import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pekaku_app/models/user_model.dart';
import 'package:pekaku_app/screens/menu/home/comments_page.dart';
import 'package:pekaku_app/services/firebase_services/firestore_services.dart';
import 'package:pekaku_app/services/home_services/home_services.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/view_model/home_view_model/home_view_model.dart';
import 'package:pekaku_app/view_model/user_view_model/user_view_model.dart';
import 'package:pekaku_app/widgets/home_widget/delete_post_dialog.dart';
import 'package:pekaku_app/widgets/home_widget/like_animation.dart';
import 'package:pekaku_app/widgets/widget/shimmer_widget.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final dynamic snap;

  const PostCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  void initState() {
    super.initState();
    context
        .read<HomeServices>()
        .fetchCommentLen(context, widget.snap['postId']);
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserViewModel>(context).getUser;

    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: MyColor.border),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 2,
              color: MyColor.border,
              blurStyle: BlurStyle.inner),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          ///header
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: <Widget>[
                /// profile image
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    widget.snap['profImage'].toString(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.snap['username'].toString(),
                            style: Theme.of(context).textTheme.headline5),
                      ],
                    ),
                  ),
                ),

                /// check user uid
                widget.snap['uid'].toString() == user.uid
                    ? IconButton(
                        onPressed: () {
                          showDialog(
                            useRootNavigator: false,
                            context: context,
                            builder: (context) {
                              return deletePostDialog(
                                  context, widget.snap['postId']);
                            },
                          );
                        },
                        icon: const Icon(Icons.more_vert),
                      )
                    : Container(),
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          ///like
          Consumer<HomeViewModel>(builder: (context, value, child) {
            return GestureDetector(
              onDoubleTap: () {
                FireStoreServices().likePost(
                  widget.snap['postId'].toString(),
                  user.uid,
                  widget.snap['likes'],
                );
                context.read<HomeViewModel>().likesAnimating();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: widget.snap['postUrl'].toString(),
                      fit: BoxFit.cover,
                      placeholder: (context, url) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const ShimmersLoading(
                          child: Card(),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Text('Can\'t load image'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

          /// bottom
          Row(
            children: <Widget>[
              ///like
              LikeAnimation(
                isAnimating: widget.snap['likes'].contains(user.uid),
                smallLike: true,
                child: IconButton(
                  icon: widget.snap['likes'].contains(user.uid)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                        ),
                  onPressed: () => FireStoreServices().likePost(
                    widget.snap['postId'].toString(),
                    user.uid,
                    widget.snap['likes'],
                  ),
                ),
              ),

              IconButton(
                icon: Icon(
                  CupertinoIcons.chat_bubble,
                  color: MyColor.deepAqua,
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CommentsScreen(
                      postId: widget.snap['postId'].toString(),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: const Icon(Icons.location_on_sharp),
                    color: MyColor.deepAqua,
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),

          /// deskripsi
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w800),
                  child: Text(
                    '${widget.snap['likes'].length} likes',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: Text(
                    widget.snap['description'],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),

                /// semua komentar
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Consumer<HomeServices>(
                        builder: (context, value, child) {
                      return Text(
                        'Lihat semua ${value.commentLen} komentar',
                        style: TextStyle(
                          fontSize: 16,
                          color: MyColor.gray,
                        ),
                      );
                    }),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CommentsScreen(
                        postId: widget.snap['postId'].toString(),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    DateFormat.yMMMd()
                        .format(widget.snap['datePublished'].toDate()),
                    style: TextStyle(
                      color: MyColor.gray,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
