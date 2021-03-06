class WeatherModel {
  late final double _temperature;
  final int condition;
  final String? city;
  String get temperature => _temperature.toStringAsFixed(0);

  WeatherModel({
    required double temperature,
    required this.condition,
    required this.city,
  }) {
    this._temperature = temperature;
  }

  String getWeatherIcon() {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage() {
    final String message;
    if (_temperature > 25) {
      message = 'It\'s ๐ฆ time';
    } else if (_temperature > 20) {
      message = 'Time for shorts and ๐';
    } else if (_temperature < 10) {
      message = 'You\'ll need ๐งฃ and ๐งค';
    } else {
      message = 'Bring a ๐งฅ just in case';
    }

    if (city != null && city!.isNotEmpty) {
      return '$message in $city.';
    }
    return '$message.';
  }
}
