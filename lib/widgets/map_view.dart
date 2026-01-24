import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  static const CameraPosition _lagos = CameraPosition(
    target: LatLng(6.5244, 3.3792), // Lagos, Nigeria
    zoom: 13,
  );

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  void _loadMarkers() {
    // Adding dummy markers for the opportunities
    setState(() {
      _markers.addAll([
        const Marker(
          markerId: MarkerId('opportunity_1'),
          position: LatLng(6.5300, 3.3700),
          infoWindow: InfoWindow(title: 'Food Bank'),
        ),
        const Marker(
          markerId: MarkerId('opportunity_2'),
          position: LatLng(6.5200, 3.3800),
          infoWindow: InfoWindow(title: 'Willow Creek'),
        ),
        const Marker(
          markerId: MarkerId('opportunity_3'),
          position: LatLng(6.5250, 3.3900),
          infoWindow: InfoWindow(title: 'Riverside Park'),
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _lagos,
      markers: _markers,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
    );
  }
}
