import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/color.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

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
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://www.greenscene.co.id/wp-content/uploads/2021/09/Boruto-3-696x497.jpg',
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Nama Pemosting',
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
                      'https://www.greenscene.co.id/wp-content/uploads/2021/09/Boruto-3-696x497.jpg',
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
                    'https://www.greenscene.co.id/wp-content/uploads/2021/09/Boruto-3-696x497.jpg',
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
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
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
