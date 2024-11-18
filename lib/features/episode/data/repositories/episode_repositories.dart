
import 'package:rick_and_morty_app/features/episode/data/datasources/episode_remote_data_source.dart';
import 'package:rick_and_morty_app/features/episode/data/models/episode_model.dart';
import 'package:rick_and_morty_app/features/episode/domain/repositories/episode_repostory_impl.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeRemoteDataSourceImpl remoteDataSource;
  EpisodeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<EpisodeModel>> getEpisode() async {
    try {
      final episodeModels = await remoteDataSource.getEpisode();
      return episodeModels;
    } catch (e) {
      throw Exception('Error getting characters: $e');
    }
  }
  
  
}
