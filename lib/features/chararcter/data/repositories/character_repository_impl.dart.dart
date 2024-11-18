import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/chararcter/data/datasources/character_remote_datasource.dart';
import 'package:rick_and_morty_app/features/chararcter/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDatasource remoteDataSource;

  // Pass Dio to remoteDataSource through constructor
  CharacterRepositoryImpl({required Dio dio})
      : remoteDataSource = CharacterRemoteDatasourceImpl(dio);

  @override
  Future<List<CharacterModel>> getCharacters() {
    return remoteDataSource.getCharacters();
  }
}
