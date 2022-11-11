import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/services/firebase_services/firestore_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/dialog/toast_allert.dart';

class HomeServices with ChangeNotifier {
  final TextEditingController _commentController = TextEditingController();

  get commentController => _commentController;


  /// post comment
  void postComment(context, dynamic postId, String uid, String name,
      String profilePic) async {
    try {
      await FireStoreServices().postComment(
        postId,
        _commentController.text,
        uid,
        name,
        profilePic,
      );
      _commentController.clear();
    } catch (e) {
      toastAllert('$e', MyColor.errorColor, 1);
    }
  }

  /// delete post
  deletePost(context, String postId) async {
    try {
      await FireStoreServices().deletePost(postId);
    } on FirebaseException catch (e) {
      toastAllert('${e.message}', MyColor.errorColor, 1);
    }
  }
}
