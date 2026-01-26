import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/pages/instruction_page.dart';

class DirectionsPage extends StatefulWidget {
  const DirectionsPage({super.key});

  @override
  State<DirectionsPage> createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {
  final Completer<GoogleMapController> _controller = Completer();
  
  // Dummy Default Location (e.g., San Francisco or generic city center)
  // Replacing with a generic "Start" point for demo
  static const LatLng _startLocation = LatLng(37.7749, -122.4194);
  static const LatLng _destinationLocation = LatLng(37.7849, -122.4094); // Roughly 1-2km away

  // Markers and Polylines
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  
  // State
  String _statusText = "Verifying your location";
  bool _isVerifying = true;

  @override
  void initState() {
    super.initState();
    _setupMapElements();
    _initLocationTracking();
    
    // Simulate verification (3s) -> almost there. 
    // Then Simulate arrival (another 3s = 6s total) -> navigate.
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isVerifying = false;
          _statusText = "Almost there!";
        });
        
        // Schedule arrival
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
             Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const InstructionPage()),
            );
          }
        });
      }
    });
  }

  void _setupMapElements() {
    // Destination Marker (Pin)
    final destinationMarker = Marker(
      markerId: const MarkerId('destination'),
      position: _destinationLocation,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );

    // Route Line (Dashed effect is hard with standard Polyline without plugins/custom implementations, 
    // using solid line with specific color from design e.g., Beige/Orange)
    final routePolyline = Polyline(
      polylineId: const PolylineId('route'),
      points: [_startLocation, _destinationLocation],
      color: DSColors.urgency.withValues(alpha: 0.6), // Orange-ish
      width: 5,
      patterns: [PatternItem.dash(20), PatternItem.gap(10)], // Try patterns if supported
    );

    setState(() {
      _markers = {destinationMarker};
      _polylines = {routePolyline};
    });
  }

  Future<void> _initLocationTracking() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check Service
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are disabled.
      return;
    }

    // Check Permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return;
    }

    // Get current position stream
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      _updateCurrentLocation(position);
    });
  }

  void _updateCurrentLocation(Position position) async {
    final LatLng currentLatLng = LatLng(position.latitude, position.longitude);
    
    // Update Marker
    final myLocationMarker = Marker(
      markerId: const MarkerId('currentLocation'),
      position: currentLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue), // Or custom circle if possible
      // In a real app we'd load a custom asset for the blue user dot
    );

    setState(() {
      _markers.removeWhere((m) => m.markerId.value == 'currentLocation');
      _markers.add(myLocationMarker);
    });

    // Move Camera
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(currentLatLng));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            mapType: MapType.normal, // Use normal or styled map if JSON available
            initialCameraPosition: const CameraPosition(
              target: _startLocation,
              zoom: 14.4746,
            ),
            markers: _markers,
            polylines: _polylines,
            myLocationEnabled: true, // Native blue dot can also be used
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          
          // Back Button (Top Left)
          Positioned(
            top: MediaQuery.of(context).padding.top + Spacers.sm,
            left: Spacers.md,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: DSColors.primaryText),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // Bottom Sheet / Card
          Positioned(
            bottom: Spacers.lg,
            left: Spacers.lg,
            right: Spacers.lg,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: Spacers.lg, horizontal: Spacers.md),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Spacers.xl),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Status Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_isVerifying)
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(DSColors.ctaTeal),
                              ),
                            )
                          else
                            const Icon(Icons.check_circle_outline, color: DSColors.ctaTeal), // Replaced generic circle with icon

                          const SizedBox(width: Spacers.sm),
                          Text(
                            _statusText,
                            style: Styles.bodyRegular.copyWith(
                              fontWeight: FontWeight.bold,
                              color: DSColors.secondaryText,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: Spacers.md),

                      // Main Status Text
                      Text(
                        _isVerifying ? "Locating..." : "Almost there!",
                         style: Styles.headingGeneral.copyWith(
                          color: DSColors.primaryText,
                        ),
                      ),
                      
                      const SizedBox(height: Spacers.sm),
                      
                      // Duration / Distance
                      Text(
                        "2.5km away (36 min walk)",
                        style: Styles.bodyRegular.copyWith(
                          color: DSColors.secondaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: Spacers.lg),
                
                // Footer Link
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "I'm stuck, need help",
                    style: Styles.bodyRegular.copyWith(
                      color: DSColors.purpleMain,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: Spacers.md), // Bottom padding
              ],
            ),
          ),
        ],
      ),
    );
  }
}
