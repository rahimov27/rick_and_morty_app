import 'package:rick_and_morty_app/features/chararcter/data/models/character_model.dart';

abstract class CharacterRepository {
  Future<List<CharacterModel>> getCharacters();
}
