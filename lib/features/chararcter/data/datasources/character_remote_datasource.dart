import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/chararcter/data/models/character_model.dart';

abstract class CharacterRemoteDatasource {
  Future<List<CharacterModel>> getCharacters();
}

class CharacterRemoteDatasourceImpl implements CharacterRemoteDatasource {
  final Dio dio;

  CharacterRemoteDatasourceImpl(this.dio);

  @override
  Future<List<CharacterModel>> getCharacters() async {
    try {
      final response =
          await dio.get("https://rickandmortyapi.com/api/character");
      if (response.statusCode == 200) {
        List<CharacterModel> characters = (response.data['results'] as List)
            .map((e) => CharacterModel.fromJson(e))
            .toList();
        return characters;
      } else {
        // Throwing custom exception for non-200 status codes
        throw Exception(
            'Failed to fetch characters. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Throwing a custom exception for errors
      throw Exception('Error occurred while fetching characters: $e');
    }
  }
}
