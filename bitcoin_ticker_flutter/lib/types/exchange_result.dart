import 'package:bitcoin_ticker/types/exchange_response.dart';

class ExchangeResult {
  late final bool internalError;
  late final bool requestError;
  late final bool success;
  late final Map<String, ExchangeResponse> response;
  ExchangeResult({
    bool? internalError,
    bool? requestError,
    Map<String, ExchangeResponse>? response,
    required this.success,
  }) {
    this.internalError = internalError ?? false;
    this.requestError = requestError ?? false;
    this.response = response ?? {};
  }
}
