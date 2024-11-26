import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/usecases/get_character_usecase.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharactersUseCase getCharactersUseCase;
  final SearchCharactersByNameUseCase searchCharactersByNameUseCase;

  CharacterBloc({
    required this.getCharactersUseCase,
    required this.searchCharactersByNameUseCase,
  }) : super(CharacterInitial()) {
    on<LoadCharactersEvent>(_onLoadCharacters);
    on<SearchCharacterByNameEvent>(_onSearchCharacterByName);
  }

  Future<void> _onLoadCharacters(
      LoadCharactersEvent event, Emitter<CharacterState> emit) async {
    emit(CharacterLoading());
    final result = await getCharactersUseCase();
    result.fold(
      (failure) => emit(CharacterError(message: failure.message)),
      (characters) => emit(CharacterLoaded(characters: characters)),
    );
  }

  Future<void> _onSearchCharacterByName(
      SearchCharacterByNameEvent event, Emitter<CharacterState> emit) async {
    emit(CharacterLoading());
    final result = await searchCharactersByNameUseCase(event.name);
    result.fold(
      (failure) => emit(CharacterError(message: failure.message)),
      (characters) => emit(CharacterLoaded(characters: characters)),
    );
  }
}
