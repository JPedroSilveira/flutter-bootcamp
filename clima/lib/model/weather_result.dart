import 'package:clima/model/weather.dart';

class WeatherResult {
  late final bool failLoadingPosition;
  late final bool failLoadingInternalData;
  late final bool failtLoadingWeather;
  final bool success;
  final WeatherModel? model;
  WeatherResult({
    required this.success,
    this.model,
    bool? failLoadingPosition,
    bool? failLoadingInternalData,
    bool? failtLoadingWeather,
  }) {
    this.failLoadingPosition = failLoadingPosition ?? false;
    this.failLoadingInternalData = failLoadingInternalData ?? false;
    this.failtLoadingWeather = failtLoadingWeather ?? false;
  }

  String getErrorMessage() {
    if (failLoadingInternalData)
      return 'Error loading app, close and try again.';
    else if (failtLoadingWeather)
      return 'Unable to get weather data.';
    else if (failLoadingPosition) return 'Unable to get location.';

    return 'Internal error.';
  }
}
