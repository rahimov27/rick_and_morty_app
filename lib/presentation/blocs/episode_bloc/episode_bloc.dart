import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/data/models/episode_model.dart';
import 'package:rick_and_morty_app/data/repositories/get_episode_repo.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  EpisodeBloc({required this.repo}) : super(EpisodeInitial()) {
    on<GetEpisodeEvent>((event, emit) async {
      try {
        final model = await repo.getEpisode();
        emit(EpisodeSuccess(model: model));
      } catch (e) {
        emit(
          EpisodeError(
            error: e.toString(),
          ),
        );
      }
    });
  }
  final GetEpisodeRepo repo;
}
