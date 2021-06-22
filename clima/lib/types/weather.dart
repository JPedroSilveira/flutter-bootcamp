class Weather {
  final _WeatherData? weatherData;
  final _Main main;
  final _Wind wind;
  final _Clouds clouds;
  final _Sys sys;
  final String? city;

  Weather({
    this.weatherData,
    required this.main,
    required this.wind,
    required this.clouds,
    required this.sys,
    required this.city,
  });

  factory Weather.fromJson(dynamic json) {
    List<dynamic> weatherList = json['weather'];
    return Weather(
      weatherData:
          weatherList.isNotEmpty ? _WeatherData.fromJson(weatherList[0]) : null,
      main: _Main.fromJson(json['main']),
      wind: _Wind.fromJson(json['wind']),
      clouds: _Clouds.fromJson(json['clouds']),
      sys: _Sys.fromJson(json['sys']),
      city: json['name'],
    );
  }
}

class _WeatherData {
  final String main;
  final String description;
  final int id;

  _WeatherData({
    required this.main,
    required this.description,
    required this.id,
  });

  factory _WeatherData.fromJson(dynamic json) {
    return _WeatherData(
      main: json['main'],
      description: json['description'],
      id: json['id'],
    );
  }
}

class _Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  _Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory _Main.fromJson(dynamic json) {
    return _Main(
      temp: json['temp'] as double,
      feelsLike: json['feels_like'] as double,
      tempMin: json['temp_min'] as double,
      tempMax: json['temp_max'] as double,
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}

class _Wind {
  final int deg;
  final double speed;

  _Wind({
    required this.deg,
    required this.speed,
  });

  factory _Wind.fromJson(dynamic json) {
    return _Wind(
      deg: json['deg'],
      speed: json['speed'] as double,
    );
  }
}

class _Clouds {
  final int all;

  _Clouds({
    required this.all,
  });

  factory _Clouds.fromJson(dynamic json) {
    return _Clouds(
      all: json['all'],
    );
  }
}

class _Sys {
  final String? country;

  _Sys({
    required this.country,
  });

  factory _Sys.fromJson(dynamic json) {
    return _Sys(
      country: json['country'],
    );
  }
}
