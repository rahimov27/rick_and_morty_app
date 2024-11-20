import 'package:rick_and_morty_app/features/location/domain/entities/location_entity.dart';

class LocationModel {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime created;

  LocationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
      // Ensure that residents is a List<String>
      residents: List<String>.from(json['residents'] ?? []),
      url: json['url'],
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "type": type,
      "dimension": dimension,
      "residents": residents,
      "url": url,
      "created": created.toIso8601String(),
    };
  }

  LocationEntity toEntity() {
    return LocationEntity(
      id: id,
      name: name,
      type: type,
      dimension: dimension,
      residents: residents,
      url: url,
      created: created,
    );
  }
}
