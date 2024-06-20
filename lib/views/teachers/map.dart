import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/utilities/colors.dart';

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
      appBar: AppBar(
        title: const ProText(
          text: "Teachers Location",
          fontSize: 18,
          color: ProjectColors.primary,
        ),
      ),
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
