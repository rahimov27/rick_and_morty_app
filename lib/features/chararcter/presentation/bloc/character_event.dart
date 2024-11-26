part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCharactersEvent extends CharacterEvent {}


class SearchCharacterByNameEvent extends CharacterEvent {
  final String name;

  SearchCharacterByNameEvent({required this.name});

  @override
  List<Object?> get props => [name];
}