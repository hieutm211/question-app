import 'package:flutter/material.dart';
import "./quiz.dart";
import "./result.dart";

void main() => runApp(HieuApp());

class HieuApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HieuAppState();
  }
}

class _HieuAppState extends State<HieuApp> {
  var _questionIndex = 0;

  final _questions = [
    {
      "question": "What is your gender?",
      "options": ["Male", "Female"]
    },
    {
      "question": "What drinks do you like?",
      "options": ["Coffee", "Milk tea", "Juice", "Coke"]
    },
    {
      "question": "Less sugar or more sugar?",
      "options": ["Less", "Normal", "More"]
    },
    {
      "question": "What game do you play?",
      "options": ["PUBG", "LOL", "No"]
    },
  ];

  List<Map<String, String>> _answers;

  _HieuAppState() {
    _answers = new List<Map<String, String>>(_questions.length);
  }

  void _answerHandler(int answer) {
    final currentQuestion = _questions[_questionIndex];
    setState(() {
      _answers[_questionIndex] = {
        "question": currentQuestion["question"],
        "answer": (currentQuestion["options"] as List<String>)[answer]
      };
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Personality app")),
        body: _questionIndex < _questions.length
            ? Quiz(
                question: _questions[_questionIndex],
                answerHandler: _answerHandler)
            : Result(
                answers: _answers,
                submitAnother: () => setState(() {
                  _questionIndex = 0;
                }),
              ),
      ),
    );
  }
}
