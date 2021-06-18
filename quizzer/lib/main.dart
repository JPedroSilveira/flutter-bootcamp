import 'package:flutter/material.dart';
import 'package:quizzer/pages/quiz/quiz.dart';

void main() => runApp(Quizzer());

class Quizzer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(title: 'Flutter Demo Home Page'),
    );
  }
}
