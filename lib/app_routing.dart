import 'package:characters_api/business_logic/character/characters_cubit.dart';
import 'package:characters_api/business_logic/quote/quotes_cubit.dart';
import 'package:characters_api/data/models/character.dart';
import 'package:characters_api/data/repositories/characters_repository.dart';
import 'package:characters_api/data/repositories/quotes_repository.dart';
import 'package:characters_api/data/services/characters_service.dart';
import 'package:characters_api/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/strings.dart';
import 'presentation/screens/details_screen.dart';

class AppRouting {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  late QuotesRepository quotesRepository;
  late QuotesCubit quotesCubit;

  AppRouting() {
    charactersRepository = CharactersRepository(CharactersService());
    charactersCubit = CharactersCubit(charactersRepository: charactersRepository);

    quotesRepository = QuotesRepository(CharactersService());
    quotesCubit = QuotesCubit(quotesRepository: quotesRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: const HomeScreen(),
          ),
        );
      case detailsScreen:
        final selectedCharacter = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => quotesCubit,
            child: DetailsScreen(
              character: selectedCharacter,
            ),
          ),
        );
    }
  }
}
