import 'package:flutter/material.dart';
import 'package:flutter_quizz/nameinput.dart';
import 'package:flutter_quizz/quiz.dart';
import 'package:flutter_quizz/welcome.dart';
import 'package:provider/provider.dart';
import 'info.dart';
import 'player_notifier.dart';
import 'leaderboard.dart'; // Importeer de Leaderboard-klasse

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlayerNotifier()),
        // Voeg andere providers toe indien nodig
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlayerNotifier()),
        ChangeNotifierProvider(
            create: (_) => Leaderboard()), // Voeg Leaderboard-provider toe
      ],
      child: MaterialApp(
        title: 'Kwistet!',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const QuizApp(),
          '/quiz': (context) => Quiz(
                onStartQuiz: () {},
              ),
          '/info': (context) => const Info(),
        },
      ),
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
                _startQuiz(context, name);
              },
            ),
            const Info(),
          ],
        ),
      ),
    );
  }

  void _startQuiz(BuildContext context, String name) {
    if (name.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Quiz(
            onStartQuiz:
                () {}, // Dit is waar je onStartQuiz zou moeten doorgeven, afhankelijk van je implementatie
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Fout"),
          content:
              const Text("Voer alstublieft uw naam in voordat u doorgaat."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}
