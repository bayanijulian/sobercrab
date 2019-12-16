import 'package:flutter/material.dart';
import 'solo_page.dart';
import 'party_page.dart';


class StartPage extends StatelessWidget {
  final String appName = 'The Pregame';

  @override
  Widget build(BuildContext context) {
    final Widget appTitle = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 32.0),
      child: Text(
          appName,
          style: Theme.of(context).textTheme.display2,
          textAlign: TextAlign.center,
      ),
    );

    final Widget soloBtn = RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SoloPage()),
        );
      },
      child: Text('Solo'),
    );

    final Widget partyBtn = RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PartyPage()),
        );
      },
      child: Text('Party'),
    );

    final Widget page = Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Spacer(),
              appTitle,
              Spacer(flex: 5),
              soloBtn,
              Spacer(),
              partyBtn,
              Spacer(flex: 20),
            ],
          )
      ),
    );

    return page;
  }
}