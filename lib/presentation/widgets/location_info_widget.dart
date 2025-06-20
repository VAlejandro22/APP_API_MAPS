import 'package:flutter/material.dart';
import '../../domain/entities/location_entity.dart';

class LocationInfoWidget extends StatelessWidget {
  final LocationEntity location;

  const LocationInfoWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Latitud: ${location.latitude}'),
          Text('Longitud: ${location.longitude}'),
          Text('Dirección: ${location.address ?? "No disponible"}'),
        ],
      ),
    );
  }
}
