import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Answer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MagicBall(title: 'Ask Me Anything'),
    );
  }
}

class MagicBall extends StatefulWidget {
  MagicBall({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int _result = 1;

  void _answer() {
    setState(() {
      _result = Random.secure().nextInt(4) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Container(
        color: Colors.blue.shade400,
        child: Center(
          child: TextButton(
            child: Image.asset('images/ball$_result.png'),
            onPressed: _answer,
          ),
        ),
      ),
    );
  }
}
