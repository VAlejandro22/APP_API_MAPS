import '../../domain/entities/location_entity.dart';
import '../../domain/repositories/location_repository.dart';
import '../datasources/location_datasource.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource dataSource;

  LocationRepositoryImpl(this.dataSource);

  @override
  Future<LocationEntity> getCurrentLocation() {
    return dataSource.getCurrentLocation();
  }
}
