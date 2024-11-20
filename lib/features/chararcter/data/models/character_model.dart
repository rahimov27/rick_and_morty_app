// import 'package:rick_and_morty_app/features/chararcter/domain/entities/character_entity.dart';

// class CharacterModel {
//   final int? id;
//   final String? name;
//   final String? status;
//   final String? species;
//   final String? type;
//   final String? gender;
//   final OriginCharacter? origin;
//   final String? image;
//   final List<String> episode;
//   final String? url;
//   final String? created;
//   final CharacterLocation? location;

//   CharacterModel({
//     required this.id,
//     this.name,
//     this.status,
//     this.species,
//     this.type,
//     this.gender,
//     this.origin,
//     this.image,
//     required this.episode,
//     this.url,
//     this.created,
//     this.location,
//   });

//   factory CharacterModel.fromJson(Map<String, dynamic> json) {
//     return CharacterModel(
//       id: json['id'] as int?,
//       name: json['name'] as String?,
//       status: json['status'] as String?,
//       species: json['species'] as String?,
//       type: json['type'] as String?,
//       gender: json['gender'] as String?,
//       origin: json['origin'] != null
//           ? OriginCharacter.fromJson(json['origin'] as Map<String, dynamic>)
//           : null,
//       image: json['image'] as String?,
//       episode: List<String>.from(json['episode'] ?? []),
//       url: json['url'] as String?,
//       created: json['created'] as String?,
//       location: json['location'] != null
//           ? CharacterLocation.fromJson(json['location'] as Map<String, dynamic>)
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'status': status,
//       'species': species,
//       'type': type,
//       'gender': gender,
//       'origin': origin?.toJson(),
//       'image': image,
//       'episode': episode,
//       'url': url,
//       'created': created,
//       'location': location?.toJson(),
//     };
//   }

//   // Преобразование модели в сущность
//   CharacterEntity toEntity() {
//     return CharacterEntity(
//       id: id ?? 0,
//       name: name ?? '',
//       status: status ?? '',
//       species: species ?? '',
//       type: type ?? '',
//       gender: gender ?? '',
//       created: created ?? '',
//     );
//   }
// }

// class OriginCharacter {
//   final String? name;
//   final String? url;

//   OriginCharacter({this.name, this.url});

//   factory OriginCharacter.fromJson(Map<String, dynamic> json) {
//     return OriginCharacter(
//       name: json['name'] as String?,
//       url: json['url'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'url': url,
//     };
//   }
// }

// class CharacterLocation {
//   final String? name;
//   final String? url;

//   CharacterLocation({this.name, this.url});

//   factory CharacterLocation.fromJson(Map<String, dynamic> json) {
//     return CharacterLocation(
//       name: json['name'] as String?,
//       url: json['url'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'url': url,
//     };
//   }
// }

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
