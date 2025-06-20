import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../domain/entities/location_entity.dart';

class GoogleMapWidget extends StatelessWidget {
  final LocationEntity location;

  const GoogleMapWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final LatLng position = LatLng(location.latitude, location.longitude);

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: position,
        zoom: 16,
      ),
      markers: {
        Marker(
          markerId: const MarkerId('current_location'),
          position: position,
          infoWindow: InfoWindow(
            title: "Ubicación actual",
            snippet: location.address ?? "",
          ),
        ),
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomGesturesEnabled: true,
      scrollGesturesEnabled: true,
    );
  }
}
