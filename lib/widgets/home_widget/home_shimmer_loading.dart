import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/utils/colors.dart';

class HomeShimmerLoading extends StatelessWidget {
  const HomeShimmerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 5,
              bottom: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: MyColor.gray),
              borderRadius: BorderRadius.circular(20),
              color: MyColor.gray,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(2, 2),
                    blurRadius: 2,
                    color: MyColor.gray,
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
                      const CircleAvatar(
                        radius: 30,
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
                              Text('Username',
                                  style: Theme.of(context).textTheme.headline5),
                            ],
                          ),
                        ),
                      ),

                      /// check user uid
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                ///like
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: MyColor.gray,
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                    ),
                  ],
                ),

                /// bottom
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          CupertinoIcons.chat_bubble,
                          color: MyColor.gray,
                        ),
                        onPressed: () {}),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            icon: const Icon(Icons.location_on_sharp),
                            color: MyColor.gray,
                            onPressed: () {}),
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
                          'loading',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Text(
                          'Mohon Tunggu',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),

                      /// semua komentar
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'Lihat semua komentar',
                          style: TextStyle(
                            fontSize: 16,
                            color: MyColor.gray,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'Mohon Tunggu',
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
          ),Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 5,
              bottom: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: MyColor.gray),
              borderRadius: BorderRadius.circular(20),
              color: MyColor.gray,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(2, 2),
                    blurRadius: 2,
                    color: MyColor.gray,
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
                      const CircleAvatar(
                        radius: 30,
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
                              Text('Username',
                                  style: Theme.of(context).textTheme.headline5),
                            ],
                          ),
                        ),
                      ),

                      /// check user uid
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                ///like
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: MyColor.gray,
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                    ),
                  ],
                ),

                /// bottom
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          CupertinoIcons.chat_bubble,
                          color: MyColor.gray,
                        ),
                        onPressed: () {}),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            icon: const Icon(Icons.location_on_sharp),
                            color: MyColor.gray,
                            onPressed: () {}),
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
                          'loading',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Text(
                          'Mohon Tunggu',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),

                      /// semua komentar
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'Lihat semua komentar',
                          style: TextStyle(
                            fontSize: 16,
                            color: MyColor.gray,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'Mohon Tunggu',
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
          ),
        ],
      ),
    );
  }
}
