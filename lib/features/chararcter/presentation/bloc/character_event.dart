part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCharactersEvent extends CharacterEvent {}