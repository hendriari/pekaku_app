// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
//
// import 'package:image_picker/image_picker.dart';
// import 'package:pekaku_app/services/firebase_services/firestore_services.dart';
// import 'package:pekaku_app/utils/utils.dart';
//
// class CreatePostViewModel with ChangeNotifier {
//   Uint8List? _file;
//
//   pickImage() async {
//     final ImagePicker imagePicker = ImagePicker();
//     XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
//     if (file != null) {
//       return await file.readAsBytes();
//     }
//     print('No Image Selected');
//   }
//
//   late bool _isLoading = false;
//
//   /// post
//   void postImage(context, String uid, String username, String profImage) async {
//     _isLoading = true;
//     try {
//       String res = await FireStoreServices().uploadPost(
//           _descriptionController.text, _file!, uid, username, profImage, 0, 0);
//       if (res == "success") {
//         _isLoading = false;
//
//         showSnackBar(
//           context,
//           'Posted!',
//         );
//
//         /// cleare image
//         _file = null;
//       } else {
//         showSnackBar(context, res);
//       }
//     } catch (err) {
//       _isLoading = false;
//
//       showSnackBar(
//         context,
//         err.toString(),
//       );
//     }
//   }
//
//   /// ambil foto dan lokasi
// // File? _images;
// //
// // File? get images => _images;
// //
// // /// ambil foto seklaian lokasi
// // Future<void> pickImage() async {
// //   /// ambil gambar
// //   final ImagePicker imagePicker = ImagePicker();
// //   final XFile? pickedImage =
// //   await imagePicker.pickImage(source: ImageSource.camera);
// //   _images = File(pickedImage!.path);
// //   debugPrint(_images.toString());
// //
// //   /// sekalian ambil lokasi
// //   //checkAndGetPosition();
// //
// //   notifyListeners();
// // }
// //
// // /// cek image sebelum lanjut
// // void checkImages(context) {
// //   if (_images == null) {
// //     toastAllert('Foto tidak boleh kosong !', MyColor.errorColor, 1);
// //   } else {
// //     // Provider.of<NavigatorProvider>(context, listen: false)
// //     //     .navigasiBuatPostingan(context);
// //   }
// // }
// }
