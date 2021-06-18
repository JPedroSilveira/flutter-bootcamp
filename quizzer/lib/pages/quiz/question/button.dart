import 'package:flutter/material.dart';

class QuizQuestionButton extends StatelessWidget {
  QuizQuestionButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.color})
      : super(key: key);

  final void Function() onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 32.0,
        ),
        alignment: Alignment.center,
        backgroundColor: color,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
