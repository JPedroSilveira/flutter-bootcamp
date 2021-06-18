import 'package:dicee/components/dice_face.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  Widget _renderDiceFace(int value) {
    return DiceFace(
      value: value,
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: [
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(45 * pi / 180),
                alignment: FractionalOffset.centerLeft,
                child: _renderDiceFace(1),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(-45 * pi / 180),
                alignment: FractionalOffset.centerLeft,
                child: _renderDiceFace(2),
              ),
              Transform.translate(
                offset: Offset(350, 0),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(225 * pi / 180),
                  alignment: FractionalOffset.centerLeft,
                  child: _renderDiceFace(3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
