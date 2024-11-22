import 'package:rick_and_morty_app/features/episode/data/models/episode_model.dart';

class EpisodeEntity {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final String created;

  EpisodeEntity(
      {required this.id,
      required this.name,
      required this.airDate,
      required this.episode,
      required this.characters,
      required this.url,
      required this.created});

  factory EpisodeEntity.fromModel(EpisodeModel model) {
    return EpisodeEntity(
        id: model.id,
        name: model.name,
        airDate: model.airDate,
        episode: model.episode,
        characters: model.characters,
        url: model.url,
        created: model.created);
  }
}
