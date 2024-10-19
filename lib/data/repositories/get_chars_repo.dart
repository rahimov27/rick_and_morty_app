import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/data/models/character_model.dart';

class GetCharsRepo {
  final Dio dio;

  GetCharsRepo({required this.dio});

  Future<CharacterModel> getData() async {
    final Response response = await dio.get("character/");
    return CharacterModel.fromJson(response.data); 
  }
}
