import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 175, 76, 155),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welkom op de grote Jolynn-Quiz App!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Ga snel naar Quiz om erin te vliegen! Wie weet ben jij de slimste speler ooit!!',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // Voeg hier een Image widget toe met het pad naar je GIF
          Image.asset(
            'images/quizgif.gif',
            width: 200, // Pas de breedte van de GIF aan zoals gewenst
            height: null, // Pas de hoogte van de GIF aan zoals gewenst
          ),
        ],
      ),
    );
  }
}
