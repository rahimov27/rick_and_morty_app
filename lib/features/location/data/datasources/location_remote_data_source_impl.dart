import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/location/data/datasources/location_remote_data_source.dart';
import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final Dio dio;

  LocationRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<LocationModel>> getLocation() async {
    try {
      final response =
          await dio.get("https://rickandmortyapi.com/api/location");
      final List locationJson = response.data['results'];
      return locationJson.map((json) => LocationModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Error with get data from location api");
    }
  }
}
