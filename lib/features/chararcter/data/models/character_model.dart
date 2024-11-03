class CharacterModel {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final OriginCharacter? origin;
  final String? image;
  final List<String> episode;
  final String? url;
  final String? created;

  CharacterModel({
    required this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.image,
    required this.episode,
    this.url,
    this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: json['origin'] != null
          ? OriginCharacter.fromJson(json['origin'])
          : null,
      image: json['image'],
      url: json['url'],
      created: json['created'],
      episode: List<String>.from(json['episode'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin?.toJson(),
      'image': image,
      'url': url,
      'created': created,
      'episode': episode,
    };
  }
}

class OriginCharacter {
  final String? name;
  final String? url;

  OriginCharacter({this.name, this.url});

  factory OriginCharacter.fromJson(Map<String, dynamic> json) {
    return OriginCharacter(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}

class CharacterLocation {
  final String? name;
  final String? url;

  CharacterLocation({this.name, this.url});

  factory CharacterLocation.fromJson(Map<String, dynamic> json) {
    return CharacterLocation(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
