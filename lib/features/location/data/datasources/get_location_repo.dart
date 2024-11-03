import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';

class GetLocationRepo {
  final Dio dio;

  GetLocationRepo({required this.dio});

  Future<LocationModel> getLocation() async {
    try {
      final Response response = await dio.get("/location");
      print("API Response: ${response.data}"); // Лог данных API
      return LocationModel.fromJson(response.data);
    } catch (e) {
      print("Error in API call: $e");
      rethrow;
    }
  }
}
