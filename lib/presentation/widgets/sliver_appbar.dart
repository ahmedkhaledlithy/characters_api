import 'package:characters_api/data/models/character.dart';
import 'package:flutter/material.dart';

class SliverBar extends StatelessWidget {
  final Character character;

  const SliverBar({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 500,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      pinned: true,
      stretch: true,
      leading:  BackButton(color: Theme.of(context).iconTheme.color),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickname!,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        background: Hero(
            tag: character.charId!,
            child: Image.network(
              character.img!,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
