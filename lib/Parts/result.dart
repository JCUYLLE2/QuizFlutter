import 'package:flutter/material.dart';
import 'package:flutter_quizz/settings.dart' as Settings;
import 'package:flutter_quizz/player_notifier.dart';
import 'package:provider/provider.dart';

class Result extends StatelessWidget {
  final int score; // Attribuut voor het opslaan van de score

  const Result(this.score, {Key? key})
      : super(key: key); // Constructor om de score op te vangen

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultaat'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 60,
            child: Center(
              child: Text(
                "Resultaat: ",
                style: theme.textTheme.headlineMedium,
              ),
            ),
          ),
          Center(
            child: Text(
              score.toString(),
              style: theme.textTheme.headlineLarge,
            ),
          ),
          Center(
            child: Text(
              "van de ${Settings.questions.length} vragen goed!",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text('Terug naar de homepagina'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/info');
            },
            child: Text('Bekijk het leaderboard'),
          ),
        ],
      ),
    );
  }
}
