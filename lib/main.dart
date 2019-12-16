import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sobercrab/pages/start_page.dart';
import 'package:sobercrab/pages/solo_page.dart';
import 'package:sobercrab/pages/party_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String appName = 'The Pregame';

  @override
  Widget build(BuildContext context) {
    TextTheme defaultTextTheme = Theme.of(context)
        .textTheme
        .copyWith(
          button: TextStyle(fontSize: 18.0),
        )
        .apply(
          fontFamily: 'Montserrat',
          displayColor: Colors.black,
          bodyColor: Colors.black,
        );

    ThemeData defaultTheme = Theme.of(context).copyWith(
      primaryColor: Colors.redAccent,
      accentColor: Colors.white,
      brightness: Brightness.light,
      textTheme: defaultTextTheme,
    );

    // forces portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: appName,
      theme: defaultTheme,
      initialRoute: '/',
      routes: {
        '/' : (context) => StartPage(),
        '/solo': (context) => SoloPage(),
        '/party': (context) => PartyPage(),
      },
    );
  }
}
