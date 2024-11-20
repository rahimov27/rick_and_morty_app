import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/features/location/domain/entities/location_entity.dart';
import 'package:rick_and_morty_app/features/location/domain/usecases/get_location_usecase.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationUsecase getLocationUsecase;

  LocationBloc(this.getLocationUsecase) : super(LocationInitial()) {
    on<LoadLocationsEvent>((event, emit) async {
      emit(LocationLoading());
      final result = await getLocationUsecase();

      result.fold(
        (failure) {
          emit(LocationError(error: failure.message));
        },
        (locations) {
          emit(LocationLoaded(
              locations: locations)); // Ensure correct data is passed
        },
      );
    });
  }
}
