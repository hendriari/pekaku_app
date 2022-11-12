import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/text_editing_controller.dart';
import 'package:pekaku_app/src/services/firebase_services/firestore_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/createpost_view_model/createpost_view_model.dart';
import 'package:pekaku_app/src/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/src/widgets/dialog/toast_allert.dart';
import 'package:provider/provider.dart';

class CreatePostServices with ChangeNotifier {
  late bool _postLoading = false;

  get postLoading => _postLoading;

  Future<void> postImage(
      context, String uid, String username, String profImage) async {
    final createPost = Provider.of<CreatePostViewModel>(context, listen: false);
    _postLoading = true;
    notifyListeners();
    try {
      await FireStoreServices().uploadPost(
        TextEditing.keteranganPostController.text,
        createPost.images!,
        uid,
        username,
        profImage,
        createPost.address,
        createPost.posLatitude,
        createPost.posLongitude,
      );
      _postLoading = false;
      toastAllert('Sukses Post', MyColor.deepAqua, 1);
      TextEditing.keteranganPostController.clear();
      Provider.of<NavigasiViewModel>(context, listen: false)
          .navigasiSetelahPost(context);
      notifyListeners();
    } on FirebaseException catch (e) {
      toastAllert('${e.message}', MyColor.errorColor, 1);
    }
  }
}
