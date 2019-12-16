import 'package:flutter/material.dart';
import '../models/player.dart';
import '../models/game.dart';
import 'game_page.dart';

class PartyPage extends StatefulWidget {
  @override
  PartyPageState createState() => PartyPageState();
}

class PartyPageState extends State<PartyPage> {
  final List<PlayerNameInput> _playerNameInputs = <PlayerNameInput>[];

  PartyPageState() {
    _createDefaultPlayerNameInputs();
  }

  void _createDefaultPlayerNameInputs() {
    const int DEFAULT_MIN_PLAYERS = 4;

    for (int i = 0; i < DEFAULT_MIN_PLAYERS; i++) {
      PlayerNameInput input = PlayerNameInput();
      _playerNameInputs.add(input);
    }
  }

  void _addPlayer() {
    PlayerNameInput input = PlayerNameInput();

    setState(() {
      _playerNameInputs.add(input);
    });
  }

  void _removePlayer() {
    setState(() {
      _playerNameInputs.removeLast();
    });
  }

  Widget _buildButtonRow() {
    final Widget addButton = Expanded(
      child: FlatButton(
        onPressed: _addPlayer,
        child: Text('Add'),
      ),
    );

    final Widget removeButton = Expanded(
      child: FlatButton(
        onPressed: _playerNameInputs.length > 0
            ? _removePlayer
            : null, // only remove players if there are players to remove
        child: Text('Remove'),
      ),
    );

    final Widget buttonRow = Container(
      margin: EdgeInsets.only(top: 6.0, right: 64.0, left: 64.0),
      child: Row(
        children: <Widget>[
          addButton,
          removeButton,
        ],
      ),
    );

    return buttonRow;
  }

  // '_' denotes unused parameter
  Widget _buildInputList(_, int index) {
    bool isButtonRow = index == _playerNameInputs.length;

    if (isButtonRow) {
      return _buildButtonRow();
    } else {
      return _playerNameInputs[index];
    }
  }

  List<Player> _createPlayers() {
    print('creating players');
    List<Player> players = <Player>[];

    for (PlayerNameInput input in _playerNameInputs) {
      String playerName = input.getName();

      bool isEmpty = playerName.length == 0;
      if (isEmpty) {
        continue;
      }

      Player newPlayer = Player(name: playerName);
      players.add(newPlayer);
    }

    return players;
  }

  void _startGame() async {
    List<Player> players = _createPlayers();
    Game game = await Game.createGame(players);
    print('starting game');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GamePage(game)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget pageTitle = Container(
      margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: Text(
        'Enter Player Names',
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      ),
    );

    final Widget inputList = Expanded(
      child: new ListView.builder(
        padding: new EdgeInsets.all(8.0),
        itemBuilder: _buildInputList,
        // + 1 for the add/remove button row
        itemCount: _playerNameInputs.length + 1,
      ),
    );

    final Widget startButton = Container(
      margin: EdgeInsets.only(top: 12.0, bottom: 24.0),
      child: RaisedButton(
        onPressed: _startGame,
        child: Text('Start!'),
      )
    );

    final Widget page = Scaffold(
        appBar: AppBar(elevation: 0.0),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            pageTitle,
            inputList,
            startButton,
          ],
        )));

    return page;
  }
}

class PlayerNameInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final String _hintText = 'Player Name';

  String getName() {
    return _controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.0, left: 48.0, right: 48.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _controller,
              decoration: new InputDecoration(hintText: _hintText),
              autocorrect: false,
              autofocus: false,
            ),
          ),
        ],
      ),
    );
  }
}
