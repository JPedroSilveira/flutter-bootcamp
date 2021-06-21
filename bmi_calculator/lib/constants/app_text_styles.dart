import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle label = TextStyle(
    fontSize: 20,
    color: AppColors.gray,
  );
  static const TextStyle number = TextStyle(
    fontSize: 44,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle xNumber = TextStyle(
    fontSize: 100,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle highlighted = TextStyle(
    fontSize: 32,
    color: AppColors.highlightText,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle defaultText = TextStyle(
    fontSize: 24,
    color: AppColors.white,
    fontWeight: FontWeight.normal,
  );
}
