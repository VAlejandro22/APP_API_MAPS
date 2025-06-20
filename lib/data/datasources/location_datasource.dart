import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../models/location_model.dart';

abstract class LocationDataSource {
  Future<LocationModel> getCurrentLocation();
}

class LocationDataSourceImpl implements LocationDataSource {
  @override
  Future<LocationModel> getCurrentLocation() async {
    // Verificamos permisos
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('La ubicación está desactivada.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Permiso de ubicación denegado.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Permiso de ubicación denegado permanentemente.');
    }

    // Obtener coordenadas
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Obtener dirección
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    String? address;
    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      address = '${place.street}, ${place.locality}, ${place.country}';
    }

    return LocationModel.fromCoordinates(
      latitude: position.latitude,
      longitude: position.longitude,
      address: address,
    );
  }
}
