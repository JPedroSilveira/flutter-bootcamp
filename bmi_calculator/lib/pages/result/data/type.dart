import 'package:bmi_calculator/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class ResultType extends StatelessWidget {
  final String resultType;

  ResultType({required this.resultType});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultType,
        style: AppTextStyles.highlighted,
      ),
    );
  }
}
