import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/createpost_view_model/createpost_view_model.dart';
import 'package:provider/provider.dart';

class GoogleMapsWidget extends StatefulWidget {
  const GoogleMapsWidget({super.key});

  @override
  State<GoogleMapsWidget> createState() => GoogleMapsWidgetState();
}

class GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  @override
  Widget build(BuildContext context) {
    final mapsProvider =
        Provider.of<CreatePostViewModel>(context, listen: false);

    return Scaffold(
      body: Consumer<CreatePostViewModel>(builder: (context, value, child) {
        return GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              value.posLatitude,
              value.posLongitude,
            ),
            zoom: 14.4746,
          ),
          polylines: {
            Polyline(
                polylineId: const PolylineId('Route'),
                points: [
                  /// posisi
                  LatLng(value.posLatitude + 10, value.posLongitude + 10),

                  ///tujuan
                  LatLng(value.posLongitude, value.posLatitude),
                ],
                color: MyColor.deepAqua,
                width: 5),
          },
          markers: {
            Marker(
              markerId: const MarkerId('Target Lokasi'),
              position: LatLng(value.posLatitude, value.posLongitude),
            ),
            Marker(
              markerId: const MarkerId('Posisi Saya'),
              position: LatLng(
                value.posLatitude,
                value.posLongitude,
              ),
            ),
          },
          onMapCreated: (GoogleMapController controller) {
            value.googleController.complete(controller);
          },
        );
      }),
      floatingActionButton:
          Consumer<CreatePostViewModel>(builder: (context, value, index) {
        return FloatingActionButton.extended(
          onPressed: () {
            mapsProvider.posisisUser(
              value.posLatitude,
              value.posLongitude,
            );
          },
          label: Text(
            'Posisi',
            style: TextStyle(color: MyColor.deepAqua, fontSize: 18),
          ),
          icon: Icon(
            Icons.location_searching_sharp,
            color: MyColor.deepAqua,
            size: 28,
          ),
        );
      }),
    );
  }
}
