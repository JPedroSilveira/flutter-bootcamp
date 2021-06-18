import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

final AudioCache player = AudioCache();
const colors = [
  Colors.deepPurple,
  Colors.blueGrey,
  Colors.red,
  Colors.yellow,
  Colors.pink,
  Colors.green,
  Colors.orange
];

void main() => runApp(Xylophone());

class Xylophone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Xylophone'),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  void _playNote(int soundNumber) async {
    final result = await player.play('note$soundNumber.wav');
    print(result);
  }

  Widget _renderKey(int keyNumber) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () => _playNote(keyNumber + 1),
        child: Container(
          color: colors[keyNumber],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < 7; i++) _renderKey(i),
            ],
          ),
        ),
      ),
    );
  }
}
