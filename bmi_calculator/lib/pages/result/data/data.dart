import 'package:bmi_calculator/components/card/card.dart';
import 'package:bmi_calculator/pages/result/data/feedback.dart';
import 'package:bmi_calculator/pages/result/data/type.dart';
import 'package:bmi_calculator/pages/result/data/value.dart';
import 'package:bmi_calculator/types/bmi_result.dart';
import 'package:flutter/material.dart';

class ResultData extends StatelessWidget {
  final BMIResult result;

  ResultData({required this.result});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ResultType(
              resultType: result.type,
            ),
          ),
          Expanded(
            child: ResultValue(
              value: result.value,
            ),
          ),
          Expanded(
            child: ResultFeedback(
              feedback: result.feedback,
            ),
          ),
        ],
      ),
    );
  }
}
