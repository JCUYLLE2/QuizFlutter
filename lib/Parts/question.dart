import 'package:flutter/material.dart';
import 'package:flutter_quizz/settings.dart' as Settings;
import 'package:flutter_quizz/Parts/answerbutton.dart';

class Question extends StatelessWidget {
  final int questionNumber; // Het nummer van de huidige vraag
  final int score; // De huidige score van de quiz
  final String question; // De tekst van de vraag
  final Function processAnswer; // De functie om het antwoord te verwerken

  const Question({
    super.key,
    required this.questionNumber,
    required this.score,
    required this.question,
    required this.processAnswer,
  });

  // Functie om een rij met antwoordknoppen te maken
  Widget makeRowWithAnswerButtons(int answerNumber) {
    List<Widget> buttons = []; // Lijst om antwoordknoppen op te slaan

    // Controleren of het tweede antwoord bestaat
    if (answerNumber + 1 <
        Settings.questions[questionNumber]["answers"].length) {
      // Toevoegen van de eerste antwoordknop
      buttons.add(
        AnswerButton(
          answer: Settings.questions[questionNumber]["answers"]
              [answerNumber], // Tekst van het antwoord
          isCorrect: Settings.questions[questionNumber]["correct"] ==
              answerNumber, // Controle of het antwoord correct is
          processAnswer:
              processAnswer, // Doorgeven van de functie om het antwoord te verwerken
        ),
      );
      // Toevoegen van de tweede antwoordknop
      buttons.add(
        AnswerButton(
          answer: Settings.questions[questionNumber]["answers"]
              [answerNumber + 2], // Tekst van het antwoord
          isCorrect: Settings.questions[questionNumber]["correct"] ==
              answerNumber + 2, // Controle of het antwoord correct is
          processAnswer:
              processAnswer, // Doorgeven van de functie om het antwoord te verwerken
        ),
      );
    } else {
      // Alleen het eerste antwoord toevoegen als het tweede antwoord niet bestaat
      buttons.add(
        AnswerButton(
          answer: Settings.questions[questionNumber]["answers"]
              [answerNumber], // Tekst van het antwoord
          isCorrect: Settings.questions[questionNumber]["correct"] ==
              answerNumber, // Controle of het antwoord correct is
          processAnswer:
              processAnswer, // Doorgeven van de functie om het antwoord te verwerken
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buttons, // De lijst van antwoordknoppen
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context); // Thema van de app

    // Weergeven van de vraag en antwoordknoppen in een ListView
    return ListView(
      children: [
        // Rij met informatie over de vraagnummer en score
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: Settings.margin),
              child: Text(
                "Vraag ${questionNumber + 1} van ${Settings.questions.length}",
                style: theme.textTheme.headlineSmall,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: Settings.margin),
              child: Text(
                "Score: $score",
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        // Weergeven van een afbeelding die bij de vraag hoort
        Container(
          margin: const EdgeInsets.symmetric(vertical: Settings.margin),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Image.asset(
            Settings.questions[questionNumber]
                ["image"], // Pad naar de afbeelding
            fit:
                BoxFit.fitWidth, // Instelling voor de pasvorm van de afbeelding
          ),
        ),
        // Weergeven van de vraagtekst
        Padding(
          padding: const EdgeInsets.all(Settings.margin),
          child: Text(
            Settings.questions[questionNumber]
                ["question"], // Tekst van de vraag
            style: theme.textTheme.headlineMedium, // Stijl van de vraagtekst
            textAlign: TextAlign.center, // Uitlijning van de vraagtekst
          ),
        ),
        // Integreren van de functie makeRowWithAnswerButtons om de antwoordknoppen weer te geven
        for (var i = 0;
            i <
                (Settings.questions[questionNumber]["answers"].length / 2)
                    .ceil();
            i++)
          makeRowWithAnswerButtons(i),
      ],
    );
  }
}
