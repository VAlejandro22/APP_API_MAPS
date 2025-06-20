import '../../domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required double latitude,
    required double longitude,
    String? address,
  }) : super(latitude: latitude, longitude: longitude, address: address);

  factory LocationModel.fromCoordinates({
    required double latitude,
    required double longitude,
    String? address,
  }) {
    return LocationModel(
      latitude: latitude,
      longitude: longitude,
      address: address,
    );
  }
}
