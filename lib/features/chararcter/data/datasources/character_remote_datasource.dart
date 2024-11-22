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
    final response = await dio.get("https://rickandmortyapi.com/api/character");
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to fetch characters.');
    }
  }
}