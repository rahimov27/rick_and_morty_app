import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/data/models/episode_model.dart';

class GetEpisodeRepo {
  final Dio dio;

  GetEpisodeRepo({required this.dio});

  Future<EpisodeModel> getEpisode() async {
    try {
      final Response response = await dio.get("/episode");
      print("Api response ${response.data}");
      return EpisodeModel.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
