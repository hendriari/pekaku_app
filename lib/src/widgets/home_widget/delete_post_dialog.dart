import 'package:flutter/material.dart';
import 'package:pekaku_app/src/services/home_services/home_services.dart';
import 'package:provider/provider.dart';

Widget deletePostDialog(context, postId) {
  return Consumer<HomeServices>(builder: (context, value, child) {
    return Dialog(
      child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shrinkWrap: true,
          children: [
            'Hapus Postingan',
          ]
              .map(
                (e) => InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(e),
                    ),
                    onTap: () {
                      value.deletePost(context, postId);

                      Navigator.of(context).pop();
                    }),
              )
              .toList()),
    );
  });
}
