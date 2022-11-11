import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/colors.dart';

class PostWidget extends StatelessWidget {
  final String imagePost;
  final String pemosting;
  final String fotoPemosting;
  final String keterangan;

  const PostWidget({
    Key? key,
    required this.imagePost,
    required this.pemosting,
    required this.fotoPemosting,
    required this.keterangan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeHeight = MediaQuery.of(context).size.height;
    return Card(
      color: MyColor.white,
      elevation: 2,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// header
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    fotoPemosting,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  pemosting,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            /// gambar postingan
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.network(
                      imagePost,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
              child: Card(
                color: MyColor.white.withOpacity(.9),
                child: SizedBox(
                  height: sizeHeight * .4,
                  width: double.infinity,
                  child: Image.network(
                    imagePost,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            /// button action
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    CupertinoIcons.heart,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    CupertinoIcons.bookmark,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            /// isi postingan
            Text(
              keterangan,
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(
              height: 10,
            ),

            /// tanggal diposting
            Text(
              'Tanggal Diposting',
              style: TextStyle(fontSize: 12, color: MyColor.gray),
            ),
          ],
        ),
      ),
    );
  }
}
