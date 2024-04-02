import 'package:flutter/material.dart';
import 'dart:async';

const double margin = 10.0;
const double buttonWidth = 160.0; // You can adjust the value as needed

StreamController<bool> restart = new StreamController<bool>();

List<dynamic> questions = [
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/image99.jpg",
    "answers": ["CSI Miami", "Familie", "Brooklynn 99", "Grey's Anatomy"],
    "correct": 2
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/imagepf.jpg",
    "answers": ["Amelie Poulin", "Thuis", "Jacky Brown", "Pulp Fiction"],
    "correct": 3
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/imageshp.jpg",
    "answers": [
      "Home Alone",
      "Harry Potter en de steen der wijzen",
      "Home Alone 2",
      "Aladin"
    ],
    "correct": 1
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/imagestp.jpg",
    "answers": ["The Lion King", "Mulan", "Star Wars", "De kleine zeemeermin"],
    "correct": 0
  },
  {
    "question": "Uit welke serie kennen we dit personage?",
    "image": "assets/images/gifst2.gif",
    "answers": [
      "E.T. the Extra-Terrestrial",
      "Close Encounters of the Third Kind",
      "The Goonies",
      "Stranger Things"
    ],
    "correct": 3
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/gifgot.gif",
    "answers": [
      "The Lord of the Rings",
      "Game of Thrones",
      "The Chronicles of Narnia",
      "Harry Potter and the Goblet of Fire"
    ],
    "correct": 1
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/imagewd.jpg",
    "answers": [
      "Fear the Walking Dead",
      "The Walking Dead",
      "Zombieland",
      "World War Z"
    ],
    "correct": 1
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/imagebf.jpg",
    "answers": [
      "Back to the Future",
      "Interstellar",
      "Inception",
      "The Matrix"
    ],
    "correct": 3
  },
  {
    "question": "Uit welke film of reeks komt dit fragment?",
    "image": "assets/images/imagelotr.jpg",
    "answers": [
      "Jurassic Park",
      "Indiana Jones",
      "The Lord of the Rings",
      "Jaws"
    ],
    "correct": 2
  },
];
