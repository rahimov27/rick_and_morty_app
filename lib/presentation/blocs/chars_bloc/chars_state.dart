part of 'chars_bloc.dart';

@immutable
sealed class CharsState {}

final class CharsInitial extends CharsState {}

final class CharsLoading extends CharsState {}

final class CharsSuccess extends CharsState {
  final CharacterModel model;
  CharsSuccess({required this.model});
}

final class CharsError extends CharsState {
  final String errorText;
  CharsError({required this.errorText});
}
