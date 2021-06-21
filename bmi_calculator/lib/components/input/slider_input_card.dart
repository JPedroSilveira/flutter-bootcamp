import 'package:bmi_calculator/components/input/input_card.dart';
import 'package:bmi_calculator/constants/slider_themes.dart';
import 'package:flutter/material.dart';

class SliderInputCard extends StatelessWidget {
  final String label;
  final double value;
  final String? measure;
  final String? textValue;
  final void Function(double newValue) onChanged;
  final double min;
  final double max;
  final int divisions;

  const SliderInputCard({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.min,
    required this.max,
    required this.divisions,
    required this.label,
    this.measure,
    this.textValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputCard(
      label: label,
      value: textValue != null ? textValue! : '$value',
      measure: measure,
      input: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 32,
        ),
        child: SliderTheme(
          data: SliderThemes.defaultTheme,
          child: Slider(
            value: value,
            onChanged: onChanged,
            min: min,
            divisions: divisions,
            max: max,
          ),
        ),
      ),
    );
  }
}
