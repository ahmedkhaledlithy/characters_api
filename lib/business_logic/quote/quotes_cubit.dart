import 'package:bloc/bloc.dart';
import 'package:characters_api/data/models/character_quote.dart';
import 'package:characters_api/data/repositories/quotes_repository.dart';
import 'package:equatable/equatable.dart';
part 'quotes_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  final QuotesRepository quotesRepository;

  QuotesCubit({required this.quotesRepository}) : super(QuotesInitial());

   void fetchQuotes(String charName) {
    quotesRepository.fetchCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes: quotes));
    });

  }
}
