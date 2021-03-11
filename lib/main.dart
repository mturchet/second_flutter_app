import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite team?',
      'answers': [
        {'text': 'Palmeiras', 'score': 10},
        {'text': 'São Paulo', 'score': 5},
        {'text': 'Corinthians', 'score': 0},
        {'text': 'Santos', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Pizza', 'score': 5},
        {'text': 'Burguer', 'score': 6},
        {'text': 'Japanese Food', 'score': 8},
        {'text': 'Healthy Food', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favorite alcoholic drink?',
      'answers': [
        {'text': 'Vodka', 'score': 3},
        {'text': 'Beer', 'score': 7},
        {'text': 'Whiskey', 'score': 1},
        {'text': 'Wine', 'score': 10}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    ;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
