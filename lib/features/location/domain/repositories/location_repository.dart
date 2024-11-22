import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/features/location/domain/entities/location_entity.dart';
import 'package:rick_and_morty_app/shared/core/error/failure.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<LocationEntity>>> getLocation();
}
