import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TeachersLocationMap extends StatefulWidget {
  final double lat;
  final double long;
  const TeachersLocationMap({super.key, required this.lat, required this.long});

  @override
  State<TeachersLocationMap> createState() => TeachersLocationMapState();
}

class TeachersLocationMapState extends State<TeachersLocationMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: <Marker>{
          Marker(
            markerId: const MarkerId("teachers_location"),
            position: LatLng(widget.lat, widget.long),
          )
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.long),
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
