part of 'character_bloc.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

final class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterSuccess extends CharacterState {
  final List<CharacterModel> characters;
  const CharacterSuccess({required this.characters});
}

class CharacterError extends CharacterState {
  final String error;
  const CharacterError({required this.error});
}
