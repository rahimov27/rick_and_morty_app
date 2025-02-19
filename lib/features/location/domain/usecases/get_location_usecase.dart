import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/features/location/domain/entities/location_entity.dart';
import 'package:rick_and_morty_app/features/location/domain/repositories/location_repository.dart';
import 'package:rick_and_morty_app/shared/core/error/failure.dart';

class GetLocationUsecase {
  final LocationRepository locationRepository;

  GetLocationUsecase({required this.locationRepository});

  Future<Either<Failure, List<LocationEntity>>> call() async {
    return await locationRepository.getLocation();
  }
}
