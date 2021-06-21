import 'package:bmi_calculator/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class ResultValue extends StatelessWidget {
  final double value;

  ResultValue({required this.value});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${value.toStringAsFixed(1)}',
        style: AppTextStyles.xNumber,
      ),
    );
  }
}
