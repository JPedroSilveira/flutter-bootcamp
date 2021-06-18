import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I am poor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('I am poor'),
          backgroundColor: Colors.black45,
        ),
        body: Center(
            child: Image(
          image: AssetImage('assets/images/coal.png'),
        )),
      ),
    );
  }
}
