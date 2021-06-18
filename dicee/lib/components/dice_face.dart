import 'package:flutter/material.dart';

const _valuesValidForEachDot = [
  [
    [4, 5, 6],
    [6],
    [2, 3, 4, 5, 6],
  ],
  [
    [],
    [1, 3, 5],
    [],
  ],
  [
    [2, 3, 4, 5, 6],
    [6],
    [4, 5, 6],
  ],
];

class DiceFace extends StatelessWidget {
  DiceFace({Key? key, required this.value, required this.color})
      : super(key: key);

  final int value;
  final Color color;

  Widget _renderDot(bool show) {
    return FractionallySizedBox(
      widthFactor: 0.4,
      heightFactor: 0.4,
      child: Container(
        decoration: BoxDecoration(
          color: show ? color : Colors.transparent,
          border: Border.all(
            width: 0,
            color: show ? color : Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget _renderColumn(int column) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int row = 0; row < 3; row++)
          Flexible(
            child: _renderDot(
              _valuesValidForEachDot[column][row].contains(this.value),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 5, color: color),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < 3; i++)
            Flexible(
              child: _renderColumn(i),
            ),
        ],
      ),
    );
  }
}
