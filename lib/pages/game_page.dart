import 'package:flutter/material.dart';
import 'package:sobercrab/models/game.dart';
import 'package:sobercrab/models/game_card.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GamePage extends StatefulWidget {
  final Game game;
  GamePage(this.game);

  @override
  State createState() => GamePageState(game);
}

class GamePageState extends State<GamePage> {
  final Game game;

  GamePageState(this.game);

  @override
  Widget build(BuildContext context) {

    final Widget exitBtn = Container(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          }
      ),
    );

    final deck =  new Swiper(
        layout: SwiperLayout.TINDER,
        itemWidth: MediaQuery.of(context).size.width,
        itemHeight: MediaQuery.of(context).size.height,
        itemBuilder: (context, index) {
          return new GameCardItem(game.deck.elementAt(index));
        },
        itemCount: game.deck.length);

    final Widget page = Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            exitBtn,
            Expanded(child: deck),
          ],
        ),
      )
    );

    return page;
  }

}


class GameCardItem extends StatelessWidget {

  final GameCard card;

  GameCardItem(this.card);

  @override
  Widget build(BuildContext context) {
    if (this.card == null) {
      return Container();
    }

    final Widget logoTxt = Container(
      child: Text('The Pregame'),
    );

    final Widget logoImg = Container(
      child: Container(
        margin: EdgeInsets.only(left: 4.0),
        width: 16.0,
        height: 16.0,
        child: Image.asset('assets/logo_32x32.png'),
      ),
    );

    final Widget footer = Container(
      margin: EdgeInsets.only(bottom: 12.0, right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          logoTxt,
          logoImg
        ],
      ),
    );

    final Widget description = Container(
      margin: EdgeInsets.only(left: 24.0, right: 24.0, top: 48.0),
      child: Text(
        this.card.text,
        style: Theme.of(context).textTheme.display1,
        textAlign: TextAlign.center,
      ),
      //alignment: Alignment(0.0, -0.75), // 0,0 is center, -1,-1 is top left
    );

    final Widget main = Card(
      elevation: 4.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          description,
          footer,
        ],
      ));

    return main;
  }
}
