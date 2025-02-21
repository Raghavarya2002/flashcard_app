import 'package:flashcard_app/flashcard.dart';
import 'package:flashcard_app/flashcard_view_black.dart';
import 'package:flashcard_app/flashcard_view_white.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0;
  List<FlashCard> _flashCards = [
    FlashCard('What is the capital of France?', 'Paris'),
    FlashCard('What is the capital of Germany?', 'Berlin'),
    FlashCard('What is the capital of Italy?', 'Rome'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: FlashcardViewBlack(
                      text: _flashCards[currentIndex].question),
                  back: FlashcardViewWhite(
                      text: _flashCards[currentIndex].answer),
                ),
              ),
              SizedBox(
                  height: 20), // Adds some space between the card and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      showPreviousCard();
                    },
                    icon: Icon(Icons.chevron_left),
                    label: Text('Previous'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      showNextCard();
                    },
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      currentIndex =
          (currentIndex + 1 < _flashCards.length) ? currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      currentIndex =
          (currentIndex - 1 >= 0) ? currentIndex - 1 : _flashCards.length - 1;
    });
  }
}
