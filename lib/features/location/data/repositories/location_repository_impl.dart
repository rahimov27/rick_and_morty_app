import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';
import 'package:rick_and_morty_app/features/location/domain/repositories/location_repository.dart';
import 'package:rick_and_morty_app/features/location/data/datasources/location_remote_data_source.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<LocationModel>> getLocation() async {
    try {
      return await remoteDataSource.getLocation();
    } catch (e) {
      throw Exception("Ошибка при загрузке данных о локациях");
    }
  }
}
