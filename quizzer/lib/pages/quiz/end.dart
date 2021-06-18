import 'package:flutter/material.dart';
import 'package:quizzer/pages/quiz/question/button.dart';

class QuizEnd extends StatelessWidget {
  final void Function() onReset;

  QuizEnd({required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Parabéns, você finalizou o quiz!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 32),
        QuizQuestionButton(
          onPressed: onReset,
          text: 'Fazer novamente',
          color: Colors.blue,
        )
      ],
    );
  }
}
