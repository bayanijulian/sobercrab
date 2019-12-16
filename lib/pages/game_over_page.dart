import 'package:flutter/material.dart';

class GameOverPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Widget gameOverText = Container(
      alignment: Alignment.center,
      child: Text(
          'Game Over!',
          style: Theme.of(context).textTheme.display2,
          textAlign: TextAlign.center,
      ),
    );

    final Widget mainMenuButton = RaisedButton(
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
        },
        child: Text('Main Menu'),
    );

    final Widget page = Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              gameOverText,
              mainMenuButton,
            ],
          )
      ),
    );

    return page;
  }
}