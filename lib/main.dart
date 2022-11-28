import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {"text": 'Black', "score": 10},
        {"text": "Red", "score": 9},
        {"text": 'Green', "score": 5},
        {"text": 'White', "score": 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite car?',
      'answers': [
        {"text": 'BMW', "score": 10},
        {"text": "VolkesWagen", "score": 9},
        {"text": 'Merceedes', "score": 5},
        {"text": 'Ferrairi', "score": 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite pet?',
      'answers': [
        {"text": 'Rabbit', "score": 10},
        {"text": "Turtule", "score": 9},
        {"text": 'Dog', "score": 5},
        {"text": 'Cat', "score": 1}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  var message = "";

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void resetTest() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz App'),
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
          ),
          backgroundColor: Color.fromARGB(255, 27, 27, 27),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Column(children: [
                  Text(
                    _totalScore == 30
                        ? "You Did It, U R Awesome\nUR Score is $_totalScore"
                        : "You did it, but we are not same\nUR Score is $_totalScore",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  TextButton(onPressed: resetTest, child: Text("Retry"))
                ])),
    );
  }
}
