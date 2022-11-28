import 'package:flutter/material.dart';
import './Question.dart';
import './Answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<Object, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({this.questions, this.questionIndex, this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
