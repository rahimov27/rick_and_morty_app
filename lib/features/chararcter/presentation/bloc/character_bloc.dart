import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/usecases/get_character_usecase.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharactersUseCase getCharactersUseCase;

  CharacterBloc(this.getCharactersUseCase) : super(CharacterInitial()) {
    on<LoadCharactersEvent>((event, emit) async {
      emit(CharacterLoading());
      final result = await getCharactersUseCase();

      result.fold(
        (failure) {
          // Убедитесь, что failure.message существует
          emit(CharacterError(message: failure.message));
        },
        (characters) {
          // Проверяем, что characters соответствует List<CharacterEntity>
          emit(CharacterLoaded(characters: characters));
        },
      );
    });
  }
}
