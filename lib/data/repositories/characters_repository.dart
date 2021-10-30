import 'package:characters_api/data/models/character.dart';
import 'package:characters_api/data/services/characters_service.dart';

class CharactersRepository{

  final CharactersService charactersService;
  CharactersRepository(this.charactersService);

  Future<List<Character>> fetchAllCharacters() async{
    final characters=await charactersService.fetchAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }

}