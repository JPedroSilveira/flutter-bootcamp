import 'package:flutter/material.dart';

class QuizScoreBoard extends StatelessWidget {
  QuizScoreBoard({
    Key? key,
    required this.results,
  }) : super(key: key);

  final List<bool> results;

  Widget _renderSuccess() {
    return Icon(Icons.check, color: Colors.green);
  }

  Widget _renderError() {
    return Icon(Icons.close, color: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Wrap(
          direction: Axis.horizontal,
          children: results
              .map((e) => e ? _renderSuccess() : _renderError())
              .toList(),
        ),
      ),
    );
  }
}
