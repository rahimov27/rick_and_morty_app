part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final List<LocationModel> location;
  const LocationSuccess({required this.location});
}

class LocationError extends LocationState {
  final String error;
  const LocationError({required this.error});
}
