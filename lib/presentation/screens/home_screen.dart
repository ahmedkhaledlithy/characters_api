import 'package:characters_api/business_logic/character/characters_cubit.dart';
import 'package:characters_api/business_logic/theme/theme_cubit.dart';
import 'package:characters_api/constants/colors.dart';
import 'package:characters_api/data/models/character.dart';
import 'package:characters_api/presentation/widgets/characters_widget.dart';
import 'package:characters_api/presentation/widgets/no_internet.dart';
import 'package:characters_api/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedCharacters;

  String errorMessage = "";
  bool isSearching = false;

  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).fetchAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (BuildContext context, ConnectivityResult connectivity, Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;
          if( connected){
            return child;
          }else{
            return const OfflineWidget();
          }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: isSearching
              ? SearchBar(
            searchController: searchController,
            addToSearchedList: addToSearchedList,
          )
              : _appBarTitle(),
          actions: _buildAppBarActions(),
          leading:isSearching ?  BackButton(color:  Theme.of(context).iconTheme.color) : Container(),
        ),
        body: _buildBlocWidget(),
      ),
    );
  }

  Widget _buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return CharactersItems(
            characters: searchController.text.isEmpty
                ? allCharacters
                : searchedCharacters,
          );
        } else if (state is CharactersError) {
          errorMessage = state.message;
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: primaryColor, fontSize: 35),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        }
      },
    );
  }

  void addToSearchedList(String searchCharacter) {
    searchedCharacters = allCharacters
        .where((character) =>
        character.name!.toLowerCase().startsWith(searchCharacter))
        .toList();
    setState(() {});
  }

  Widget _appBarTitle() {
    return  Center(
      child: Text(
        "BreakingBad",
         style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearching();
            Navigator.pop(context);
          },
          icon:  Icon(
            Icons.clear,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ];
    } else {
      return [
        BlocBuilder<ThemeCubit, bool>(
          builder: (context, state) {
            return Switch(
              value: state,
              onChanged: (bool value) {
                BlocProvider.of<ThemeCubit>(context).changeTheme(value: value);
              },
            );
          },
        ),
        IconButton(
          onPressed: _startSearch,
          icon:  Icon(
            Icons.search,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearching();
    setState(() {
      isSearching = false;
    });
  }

  void _clearSearching() {
    setState(() {
      searchController.clear();
    });
  }
}
