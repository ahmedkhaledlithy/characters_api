import 'package:characters_api/data/models/character.dart';
import 'package:characters_api/presentation/widgets/sliver_appbar.dart';
import 'package:characters_api/presentation/widgets/slivers_widget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Character character;

  const DetailsScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverBar(character: character),
              SliversWidget(character: character),
            ],
          ),
        );

  }
}
