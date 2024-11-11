import 'package:rick_and_morty_app/features/episode/data/models/episode_model.dart';

abstract class EpisodeRepository {
  Future<List<EpisodeModel>> getEpisode();
}
