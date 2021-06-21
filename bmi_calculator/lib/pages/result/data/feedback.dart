import 'package:bmi_calculator/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class ResultFeedback extends StatelessWidget {
  final String feedback;

  ResultFeedback({required this.feedback});

  @override
  Widget build(Object context) {
    return Center(
      child: Text(
        feedback,
        style: AppTextStyles.defaultText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
