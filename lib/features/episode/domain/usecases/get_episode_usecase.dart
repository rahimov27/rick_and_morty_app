import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/features/episode/domain/entities/episode_entity.dart';
import 'package:rick_and_morty_app/features/episode/domain/repositories/episode_repostory.dart';
import 'package:rick_and_morty_app/shared/core/error/failure.dart';

class GetEpisodeUsecase {
  final EpisodeRepository repository;
  GetEpisodeUsecase({required this.repository});

  Future<Either<Failure, List<EpisodeEntity>>> call() async {
    return await repository.getEpisode();
  }
}
