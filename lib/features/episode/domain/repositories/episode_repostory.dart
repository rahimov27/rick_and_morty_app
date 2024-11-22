import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/features/episode/domain/entities/episode_entity.dart';
import 'package:rick_and_morty_app/shared/core/error/failure.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, List<EpisodeEntity>>> getEpisode();
}
