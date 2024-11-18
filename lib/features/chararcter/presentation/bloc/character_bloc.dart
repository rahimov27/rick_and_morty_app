import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/features/chararcter/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/repositories/character_repository.dart';

part 'character_event.dart';
part 'character_state.dart';

// lib/features/character/presentation/bloc/character_bloc.dart

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository repository;

  CharacterBloc({required this.repository}) : super(CharacterInitial()) {
    on<GetCharacterEvent>((event, emit) async {
      emit(CharacterLoading());
      try {
        final characters = await repository.getCharacters();
        emit(CharacterSuccess(characters: characters));
      } catch (e) {
        emit(CharacterError(error: "Error: $e"));
      }
    });
  }
}
