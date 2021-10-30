part of 'characters_cubit.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();
}

class CharactersInitial extends CharactersState {
  @override
  List<Object> get props => [];
}

class CharactersLoading extends CharactersState {
  @override
  List<Object> get props => [];
}

class CharactersError extends CharactersState {
  final String message;
  const CharactersError(this.message);

  @override
  List<Object> get props => [message];
}

class CharactersLoaded extends CharactersState {

  final List<Character> characters;
  const CharactersLoaded({required this.characters});

  @override
  List<Object> get props => [characters];
}





