import 'package:flutter/material.dart';

class QuizQuestionText extends StatelessWidget {
  QuizQuestionText(this.question, {Key? key}) : super(key: key);

  final String question;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        question,
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
