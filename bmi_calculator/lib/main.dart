import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:bmi_calculator/constants/app_routes.dart';
import 'package:bmi_calculator/pages/input/input.dart';
import 'package:bmi_calculator/pages/result/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => InputPage(title: 'BMI Calculator'),
        AppRoutes.result: (context) => ResultPage(),
      },
      theme: ThemeData(
        primaryColor: AppColors.backgroundColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
