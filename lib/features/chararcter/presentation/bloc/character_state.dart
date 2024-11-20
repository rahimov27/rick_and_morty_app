part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<CharacterEntity> characters;

  CharacterLoaded({required this.characters});

  @override
  List<Object?> get props => [characters];
}

class CharacterError extends CharacterState {
  final String message;

  CharacterError({required this.message});

  @override
  List<Object?> get props => [message];
}