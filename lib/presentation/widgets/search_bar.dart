import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> addToSearchedList;

  const SearchBar(
      {Key? key,
      required this.searchController,
      required this.addToSearchedList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      cursorColor: Theme.of(context).appBarTheme.toolbarTextStyle!.color,
      decoration:  InputDecoration(
          hintText: "Find a Character .......",
          hintStyle: Theme.of(context).appBarTheme.toolbarTextStyle,
          border: InputBorder.none),
      style: Theme.of(context).appBarTheme.toolbarTextStyle,
      onChanged: (searchCharacter) {
        addToSearchedList(searchCharacter);
      },
    );
  }
}
