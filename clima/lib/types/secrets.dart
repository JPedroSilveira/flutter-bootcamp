class Secrets {
  String weatherApiId;

  Secrets({required this.weatherApiId});

  factory Secrets.fromJson(dynamic json) {
    return Secrets(
      weatherApiId: json['weatherApiId'],
    );
  }
}
