import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SliderThemes {
  static const SliderThemeData defaultTheme = SliderThemeData(
    thumbColor: AppColors.sliderActiveColor,
    overlayColor: AppColors.sliderOverlayColor,
    activeTrackColor: AppColors.white,
    trackHeight: 1,
    thumbShape: RoundSliderThumbShape(
      enabledThumbRadius: 15,
    ),
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 30,
    ),
  );
}
