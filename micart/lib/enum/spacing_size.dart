enum SpacingSize { small, medium, large }

extension DistanceSizeExtension on SpacingSize {
  double get value {
    switch (this) {
      case SpacingSize.small:
        return 8;
      case SpacingSize.medium:
        return 16;
      default:
        return 32;
    }
  }
}
