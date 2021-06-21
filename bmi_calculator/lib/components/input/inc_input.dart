import 'package:bmi_calculator/components/button/round_button.dart';
import 'package:bmi_calculator/components/input/input_card.dart';
import 'package:flutter/material.dart';

class IncInput extends StatelessWidget {
  final String label;
  final int value;
  final String? measure;
  final void Function() onDecrease;
  final void Function() onIncrease;

  const IncInput({
    Key? key,
    required this.label,
    required this.value,
    required this.onDecrease,
    required this.onIncrease,
    this.measure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputCard(
      label: label,
      value: '$value',
      measure: measure,
      input: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundButton(
            onPressed: onDecrease,
            icon: Icons.remove,
          ),
          SizedBox(
            width: 16,
          ),
          RoundButton(
            onPressed: onIncrease,
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
