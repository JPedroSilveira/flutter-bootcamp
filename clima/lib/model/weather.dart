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
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    final String message;
    if (_temperature > 25) {
      message = 'It\'s 🍦 time';
    } else if (_temperature > 20) {
      message = 'Time for shorts and 👕';
    } else if (_temperature < 10) {
      message = 'You\'ll need 🧣 and 🧤';
    } else {
      message = 'Bring a 🧥 just in case';
    }

    if (city != null && city!.isNotEmpty) {
      return '$message in $city.';
    }
    return '$message.';
  }
}
