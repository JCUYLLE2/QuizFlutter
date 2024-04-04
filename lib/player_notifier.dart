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
  int score = 0;
}
