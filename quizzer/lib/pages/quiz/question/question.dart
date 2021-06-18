import 'package:flutter/material.dart';
import 'package:quizzer/pages/quiz/question/button.dart';
import 'package:quizzer/pages/quiz/question/text.dart';

class QuizQuestion extends StatelessWidget {
  final String question;
  final void Function() onYes;
  final void Function() onNo;

  QuizQuestion(
      {required this.question, required this.onYes, required this.onNo});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QuizQuestionText(question),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 64,
              vertical: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                QuizQuestionButton(
                  onPressed: onYes,
                  text: 'YES',
                  color: Colors.green,
                ),
                SizedBox(
                  height: 16,
                ),
                QuizQuestionButton(
                  onPressed: onNo,
                  text: 'NO',
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
