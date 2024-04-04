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
    final leaderboard =
        Provider.of<Leaderboard>(context); // Haal het leaderboard op

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
              Text(
                'Uw score: ${player.score}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigeer terug naar de welkomstpagina en vervang de huidige pagina
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text('Terug naar de welkomstpagina'),
              ),
              SizedBox(height: 20),
              // Voeg een gedeelte toe voor het weergeven van het leaderboard
              Text(
                'Leaderboard:',
                style: TextStyle(fontSize: 24),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: leaderboard.entries.length,
                itemBuilder: (context, index) {
                  final entry = leaderboard.entries[index];
                  return ListTile(
                    title: Text('${entry.playerName}: ${entry.score}'),
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
