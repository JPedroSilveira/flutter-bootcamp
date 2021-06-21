import 'package:bmi_calculator/components/card/card.dart';
import 'package:bmi_calculator/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final String label;
  final String value;
  final Widget input;
  final String? measure;

  InputCard({
    required this.label,
    required this.value,
    required this.input,
    this.measure,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: AppTextStyles.label,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: AppTextStyles.number,
              ),
              if (measure != null)
                Text(
                  measure!,
                  style: AppTextStyles.label,
                ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          input
        ],
      ),
    );
  }
}
