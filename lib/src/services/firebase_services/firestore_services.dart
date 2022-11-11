import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pekaku_app/src/models/post_model.dart';
import 'package:pekaku_app/src/services/firebase_services/firebase_storage_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/dialog/toast_allert.dart';
import 'package:uuid/uuid.dart';

class FireStoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorageServices _firebaseStorageServices =
      FirebaseStorageServices();

  /// upload postingan
  Future<void> uploadPost(
    String description,
    File file,
    String uid,
    String username,
    String profImage,
    String location,
    double latitude,
    double longtitude,
  ) async {
    try {
      String photoUrl = await _firebaseStorageServices.uploadImageToStorage(
          'postinganTerbaru', file, true);
      String postId = const Uuid().v1(); // creates unique id based on time
      PostModel post = PostModel(
        description: description,
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        datePublished: DateTime.now(),
        location: location,
        postUrl: photoUrl,
        profImage: profImage,
        longtitude: longtitude,
        latitude: latitude,
      );
      await _firestore
          .collection('postinganTerbaru')
          .doc(postId)
          .set(post.toJson());
      toastAllert('Berhasil !', MyColor.deepAqua, 1);
    } on FirebaseException catch (e) {
      return toastAllert('${e.message}', MyColor.errorColor, 1);
    }
  }

  /// ngelike postingan
  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        _firestore.collection('postinganTerbaru').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        _firestore.collection('postinganTerbaru').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
    } catch (e) {
      toastAllert(e.toString(), MyColor.errorColor, 1);
    }
  }

  /// komentar post
  Future<void> postComment(String postId, String text, String uid, String name,
      String profilePic) async {
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        _firestore
            .collection('postinganTerbaru')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        toastAllert('Berhasil', MyColor.deepAqua, 1);
      } else {
        toastAllert('Mohon masukan komentar !', MyColor.errorColor, 1);
      }
    } catch (e) {
      toastAllert(e.toString(), MyColor.errorColor, 1);
    }
  }

  /// Delete Post
  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('postinganTerbaru').doc(postId).delete();
      toastAllert('Postingan berhasil dihapus', MyColor.deepAqua, 1);
    } catch (e) {
      toastAllert(e.toString(), MyColor.errorColor, 1);
    }
  }
}
