part of 'episode_bloc.dart';

@immutable
sealed class EpisodeState {}

final class EpisodeInitial extends EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodeSuccess extends EpisodeState {
  final EpisodeModel model;
  EpisodeSuccess({required this.model});
}

class EpisodeError extends EpisodeState {
  final String error;
  EpisodeError({required this.error});
}
