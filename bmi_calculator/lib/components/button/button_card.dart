import 'package:bmi_calculator/components/card/icon_card.dart';
import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final void Function() onPressed;
  final IconData iconData;
  final String label;
  final bool? active;

  ButtonCard({
    required this.onPressed,
    required this.iconData,
    required this.label,
    this.active,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = active == null || active!;

    return GestureDetector(
      onTap: onPressed,
      child: IconCard(
        color:
            isActive ? AppColors.activeCardColor : AppColors.inactiveCardColor,
        iconData: iconData,
        label: label,
      ),
    );
  }
}
