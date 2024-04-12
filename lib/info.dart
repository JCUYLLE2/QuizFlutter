// info.dart
import 'package:flutter/material.dart';
import 'package:flutter_quizz/player_notifier.dart';
import 'package:flutter_quizz/leaderboard.dart'; // Importeer de Leaderboard-klasse
import 'package:provider/provider.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<PlayerNotifier>(context).player;
    final leaderboard = Provider.of<Leaderboard>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 175, 152, 76),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Voeg de Image widget toe met het GIF-bestand
              Image.asset(
                '/images/wingif.gif',
                width: 200, // Pas de breedte van de GIF aan zoals gewenst
                height: 200, // Pas de hoogte van de GIF aan zoals gewenst
              ),
              SizedBox(height: 20),
              // Verwijder de ElevatedButton widget
              // of vervang deze door een andere widget indien nodig
              SizedBox(height: 20),
              Text(
                'Leaderboard:',
                style: TextStyle(fontSize: 24),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: leaderboard.entries.length,
                itemBuilder: (context, index) {
                  final entry = leaderboard.entries[index];
                  final rank = index + 1;
                  return ListTile(
                    title: Text('$rank. ${entry.playerName}: ${entry.score}'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
