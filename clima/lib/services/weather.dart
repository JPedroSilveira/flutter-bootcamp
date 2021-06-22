import 'package:clima/model/weather.dart';
import 'package:clima/model/weather_result.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/secrets.dart';
import 'package:clima/types/location.dart';
import 'package:clima/types/secrets.dart';
import 'package:clima/types/weather.dart';
import 'package:clima/utils/networking.dart';

class WeatherService {
  String? _weatherApiId;
  Location? _location;

  static final WeatherService _singleton = WeatherService._internal();

  factory WeatherService() {
    return _singleton;
  }

  WeatherService._internal();

  Future<void> _getLocaton() async {
    _location = await LocationService().getCurrentLocation();
  }

  Future<void> _getWeatherApiId() async {
    final Secrets? secrets = await SecretsService().getSecrets();
    if (secrets != null) {
      _weatherApiId = secrets.weatherApiId;
    } else {
      _weatherApiId = null;
    }
  }

  Future<WeatherResult?> getNecessaryData() async {
    await Future.wait([_getLocaton(), _getWeatherApiId()]);

    if (_location == null) {
      return WeatherResult(
        failLoadingPosition: true,
        success: false,
      );
    }

    if (_weatherApiId == null) {
      return WeatherResult(
        failLoadingInternalData: true,
        success: false,
      );
    }

    return null;
  }

  Future<WeatherResult> requestOnServer(Uri uri) async {
    final response = await NetworkUtis.fromUri(uri: uri).getData();
    if (response.success) {
      final Weather weather = Weather.fromJson(response.json);
      if (weather.weatherData != null) {
        final WeatherModel model = WeatherModel(
          condition: weather.weatherData!.id,
          temperature: weather.main.temp,
          city: weather.city,
        );
        return WeatherResult(
          success: true,
          model: model,
        );
      }
    }

    return WeatherResult(
      success: false,
      failtLoadingWeather: true,
    );
  }

  Future<WeatherResult> getWeatherByCity(String city) async {
    WeatherResult? resultWithError = await getNecessaryData();
    if (resultWithError != null) return resultWithError;

    final Uri uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'q': '$city',
        'APPID': _weatherApiId,
        'units': 'metric',
      },
    );

    return requestOnServer(uri);
  }

  Future<WeatherResult> getLocationWeather() async {
    WeatherResult? resultWithError = await getNecessaryData();
    if (resultWithError != null) return resultWithError;

    final Uri uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': '${_location!.latitude}',
        'lon': '${_location!.longitude}',
        'APPID': _weatherApiId,
        'units': 'metric',
      },
    );

    return requestOnServer(uri);
  }
}
