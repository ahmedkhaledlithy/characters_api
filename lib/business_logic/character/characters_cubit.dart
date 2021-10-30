import 'package:bloc/bloc.dart';
import 'package:characters_api/data/models/character.dart';
import 'package:characters_api/data/repositories/characters_repository.dart';
import 'package:equatable/equatable.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

  final CharactersRepository charactersRepository;
   List<Character> characters=[];
  CharactersCubit({required this.charactersRepository}) : super(CharactersInitial());

  List<Character> fetchAllCharacters()  {
    emit(CharactersLoading());
    try {
         charactersRepository.fetchAllCharacters().then((characters){
           this.characters=characters;
           emit(CharactersLoaded(characters: characters));
         });

    } catch(e) {
      emit(CharactersError(e.toString()));
    }
   return characters;
  }



}
