import "package:flutter/material.dart";
import "./question.dart";
import "./answer.dart";

class Quiz extends StatelessWidget {
  final Map<String, Object> question;
  final Function answerHandler;

  Quiz({@required this.question, @required this.answerHandler});

  @override
  Widget build(BuildContext context) {
    final ask = question["question"];
    final options = question["options"] as List<String>;

    return Column(children: [
      Question(ask),
      ...(options
          .asMap()
          .entries
          .map((answerEntry) =>
              Answer(answerEntry.value, () => answerHandler(answerEntry.key)))
          .toList())
    ]);
  }
}
