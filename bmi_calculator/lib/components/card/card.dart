import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Color? color;
  final Widget child;

  AppCard({this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color != null ? color : AppColors.activeCardColor,
        ),
        child: child,
      ),
    );
  }
}
