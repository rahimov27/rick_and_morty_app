import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';

class LocationEntity {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime created;

  LocationEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory LocationEntity.fromModel(LocationModel model) {
    return LocationEntity(
      id: model.id,
      name: model.name,
      type: model.type,
      dimension: model.dimension,
      residents: model.residents,
      url: model.url,
      created: model.created,
    );
  }
}
