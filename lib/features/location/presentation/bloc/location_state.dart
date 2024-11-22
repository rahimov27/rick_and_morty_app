part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<LocationEntity> locations;
  const LocationLoaded({required this.locations});

  @override
  List<Object> get props => [locations];
}

class LocationError extends LocationState {
  final String error;
  const LocationError({required this.error});

  @override
  List<Object> get props => [error];
}
