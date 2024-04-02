import '../settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quizz/settings.dart' as Settings;

class Result extends StatelessWidget {
  final int score; // Attribuut voor het opslaan van de score

  Result(this.score); // Constructor om de score op te vangen

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView(
      children: <Widget>[
        Container(
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
        )
      ],
    );
  }
}
