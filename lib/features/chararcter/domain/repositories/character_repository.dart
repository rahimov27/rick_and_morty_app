import 'package:dartz/dartz.dart';  // Make sure to import the dartz package

// Assuming you have a Failure class that represents errors
import 'package:rick_and_morty_app/features/chararcter/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/shared/core/error/failure.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<CharacterEntity>>> getCharacters();
}