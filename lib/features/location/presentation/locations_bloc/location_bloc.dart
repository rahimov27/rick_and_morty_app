import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';
import 'package:rick_and_morty_app/features/location/data/datasources/get_location_repo.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({required this.repo}) : super(LocationInitial()) {
    on<GetLocationEvent>((event, emit) async {
      try {
        emit(LocationLoading());
        final model = await repo.getLocation();
        print("Fetched locations: ${model.results?.length}"); // Лог данных
        emit(LocationSucess(model: model));
      } catch (e) {
        print("BLoC Error: $e"); // Лог ошибки
        emit(LocationError(error: e.toString()));
      }
    });
  }

  final GetLocationRepo repo;
}
