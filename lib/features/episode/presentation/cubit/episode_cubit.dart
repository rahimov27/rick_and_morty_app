import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/features/episode/data/models/episode_model.dart';
import 'package:rick_and_morty_app/features/episode/domain/episode_repostory_impl.dart';

part 'episode_state.dart';

class EpisodeCubit extends Cubit<EpisodeState> {
  final EpisodeRepository repositories;
  EpisodeCubit(this.repositories) : super(EpisodeInitial());

  Future<void> getEpisode() async {
    try {
      emit(EpisodeLoading());
      final episodes = await repositories.getEpisode();
      emit(EpisodeLoaded(episodes));
    } catch (e) {
      emit(EpisodeError("$e"));
    }
  }
}
