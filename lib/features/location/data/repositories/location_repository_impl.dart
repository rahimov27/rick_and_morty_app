import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/features/location/data/datasources/location_remote_datasource.dart';
import 'package:rick_and_morty_app/features/location/domain/entities/location_entity.dart';
import 'package:rick_and_morty_app/features/location/domain/repositories/location_repository.dart';
import 'package:rick_and_morty_app/shared/core/error/failure.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<LocationEntity>>> getLocation() async {
    try {
      final locationModels = await remoteDataSource.getLocation();

      final locationEntities =
          locationModels.map((model) => LocationEntity.fromModel(model)).toList();

      return Right(locationEntities);
    } catch (e) {
      return Left(Failure(message: "error getting locations $e"));
    }
  }
}
