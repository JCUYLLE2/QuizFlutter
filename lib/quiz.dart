import 'package:flutter/material.dart';
import 'package:flutter_quizz/Parts/question.dart';
import 'package:flutter_quizz/Parts/result.dart';
import 'package:flutter_quizz/settings.dart' as settings;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<Quiz> with AutomaticKeepAliveClientMixin {
  int questionNumber = 0;
  int score = 0;
  List<String> questions = [
    'Question 1',
    'Question 2',
    'Question 3',
    'Question 4',
    'Question 5',
    'Question 6',
    'Question 7',
    'Question 8',
    'Question 9',
    'Question 10'
  ];

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Roep de build-methode van de superclass aan

    if (questionNumber == questions.length) {
      return Result(score); // Doorgeven van de score naar het resultaatscherm
    } else {
      return Question(
        questionNumber: questionNumber,
        score: score,
        question: questions[questionNumber],
        processAnswer:
            processAnswer, // Hier gaat de processAnswer-functie naar Question
      );
    }
  }

  @override
  void initState() {
    settings.restart.stream.listen((event) {
      setState(() {
        questionNumber = 0;
        score = 0;
      });
    });
    super.initState();
  }

  void processAnswer(bool isCorrect) {
    if (isCorrect) {
      score++;
    }
    setState(() {
      questionNumber++;
    });
  }
}
