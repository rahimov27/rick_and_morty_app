import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/shared/core/error/failure.dart';

class GetCharactersUseCase {
  final CharacterRepository repository;

  GetCharactersUseCase({required this.repository});

  Future<Either<Failure, List<CharacterEntity>>> call() async {
    // repository.getCharacters() должен возвращать List<CharacterEntity>
    return await repository.getCharacters();
  }
}

class SearchCharactersByNameUseCase {
  final CharacterRepository repository;

  SearchCharactersByNameUseCase({required this.repository});

  Future<Either<Failure, List<CharacterEntity>>> call(String name) async {
    return await repository.searchCharactersByName(name);
  }
}

