import 'package:flutter/material.dart';
import 'package:flutter_quizz/nameinput.dart';
import 'package:flutter_quizz/quiz.dart';
import 'package:flutter_quizz/welcome.dart';
import 'info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kwistet!',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const QuizApp(),
    );
  }
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  void _startQuiz(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Quiz(
          onStartQuiz: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Kwistet!"),
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: Theme.of(context).colorScheme.primary,
          labelColor: Theme.of(context).colorScheme.primary,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: "Welcome",
            ),
            Tab(
              icon: Icon(Icons.live_help),
              text: "Quiz",
            ),
            Tab(
              icon: Icon(Icons.info),
              text: "Info",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            const Welcome(),
            NameInput(
              onNameEntered: (name) {
                // Handle what to do when the name is entered
                // For example, you can navigate to the Quiz screen here
                _startQuiz(context,
                    name); // Start the quiz only after the name is entered
              },
            ),
            const Info(),
          ],
        ),
      ),
    );
  }
}
