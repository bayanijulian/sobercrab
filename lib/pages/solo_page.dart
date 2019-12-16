import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class SoloPage extends StatefulWidget {
  @override
  SoloPageState createState() => SoloPageState();
}

class SoloPageState extends State<SoloPage> {
  void _launchURL() async {
    const url = 'https://www.alcohol.org/faq/am-i-an-alcoholic/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget comingSoonText = Container(
      margin: EdgeInsets.only(bottom: 18.0, left: 24.0, right: 24.0),
      child: Text(
        'Solo Mode: Coming Soon...',
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      ),
    );

    final Widget jokeText = Container(
        margin: EdgeInsets.only(left: 24.0, right: 24.0),
        alignment: Alignment.center,
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: 'For additional information and help, click ',
                style: Theme.of(context).textTheme.subhead,
              ),
              TextSpan(
                text: 'here.',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .merge(TextStyle(color: Colors.blue)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // print('hyperlink clicked');
                    _launchURL();
                  },
              ),
            ])));

    final Widget descriptionTexts = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        comingSoonText,
        jokeText,
      ],
    );

    final Widget page = Scaffold(
        appBar: AppBar(elevation: 0.0),
        body: SafeArea(child: descriptionTexts));

    return page;
  }
}
