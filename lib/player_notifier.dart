// player_notifier.dart

import 'package:flutter/material.dart';

class PlayerNotifier extends ChangeNotifier {
  late Player _player;

  Player get player => _player;

  PlayerNotifier() {
    _player = Player();
  }

  void updateScore(int newScore) {
    _player.score = newScore;
    notifyListeners();
  }
}

class Player {
  int _score = 0; // De score van de speler is privé

  int get score => _score; // Getter om de score op te halen

  set score(int newScore) {
    _score = newScore; // Setter om de score bij te werken
  }
}
