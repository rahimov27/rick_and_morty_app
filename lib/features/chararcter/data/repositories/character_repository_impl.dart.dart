import 'package:dartz/dartz.dart'; // Import dartz for Either
import 'package:rick_and_morty_app/features/chararcter/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/features/chararcter/data/datasources/character_remote_datasource.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/shared/core/error/failure.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDatasourceImpl remoteDataSource;

  CharacterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacters() async {
    try {
      // Fetching the characters from the remote data source
      final characterModels = await remoteDataSource.getCharacters();

      // Convert the CharacterModels to CharacterEntities
      final characterEntities = characterModels
          .map((model) => CharacterEntity.fromModel(model))
          .toList();

      // Return a Right result (success)
      return Right(characterEntities);
    } catch (e) {
      // If an error occurs, return a Left result (failure)
      return Left(Failure(message: 'Error getting characters: $e'));
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> searchCharactersByName(
      String name) async {
    try {
      final characterModels =
          await remoteDataSource.searchCharactersByName(name);
      final characterEntities = characterModels
          .map((model) => CharacterEntity.fromModel(model))
          .toList();
      return Right(characterEntities);
    } catch (e) {
      return Left(Failure(message: 'Error searching characters: $e'));
    }
  }
}
