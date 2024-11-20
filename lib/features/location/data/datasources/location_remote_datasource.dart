import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';

abstract class LocationRemoteDataSource {
  Future<List<LocationModel>> getLocation();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final Dio dio;

  LocationRemoteDataSourceImpl(this.dio);

  @override
  Future<List<LocationModel>> getLocation() async {
    final response = await dio.get("https://rickandmortyapi.com/api/location");

    if (response.statusCode == 200) {
      final data =
          response.data['results'] as List; // Response is a list of locations
      // Correctly map the dynamic list to a list of LocationModel
      return data.map((json) => LocationModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load locations");
    }
  }
}
