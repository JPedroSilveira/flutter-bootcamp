import 'package:flutter/material.dart';

enum AppColors {
  dark_primary,
  light_primary,
  primary,
  icons,
  accent,
  text,
  primary_text,
  secondary_text,
  divider
}

extension AppColorsExtension on AppColors {
  Color get value {
    switch (this) {
      case AppColors.dark_primary:
        return Color(0xFF512DA8);
      case AppColors.light_primary:
        return Color(0xFFD1C4E9);
      case AppColors.primary:
        return Color(0xFF673AB7);
      case AppColors.icons:
        return Color(0xFFFFFFFF);
      case AppColors.accent:
        return Color(0xFFCDDC39);
      case AppColors.primary_text:
        return Color(0xFF212121);
      case AppColors.secondary_text:
        return Color(0xFF757575);
      case AppColors.divider:
        return Color(0xFFBDBDBD);
      default: //text
        return Color(0xFFFFFFFF);
    }
  }
}
