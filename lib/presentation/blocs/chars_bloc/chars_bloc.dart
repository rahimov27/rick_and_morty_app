import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/data/models/character_model.dart';
import 'package:rick_and_morty_app/data/repositories/get_chars_repo.dart';

part 'chars_event.dart';
part 'chars_state.dart';

class CharsBloc extends Bloc<CharsEvent, CharsState> {
  CharsBloc({required this.repo}) : super(CharsInitial()) {
    on<GetCharsList>(
      (event, emit) async {
        try {
          final model = await repo.getData();
          emit(
            CharsSuccess(model: model),
          );
        } catch (e) {
          emit(
            CharsError(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }

  final GetCharsRepo repo;
}
