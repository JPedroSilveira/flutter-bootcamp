enum FontSize { small, medium, large, xlarge, xxlarge }

extension FontSizeExtension on FontSize {
  double get value {
    switch (this) {
      case FontSize.small:
        return 12;
      case FontSize.medium:
        return 16;
      case FontSize.large:
        return 20;
      case FontSize.xlarge:
        return 24;
      default:
        return 28;
    }
  }
}
