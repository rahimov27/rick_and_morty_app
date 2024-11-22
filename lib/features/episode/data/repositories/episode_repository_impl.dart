import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/features/episode/data/datasources/episode_remote_data_source.dart';
import 'package:rick_and_morty_app/features/episode/domain/entities/episode_entity.dart';
import 'package:rick_and_morty_app/features/episode/domain/repositories/episode_repostory.dart';
import 'package:rick_and_morty_app/shared/core/error/failure.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeRemoteDataSourceImpl remoteDataSource;

  EpisodeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getEpisode() async {
    try {
      final episodeModels = await remoteDataSource.getEpisode();

      final episodeEntities =
          episodeModels.map((model) => EpisodeEntity.fromModel(model)).toList();

      return Right(episodeEntities);
    } catch (e) {
      throw Exception('Error getting characters: $e');
    }
  }
}
