import 'player.dart';
import 'game_card.dart';

import 'dart:math';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Game {
  final List<Player> players;
  final Random _random = Random();
  final List<GameCard> deck = <GameCard>[];

  Game({this.players});

  static Future<String> loadCardData() async {
    return await rootBundle.loadString('assets/card-data.json');
  }

  static Future<Game> createGame(List<Player> players) async {
    Game game = Game(players: players);
    await game._generateDeck();
    return game;
  }

  Future<void> _generateDeck() async {
    String rawCardData = await Game.loadCardData();
    final parsedCardData = json.decode(rawCardData);
    List<GameCard> cards = GameCard.generateCards(parsedCardData);
    print('total card data is ${cards.length}');
    cards.shuffle();
    int playerCount = players.length;
    for (GameCard card in cards) {
      // skip if not enough players for card
      if (playerCount < card.playerCount) {
        print('skipping');
        continue;
      }
      // assign players to each card
      for (int i = 0; i < card.playerCount; i++) {
        Player affectedPlayer = _getRandomPlayer();

        // makes sure each player is unique
        if (card.hasPlayer(affectedPlayer)) {
          i--;
          continue;
        }

        affectedPlayer.drinkCount++;
        card.addPlayer(affectedPlayer);
      }
      card.generateText();
      deck.add(card);
      print('adding card ${card.text} ${deck.length}');
    }
  }

  Player _getRandomPlayer() {
    int playerCount = players.length;

    if (playerCount == 0) {
      return Player(drinkCount: 0, name: "Everyone");
    }

    int randomIndex = _random.nextInt(playerCount);
    return players.elementAt(randomIndex);
  }
}
