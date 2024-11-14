import 'package:rick_and_morty_app/features/location/data/datasources/location_remote_datasource.dart';
import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';
import 'package:rick_and_morty_app/features/location/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDatasource remoteDataSource;

  LocationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<LocationModel>> getLocation() async {
    final locations = await remoteDataSource.getLocation();
    return locations;
  }
}
