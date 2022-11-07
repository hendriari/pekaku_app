import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/view_model/createpost_view_model/createpost_provider.dart';

class PostServicesProvider with ChangeNotifier {
  final CreatePostViewModel _createPostViewModel = CreatePostViewModel();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _keteranganController = TextEditingController();

  get keteranganController => _keteranganController;

  /// firebase auth register account
  // Future<void> register(context) async {
  //   try {
  //     await auth
  //         .authRegister(
  //         email: _registerEmailController.text,
  //         password: _registerPasswordController.text)
  //         .then(
  //           (value) => {
  //         sendUserDetailFirestore(),
  //       },
  //     );
  //     toastAllert(
  //       'Berhasil mendaftar',
  //       MyColor.deepAqua,
  //       2,
  //     );
  //     _registerUsernameController.clear();
  //     _registerAlamatController.clear();
  //     _registerTanggalLahirController.clear();
  //     _registerJenisKelaminController.clear();
  //     _registerEmailController.clear();
  //     _registerPasswordController.clear();
  //     _confirmRegisterPasswordController.clear();
  //     Provider.of<NavigatorProvider>(context, listen: false)
  //         .navigasiCheckLogin(context);
  //     // _registerUsernameController.dispose();
  //     // _registerEmailController.dispose();
  //     // _registerAlamatController.dispose();
  //     // _registerJenisKelaminController.dispose();
  //     // _registerTanggalLahirController.dispose();
  //     // _confirmRegisterPasswordController.dispose();
  //     // _registerPasswordController.dispose();
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       return toastAllert('Password lemah', MyColor.errorColor, 1);
  //     } else if (e.code == 'email-already-in-use') {
  //       return toastAllert('Email sudah digunakan', MyColor.errorColor, 1);
  //     } else {
  //       return toastAllert('${e.message}', MyColor.errorColor, 1);
  //     }
  //   }
  // }

  /// send user data ke firestore
  // Future<void> sendUserDetailFirestore() async {
  //   final users = _firebaseAuth.currentUser;
  //
  //   'email' = users!.email;
  //   'uid' = users.uid;
  //   'pos'
  //
  //
  //   await _firestore
  //       .collection('userPost')
  //       .doc(users.uid);
  // }

  Future<void> createPost() async {
    final users = _firebaseAuth.currentUser;
    final detailPost = _createPostViewModel;
    _firestore.collection('userPost').add({
      'name': users!.uid,
      'datePost': detailPost.dateCreatePost,
      'lokasiPost': detailPost.address,
      'keterangan': _keteranganController.text,
      'latitude': detailPost.posLatitude!,
      'longtitude': detailPost.posLongitude!,
      'imagePost': detailPost.images,
    });
  }
}
