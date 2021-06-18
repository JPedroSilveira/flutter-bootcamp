import 'package:flutter/material.dart';

class QuizLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Loading...',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
