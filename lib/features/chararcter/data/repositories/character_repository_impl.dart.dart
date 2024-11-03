import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/chararcter/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final Dio dio;

  CharacterRepositoryImpl({required this.dio});

  @override
  Future<List<CharacterModel>> getCharacter() async {
    try {
      final response =
          await dio.get("https://rickandmortyapi.com/api/character");
      final List characterJson = response.data['results'];

      return characterJson
          .map((json) => CharacterModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to load get character data");
    }
  }
}
