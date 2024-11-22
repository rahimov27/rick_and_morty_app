import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/features/episode/domain/entities/episode_entity.dart';
import 'package:rick_and_morty_app/features/episode/domain/repositories/episode_repostory.dart';

part 'episode_state.dart';

class EpisodeCubit extends Cubit<EpisodeState> {
  final EpisodeRepository repositories;
  EpisodeCubit(this.repositories) : super(EpisodeInitial());

  Future<void> getEpisode() async {
    try {
      emit(EpisodeLoading());
      final eitherResult = await repositories.getEpisode();

      eitherResult.fold((failure) => emit(EpisodeError(failure.toString())),
          (episodes) => emit(EpisodeLoaded(episodes)));
    } catch (e) {
      emit(EpisodeError("$e"));
    }
  }
}
