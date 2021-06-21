import 'package:bmi_calculator/components/card/card.dart';
import 'package:bmi_calculator/components/input/slider_input_card.dart';
import 'package:bmi_calculator/constants/app_inputs.dart';
import 'package:bmi_calculator/constants/app_text_styles.dart';
import 'package:bmi_calculator/constants/slider_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeightInput extends StatelessWidget {
  final int height;
  final void Function(int newHeight) onChangeHeight;

  HeightInput({
    required this.height,
    required this.onChangeHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SliderInputCard(
      value: height.toDouble(),
      onChanged: (newHeight) => onChangeHeight(newHeight.round()),
      min: AppInputs.minHeight.toDouble(),
      max: AppInputs.maxHeight.toDouble(),
      divisions: AppInputs.maxHeight,
      label: 'HEIGHT',
      textValue: '${height.round()}',
      measure: 'cm',
    );
  }
}
