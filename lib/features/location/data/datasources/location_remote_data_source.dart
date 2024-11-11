import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';

abstract class LocationRemoteDataSource {
  Future<List<LocationModel>> getLocation();
}
