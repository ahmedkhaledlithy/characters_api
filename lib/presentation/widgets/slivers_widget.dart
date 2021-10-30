import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:characters_api/business_logic/quote/quotes_cubit.dart';
import 'package:characters_api/constants/colors.dart';
import 'package:characters_api/data/models/character.dart';
import 'package:characters_api/data/models/character_quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliversWidget extends StatefulWidget {
  final Character character;

  const SliversWidget({Key? key, required this.character}) : super(key: key);

  @override
  State<SliversWidget> createState() => _SliversWidgetState();
}

class _SliversWidgetState extends State<SliversWidget> {
  @override
  void initState() {
    BlocProvider.of<QuotesCubit>(context).fetchQuotes(widget.character.name!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                characterInfo("birthday : ", widget.character.birthday!),
                buildDivider(290),
                characterInfo("Category : ", widget.character.category!),
                buildDivider(290),
                characterInfo("Status : ", widget.character.status!),
                buildDivider(305),
                characterInfo("Seasons : ", widget.character.appearanceOfSeasons!.join(" / ")),
                buildDivider(290),
                characterInfo("Actor/Actress : ", widget.character.actorName!),
                buildDivider(240),
                widget.character.betterCallSaulAppearance!.isNotEmpty
                    ? characterInfo("Better Call Saul Season : ",
                        widget.character.betterCallSaulAppearance!.join(" / "))
                    : Container(),
                widget.character.betterCallSaulAppearance!.isNotEmpty
                    ? buildDivider(155)
                    : Container(),
                characterInfo(
                    "Job : ", widget.character.descriptionRole!.join(" / ")),
                buildDivider(330),
                const SizedBox(
                  height: 50,
                ),
                BlocBuilder<QuotesCubit, QuotesState>(
                  builder: (context, state) {
                    if (state is QuotesLoaded) {
                      return displayRandomTextOrEmptyText(state.quotes);
                    } else {
                      return buildLoading();
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 400,
          ),
        ],
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: Theme.of(context).iconTheme.color,
      thickness: 2,
      height: 30,
      endIndent: endIndent,
    );
  }

  Widget displayRandomTextOrEmptyText(List<CharacterQuote> allQuotes) {
    if (allQuotes.isNotEmpty) {
      int randomQuote = Random().nextInt(allQuotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26,
            color: primaryColor
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(
                allQuotes[randomQuote].quote!,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(color: primaryColor,),
    );
  }
}
