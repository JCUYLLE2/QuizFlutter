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
    notifyListeners(); // Belangrijk: dit zorgt ervoor dat alle luisteraars worden geïnformeerd over de update
  }
}

class Player {
  int score = 0;
}
