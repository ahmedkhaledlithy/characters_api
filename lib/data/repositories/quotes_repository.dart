import 'package:characters_api/data/models/character_quote.dart';
import 'package:characters_api/data/services/characters_service.dart';

class QuotesRepository{

  final CharactersService charactersService;
  QuotesRepository(this.charactersService);


  Future<List<CharacterQuote>> fetchCharacterQuotes(String charName) async{
    final quotes=await charactersService.fetchCharacterQuotes(charName);
    return quotes.map((quote) => CharacterQuote.fromJson(quote)).toList();
  }
}