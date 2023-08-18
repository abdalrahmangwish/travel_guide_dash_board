import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.gesture, required this.onTap});

  @override
  MapScreenState createState() => MapScreenState();
  final bool gesture;
  final CameraPositionCallback onTap;
}

class MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  final CameraPosition _initialCameraPosition =
      const CameraPosition(target: LatLng(33.510414, 36.278336), zoom: 12);
  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            zoomGesturesEnabled: widget.gesture,
            scrollGesturesEnabled: widget.gesture,
            tiltGesturesEnabled: false,
            rotateGesturesEnabled: false,
            zoomControlsEnabled: false,
            onCameraMove: widget.onTap,
            onMapCreated: onMapCreated,
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
              Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
              ),
            },
            mapToolbarEnabled: false,
            myLocationButtonEnabled: true,
            initialCameraPosition: _initialCameraPosition,
          ),
          const Icon(Icons.pin_drop_rounded, color: Colors.red)
        ],
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
