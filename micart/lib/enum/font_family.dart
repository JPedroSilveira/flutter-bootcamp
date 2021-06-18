enum FontFamily { regular, handwriting }

extension DistanceSizeExtension on FontFamily {
  String get value {
    switch (this) {
      case FontFamily.regular:
        return 'Montserrat';
      default:
        return 'Courgette';
    }
  }
}
