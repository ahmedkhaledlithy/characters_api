part of 'quotes_cubit.dart';

abstract class QuotesState extends Equatable {
  const QuotesState();
}

class QuotesInitial extends QuotesState {
  @override
  List<Object> get props => [];
}

class QuotesLoaded extends QuotesState {

  final List<CharacterQuote> quotes;
  const QuotesLoaded({required this.quotes});

  @override
  List<Object> get props => [quotes];
}
