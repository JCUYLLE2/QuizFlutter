import 'package:flutter/material.dart';
import 'package:flutter_quizz/Parts/question.dart';
import 'package:flutter_quizz/Parts/result.dart';
import 'package:flutter_quizz/nameinput.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key, required this.onStartQuiz}) : super(key: key);

  final VoidCallback onStartQuiz;

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

  bool isNameEntered = false;
  late String userName;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Call the superclass build method

    if (!isNameEntered) {
      return NameInput(
        onNameEntered: (name) {
          setState(() {
            userName = name;
            isNameEntered = true;
          });
        },
      );
    }

    if (questionNumber == questions.length) {
      return Result(score); // Pass the score to the result screen
    } else {
      return Question(
        questionNumber: questionNumber,
        score: score,
        question: questions[questionNumber],
        processAnswer:
            processAnswer, // Pass the processAnswer function to Question
      );
    }
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
