enum IconSize { small, medium, large }

extension IconSizeExtension on IconSize {
  double get value {
    switch (this) {
      case IconSize.small:
        return 16;
      case IconSize.medium:
        return 32;
      default:
        return 48;
    }
  }
}
