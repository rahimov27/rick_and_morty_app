part of 'episode_cubit.dart';

abstract class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object> get props => [];
}

class EpisodeInitial extends EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodeLoaded extends EpisodeState {
  final List<EpisodeEntity> episodes;
  const EpisodeLoaded(this.episodes);
}

class EpisodeError extends EpisodeState {
  final String error;
  const EpisodeError(this.error);
}
