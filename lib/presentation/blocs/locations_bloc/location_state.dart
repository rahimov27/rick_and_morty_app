part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSucess extends LocationState {
  final LocationModel model;
  LocationSucess({required this.model});
}

class LocationError extends LocationState {
  final String error;
  LocationError({required this.error});
}
