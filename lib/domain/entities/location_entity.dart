class LocationEntity {
  final double latitude;
  final double longitude;
  final String? address;

  const LocationEntity({
    required this.latitude,
    required this.longitude,
    this.address,
  });
}
