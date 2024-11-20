import 'package:rick_and_morty_app/features/chararcter/domain/entities/character_entity.dart';

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String created;
  final Origin origin;
  final Location location;
  final String image;

  CharacterModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.image,
      required this.created,
      required this.location,
      required this.origin});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      created: json['created'],
      image: json['image'],
      origin: json['origin'] != null
          ? Origin.fromJson(json['origin'])
          : Origin(name: "", url: ""),
      location: json['location'] != null
          ? Location.fromJson(json['location'])
          : Location(name: "", url: ""),
    );
  }

  CharacterEntity toEntity() {
    return CharacterEntity(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        created: created,
        origin: origin,
        image: image,
        location: location);
  }
}

class Origin {
  final String? name;
  final String? url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}

class Location {
  final String? name;
  final String? url;

  Location({this.name, this.url});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
