class ExchangeResponse {
  DateTime time;
  double rate;
  String currency;

  ExchangeResponse(
      {required this.time, required this.rate, required this.currency});

  factory ExchangeResponse.fromJson(dynamic json, String currency) {
    return ExchangeResponse(
      rate: json['rate'] as double,
      time: DateTime.parse(json['time']),
      currency: currency,
    );
  }
}
