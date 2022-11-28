import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function answerHandler;
  final String answerText;

  Answer(this.answerHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color.fromARGB(255, 27, 27, 27),
      child: ElevatedButton(
        child: Text(answerText),
        onPressed: answerHandler,
      ),
    );
  }
}
