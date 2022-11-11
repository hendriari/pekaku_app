import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/widget/shimmer_widget.dart';

class CommentCard extends StatelessWidget {
  final dynamic snap;

  const CommentCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [


          /// image profile
          CachedNetworkImage(
            imageUrl: snap.data()['profilePic'],
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
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: snap.data()['name'],
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextSpan(
                          style: Theme.of(context).textTheme.headline6,
                          text: ' ${snap.data()['text']}',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      DateFormat.yMMMd().format(
                        snap.data()['datePublished'].toDate(),
                      ),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: MyColor.gray),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
