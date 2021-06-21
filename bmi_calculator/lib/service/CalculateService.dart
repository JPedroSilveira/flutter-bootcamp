import 'dart:math';

import 'package:bmi_calculator/types/bmi_result.dart';

class CalculateService {
  static BMIResult calculateBMI(
      {required double weight, required double height}) {
    final double bmi = weight / pow(height / 100, 2);

    if (bmi >= 25) {
      return BMIResult.overweight(value: bmi);
    } else if (bmi > 18.5) {
      return BMIResult.normal(value: bmi);
    }

    return BMIResult.underweight(value: bmi);
  }
}
