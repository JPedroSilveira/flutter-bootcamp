import 'package:bmi_calculator/components/card/card.dart';
import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:bmi_calculator/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Color? color;

  IconCard({
    required this.iconData,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            iconData,
            size: 80,
            color: AppColors.white,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.label,
          ),
        ],
      ),
    );
  }
}
