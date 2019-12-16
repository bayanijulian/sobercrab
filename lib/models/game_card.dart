import 'player.dart';

class GameCard {
  int number;
  String type;
  int playerCount;
  String text;

  List<Player> _affectedPlayers = <Player>[];

  GameCard({this.text});

  GameCard.fromJson(Map<String, dynamic> json) :
      number = json['number'],
      type = json['type'],
      playerCount = json['playerCount'],
      text = json['text'];

  static List<GameCard> generateCards(List<dynamic> json) {
    List<GameCard> cards = json.map((i) => GameCard.fromJson(i)).toList();
    return cards;
  }

  void addPlayer(Player player) {
    _affectedPlayers.add(player);
  }

  bool hasPlayer(Player player) {
    return _affectedPlayers.contains(player);
  }

  void generateText() {
    for(int i = 0; i < playerCount; i ++) {
      int playerIndex = i + 1; // placeholders are 1 indexed
      String placeHolderTxt = '@$playerIndex';
      String playerName = _affectedPlayers.elementAt(i).name;
      text = text.replaceAll(placeHolderTxt, playerName);
    }
  }

}
