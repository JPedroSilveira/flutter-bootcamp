import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:flutter/material.dart';

final resultAppBar = AppBar(
  centerTitle: false,
  automaticallyImplyLeading: false,
  title: const Text(
    'Your Result',
    textAlign: TextAlign.start,
    style: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
  ),
);
