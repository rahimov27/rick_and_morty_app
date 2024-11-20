import 'package:rick_and_morty_app/features/chararcter/data/models/character_model.dart';

class CharacterEntity {
  final int id;
  final String name;
  final String status;
  final String image;
  final String species;
  final String type;
  final String gender;
  final String created;
  final Origin origin;
  final Location location;

  CharacterEntity(
      {required this.id,
      required this.image,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.created,
      required this.location,
      required this.origin});

  // Mapping from CharacterModel to CharacterEntity
  factory CharacterEntity.fromModel(CharacterModel model) {
    return CharacterEntity(
        id: model.id, // Assuming 'id' exists in CharacterModel
        name: model.name,
        status: model.status,
        species: model.species,
        type: model.type,
        image: model.image,
        gender: model.gender,
        created: model.created,
        origin: model.origin,
        location: model.location);
  }
}
