import 'package:flutter/material.dart';
import 'package:flutter_quizz/quiz.dart';
import 'package:flutter_quizz/welcome.dart';
import 'info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kwistet!',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kwistet!"),
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
            Welcome(),
            Quiz(),
            Info(),
          ],
        ),
      ),
    );
  }
}
