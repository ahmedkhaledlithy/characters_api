import 'package:characters_api/data/models/character.dart';
import 'package:characters_api/shared/no_internet.dart';
import 'package:characters_api/presentation/widgets/sliver_appbar.dart';
import 'package:characters_api/presentation/widgets/slivers_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class DetailsScreen extends StatelessWidget {
  final Character character;

  const DetailsScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        return OfflineBuilder(
          connectivityBuilder: (BuildContext context, ConnectivityResult connectivity, Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;
            if(connected){
              return child;
            }else{
              return const OfflineWidget();
            }
          },
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverBar(character: character),
                SliversWidget(character: character),
              ],
            ),
          ),
        );

  }
}
