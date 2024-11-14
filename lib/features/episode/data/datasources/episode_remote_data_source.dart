import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/episode/data/models/episode_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<EpisodeModel>> getEpisode();
}

class EpisodeRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final Dio dio;

  EpisodeRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<EpisodeModel>> getEpisode() async {
    final response = await dio.get("https://rickandmortyapi.com/api/episode");
    if (response.statusCode == 200) {
      final List episodeJson = response.data['results'];
      return episodeJson.map((json) => EpisodeModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
