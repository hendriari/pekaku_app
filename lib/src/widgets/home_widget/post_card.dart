import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pekaku_app/src/screens/menu/home/comments_page.dart';
import 'package:pekaku_app/src/screens/menu/home/google_maps.dart';
import 'package:pekaku_app/src/services/firebase_services/firestore_services.dart';
import 'package:pekaku_app/src/services/home_services/home_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/createpost_view_model/createpost_view_model.dart';
import 'package:pekaku_app/src/view_model/home_view_model/home_view_model.dart';
import 'package:pekaku_app/src/widgets/home_widget/delete_post_dialog.dart';
import 'package:pekaku_app/src/widgets/home_widget/like_animation.dart';
import 'package:pekaku_app/src/widgets/widget/shimmer_widget.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final Map<String, dynamic> snap;

  const PostCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    final gettingUsers = FirebaseAuth.instance.currentUser!.uid;

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
                CachedNetworkImage(
                  imageUrl: widget.snap['profImage'].toString(),
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 30,
                    backgroundImage: imageProvider,
                    backgroundColor: MyColor.marble,
                  ),
                  placeholder: (context, url) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ShimmersLoading(
                      child: CircleAvatar(
                        backgroundColor: MyColor.gray,
                        radius: 30,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Text('Can\'t load image'),
                  ),
                ),

                /// username
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(widget.snap['username'].toString(),
                        style: Theme.of(context).textTheme.headline6),
                  ),
                ),

                /// check user uid
                widget.snap['uid'].toString() == gettingUsers
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
                    : const SizedBox(),
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
                  gettingUsers,
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
                isAnimating: widget.snap['likes'].contains(gettingUsers),
                smallLike: true,
                child: IconButton(
                  icon: widget.snap['likes'].contains(gettingUsers)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                        ),
                  onPressed: () => FireStoreServices().likePost(
                    widget.snap['postId'].toString(),
                    gettingUsers,
                    widget.snap['likes'],
                  ),
                ),
              ),

              IconButton(
                icon: Icon(
                  FontAwesomeIcons.rocketchat,
                  color: MyColor.deepAqua,
                ),
                onPressed: () => Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => CommentsPage(
                      postId: widget.snap['postId'].toString(),
                    ),
                  ),
                ),
              ),

              /// google maps button
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      splashColor: MyColor.deepAqua,
                      onTap: () async {
                        context
                            .read<CreatePostViewModel>()
                            .checkAndGetPosition();
                        await Navigator.of(context).push(
                          CupertinoPageRoute(
                              builder: (context) => const GoogleMapsPage()),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/svg_assets/google_maps.svg',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

          /// deskripsi dan keterangan post
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// like dan comment
                Text(
                  '${widget.snap['likes'].length} likes',
                  style: Theme.of(context).textTheme.bodyText2,
                ),

                /// deskripsi
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

                SizedBox(
                  width: double.infinity,
                  child: Divider(
                    color: MyColor.mist,
                  ),
                ),

                /// detail lokasi
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: Text(
                    'Lokasi : ${widget.snap['location']}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                /// semua komentar
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Consumer<HomeServices>(
                        builder: (context, value, child) {
                      return Text(
                        'Lihat semua komentar',
                        style: TextStyle(
                          fontSize: 16,
                          color: MyColor.gray,
                        ),
                      );
                    }),
                  ),
                  onTap: () => Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => CommentsPage(
                        postId: widget.snap['postId'].toString(),
                      ),
                    ),
                  ),
                ),

                /// date publish
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
