import 'package:characters_api/constants/strings.dart';
import 'package:characters_api/data/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CharactersItems extends StatelessWidget {
  final List<Character> characters;

  const CharactersItems({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation currentOrientation = MediaQuery.of(context).orientation;

    return characters.isNotEmpty
        ? GridView.builder(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio:currentOrientation==Orientation.portrait? 2 / 2.8 : 2 / 1.5 ,
              crossAxisSpacing: 8,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: () {
                    Navigator.pushNamed(context, detailsScreen,
                        arguments: characters[index]);
                  },
                  child: Hero(
                    tag: characters[index].charId!,
                    child: Wrap(
                        alignment: WrapAlignment.center,
                      children: [
                        characters[index].img != null ||
                                characters[index].img!.isNotEmpty
                            ? FadeInImage.assetNetwork(
                                placeholder: "assets/images/loading.gif",
                                image: characters[index].img!,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              )
                            : Image.asset("assets/images/thinking.png"),
                        Text(
                          characters[index].name!,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
          )
        :  Center(
            child: Text("Not Find Any Character",textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle2),
          );
  }
}
