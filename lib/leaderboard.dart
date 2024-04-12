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
        (a, b) => a.score.compareTo(b.score)); // Sorteer op score (oplopend)
    notifyListeners();
  }

  Widget buildLeaderboard() {
    return ListView.builder(
      itemCount: _entries.length,
      itemBuilder: (context, index) {
        final entry = _entries[index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(entry.playerName),
              Text(entry.score.toString()),
            ],
          ),
        );
      },
    );
  }
}
