import 'package:bitcoin_ticker/constants/coin_data.dart';
import 'package:bitcoin_ticker/services/secrets.dart';
import 'package:bitcoin_ticker/types/exchange_response.dart';
import 'package:bitcoin_ticker/types/exchange_result.dart';
import 'package:bitcoin_ticker/types/secrets.dart';
import 'package:bitcoin_ticker/utils/network.dart';

class ExchangeService {
  static final ExchangeService _singleton = ExchangeService._internal();

  factory ExchangeService() {
    return _singleton;
  }

  ExchangeService._internal();

  Future<String?> _getCoinApiKey() async {
    final Secrets? secrets = await SecretsService().getSecrets();

    if (secrets != null) return secrets.coinApiId;

    return null;
  }

  Future<ExchangeResult> exchange(String to) async {
    String? coinApiId = await _getCoinApiKey();
    if (coinApiId == null)
      return ExchangeResult(
        internalError: true,
        success: true,
      );

    List<ExchangeResponse?> responses =
        await Future.wait(cryptoList.map((crypto) async {
      final Uri uri = Uri.https(
        'rest.coinapi.io',
        '/v1/exchangerate/$crypto/$to',
        {
          'apikey': '$coinApiId',
        },
      );

      var response = await NetworkUtis.fromUri(uri: uri).getData();

      if (response.success) {
        return ExchangeResponse.fromJson(response.json, crypto);
      }
      return null;
    }));

    if (responses.every((response) => response != null)) {
      return ExchangeResult(
        response: Map.fromIterable(responses,
            key: (e) => e.currency, value: (e) => e),
        success: true,
      );
    }

    return ExchangeResult(
      requestError: true,
      success: true,
    );
  }
}
