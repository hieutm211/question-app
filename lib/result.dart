import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final List<Map<String, String>> answers;
  final Function submitAnother;

  Result({@required this.answers, @required this.submitAnother});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("You are so sweet"),
        ...answers
            .map((answer) => Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  answer["question"] + ": " + answer["answer"],
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                )))
            .toList(),
        Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, top: 15, right: 10),
            child: FlatButton(
                child: Text("Submit another one"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: submitAnother)),
      ],
    );
  }
}
