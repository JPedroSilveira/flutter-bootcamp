import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const BottomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: AppColors.white,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: AppColors.calculateButtonColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
