// leaderboard.dart
import 'package:flutter/material.dart';

class LeaderboardEntry {
  final String playerName;
  final int score;

  LeaderboardEntry(this.playerName, this.score);
}

class Leaderboard extends ChangeNotifier {
  List<LeaderboardEntry> _entries = [];

  List<LeaderboardEntry> get entries => _entries;

  void addEntry(String playerName, int score) {
    _entries.add(LeaderboardEntry(playerName, score));
    _entries.sort(
        (a, b) => b.score.compareTo(a.score)); // Sorteer op score (aflopend)
    notifyListeners();
  }
}
