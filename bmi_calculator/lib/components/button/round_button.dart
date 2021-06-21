import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;

  RoundButton({required this.icon, required this.onPressed});

  @override
  Widget build(Object context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: AppColors.floatingButtonBg,
      child: Icon(
        icon,
        size: 36,
        color: AppColors.white,
      ),
    );
  }
}
