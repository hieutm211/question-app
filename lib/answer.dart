import "package:flutter/material.dart";

class Answer extends StatelessWidget {
  final String text;
  final Function clickHandler;

  Answer(this.text, this.clickHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: RaisedButton(
        child: Text(text),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: clickHandler,
      ),
    );
  }
}
