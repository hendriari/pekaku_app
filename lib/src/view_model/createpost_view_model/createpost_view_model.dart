import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:pekaku_app/src/widgets/dialog/toast_allert.dart';
import 'package:provider/provider.dart';

class CreatePostViewModel with ChangeNotifier {
  File? _images;

  File? get images => _images;

  /// ambil foto seklaian lokasi
  Future<void> pickedImage(context) async {
    /// ambil gambar
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 55,
    );
    _images = File(pickedImage!.path);
    debugPrint(_images.toString());

    /// sekalian dapat posisi
    Provider.of<CreatePostViewModel>(context, listen: false)
        .checkAndGetPosition();
    notifyListeners();
  }

  /// cek image sebelum lanjut
  void checkImages(context) {
    if (_images == null) {
      toastAllert('Foto tidak boleh kosong !', MyColor.errorColor, 1);
    } else {
      Provider.of<NavigasiViewModel>(context, listen: false)
          .navigasiBuatPostingan(context);
    }
  }

  /// clear image
  void clearImage(context) {
    _images == null;
    Provider.of<NavigasiViewModel>(context, listen: false)
        .navigasiBack(context);
    notifyListeners();
  }

  /// date posting
  final _dateCreatePost = DateFormat('EEEE, d MMMM y').format(DateTime.now());

  get dateCreatePost => _dateCreatePost.toString();

  /// lokasi posting
  Position? _posisi;

  get posLongitude => _posisi!.longitude.toDouble();

  get posLatitude => _posisi!.latitude.toDouble();

  /// detail lokasi posting
  String? _address;

  get address => _address;

  /// google map controller
  final Completer<GoogleMapController> _controller = Completer();

  get googleController => _controller;

  /// permission lokasi chekker
  Future<Position> checkAndGetPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return _posisi = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  /// detail lokasi
  Future<void> getAddressFromLongLat(double posLat, double posLong) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(posLat, posLong);
    Placemark place = placemarks[0];
    _address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    notifyListeners();
  }

  /// google kamera posisi user
  Future<void> posisisUser(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(
              lat,
              long,
            ),
            tilt: 59.440717697143555,
            zoom: 19.151926040649414),
      ),
    );
    notifyListeners();
  }
}
