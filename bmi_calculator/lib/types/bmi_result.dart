class BMIResult {
  final double value;
  late final _BMIResultType _type;

  BMIResult.normal({required this.value}) {
    this._type = _BMIResultType.NORMAL;
  }

  BMIResult.overweight({required this.value}) {
    this._type = _BMIResultType.OVERWEIGHT;
  }

  BMIResult.underweight({required this.value}) {
    this._type = _BMIResultType.UNDERWEIGHT;
  }

  String get feedback {
    switch (this._type) {
      case _BMIResultType.NORMAL:
        return 'You have a higher than normal body weight. Try to exercise more.';
      case _BMIResultType.OVERWEIGHT:
        return 'You have a normal body weight. Good job!';
      default:
        return 'Your BMI result is quite low, you should eat more!';
    }
  }

  String get type {
    switch (this._type) {
      case _BMIResultType.NORMAL:
        return 'Normal';
      case _BMIResultType.OVERWEIGHT:
        return 'Overweight';
      default:
        return 'Underweight';
    }
  }
}

enum _BMIResultType {
  NORMAL,
  OVERWEIGHT,
  UNDERWEIGHT,
}
