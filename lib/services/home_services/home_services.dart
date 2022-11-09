import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/services/firebase_services/firestore_services.dart';
import 'package:pekaku_app/utils/utils.dart';

class HomeServices with ChangeNotifier {

  final TextEditingController _commentController = TextEditingController();

  get commentController => _commentController;


  /// post comment
  void postComment(context, dynamic postId,String uid, String name, String profilePic) async {
    try {
      String res = await FireStoreServices().postComment(
        postId,
        _commentController.text,
        uid,
        name,
        profilePic,
      );

      if (res != 'success') {
        showSnackBar(context, res);
      }
      _commentController.clear();
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  int _commentLen = 0;
  get commentLen => _commentLen;

  /// jumlah komentar
  fetchCommentLen(context, postId) async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('postinganBaru')
          .doc(postId)
          .collection('comments')
          .get();
      _commentLen = snap.docs.length;
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
    notifyListeners();
  }

  /// delete post
  deletePost(context, String postId) async {
    try {
      await FireStoreServices().deletePost(postId);
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }
}
