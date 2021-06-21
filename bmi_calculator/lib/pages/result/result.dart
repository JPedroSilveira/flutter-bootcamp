import 'package:bmi_calculator/components/button/bottom_button.dart';
import 'package:bmi_calculator/pages/result/app_bar.dart';
import 'package:bmi_calculator/pages/result/data/data.dart';
import 'package:bmi_calculator/types/result_args.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  void _handleReCalculate(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ResultArgs;

    return Scaffold(
      appBar: resultAppBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: ResultData(
              result: args.result,
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              text: 'RE-CALCULATE',
              onPressed: () => _handleReCalculate(context),
            ),
          ),
        ],
      ),
    );
  }
}
