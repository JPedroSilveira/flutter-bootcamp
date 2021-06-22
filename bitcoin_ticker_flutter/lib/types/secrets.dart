class Secrets {
  String coinApiId;

  Secrets({required this.coinApiId});

  factory Secrets.fromJson(dynamic json) {
    return Secrets(
      coinApiId: json['coinApiId'],
    );
  }
}
