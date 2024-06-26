import 'dart:async';

const double margin = 10.0;
const double buttonWidth = 160.0; // You can adjust the value as needed

StreamController<bool> restart = StreamController<bool>();

List<dynamic> questions = [
  {
    "question": "Uit welke reeks komt deze bende?",
    "image": "images/image99.jpg",
    "answers": ["CSI Miami", "Familie", "Brooklynn 99", "Grey's Anatomy"],
    "correct": 2,
    "imageWidth": 200.0, // Adjust the width of the image
    "imageHeight": 200.0, // Adjust the height of the image
  },
  {
    "question": "Uit welke film komt deze foto?",
    "image": "images/imagepf.jpg",
    "answers": ["Amelie Poulin", "Thuis", "Jacky Brown", "Pulp Fiction"],
    "correct": 3
  },
  {
    "question": "Uit welke film of komt deze gif?",
    "image": "images/gifhp.gif",
    "answers": [
      "Home Alone",
      "    Harry Potter &    de steen der wijzen",
      "Home Alone 2",
      "Aladin"
    ],
    "correct": 1
  },
  {
    "question": "Uit welke film komt deze foto?",
    "image": "images/imagestp.jpg",
    "answers": ["The Lion King", "Mulan", "Star Wars", "De kleine zeemeermin"],
    "correct": 0
  },
  {
    "question": "Uit welke serie kennen we dit personage?",
    "image": "images/gifst2.gif",
    "answers": [
      "E.T.",
      "Close Encounters of the Third Kind",
      "The Goonies",
      "Stranger Things"
    ],
    "correct": 3
  },
  {
    "question": "Uit welke reeks komt deze foto?",
    "image": "images/gifgot.gif",
    "answers": [
      "The Lord of the Rings",
      "Game of Thrones",
      "The Chronicles of Narnia",
      "Harry Potter and the Goblet of Fire"
    ],
    "correct": 1
  },
  {
    "question": "Uit welke reeks komt deze foto?",
    "image": "images/imagewd.jpg",
    "answers": [
      "Fear the Walking Dead",
      "The Walking Dead",
      "Zombieland",
      "World War Z"
    ],
    "correct": 1
  },
  {
    "question": "Uit welke film komt deze foto?",
    "image": "images/giftm.gif",
    "answers": [
      "Back to the Future",
      "Interstellar",
      "Inception",
      "The Matrix"
    ],
    "correct": 3
  },
  {
    "question": "Uit welke film komt deze knapperd?",
    "image": "images/imagelotr.jpg",
    "answers": [
      "Jurassic Park",
      "Indiana Jones",
      "The Lord of the Rings",
      "Jaws"
    ],
    "correct": 2
  },
  {
    "question": "Van welke motorbende is deze man lid?",
    "image": "images/soa.gif",
    "answers": ["Outlaws", "Sons of Anarchy", "Saturdara", "Hell's Angels"],
    "correct": 1
  }
];
