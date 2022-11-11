import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/createpost_view_model/createpost_view_model.dart';
import 'package:pekaku_app/src/widgets/widget/loading_widget.dart';
import 'package:provider/provider.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('postinganTerbaru')
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: showLoading(),
            );
          }
          if (snapshot.hasData || snapshot.data != null) {
            return Stack(
              children: snapshot.data!.docs
                  .map((DocumentSnapshot e) {
                    Map<String, dynamic> data =
                        e.data()! as Map<String, dynamic>;
                    return Consumer<CreatePostViewModel>(
                        builder: (context, value, child) {
                      return Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.terrain,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                data['latitude'],
                                data['longitude'],
                              ),
                              zoom: 14.4746,
                            ),
                            polylines: {
                              Polyline(
                                  polylineId: const PolylineId('Route'),
                                  points: [
                                    /// posisi
                                    LatLng(value.posLatitude!,
                                        value.posLongitude!),

                                    ///tujuan
                                    LatLng(data['latitude'], data['longitude']),
                                  ],
                                  color: MyColor.deepAqua,
                                  width: 5),
                            },
                            markers: {
                              Marker(
                                markerId: const MarkerId('Target Lokasi'),
                                position:
                                    LatLng(data['latitude'], data['longitude']),
                              ),
                              Marker(
                                markerId: const MarkerId('Posisi Saya'),
                                position: LatLng(
                                  value.posLatitude!,
                                  value.posLongitude!,
                                ),
                              ),
                            },
                            onMapCreated: (GoogleMapController controller) {
                              value.googleController.complete(controller);
                            },
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(40),
                              splashColor: MyColor.marble,
                              onTap: () {
                                value.posisisUser(
                                    value.posLatitude, value.posLongitude);
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(bottom: 30),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyColor.deepAqua),
                                child: Icon(
                                  FontAwesomeIcons.streetView,
                                  color: MyColor.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
                  })
                  .toList()
                  .cast(),
            );
          } else {
            Container();
          }
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sorry an error occurred',
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  FontAwesomeIcons.faceSadCry,
                  color: MyColor.deepAqua,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
