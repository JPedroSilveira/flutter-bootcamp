import 'dart:convert';

import 'package:bitcoin_ticker/types/secrets.dart';
import 'package:flutter/services.dart';

class SecretsService {
  static final SecretsService _singleton = SecretsService._internal();
  Secrets? _secrets;

  factory SecretsService() {
    return _singleton;
  }

  SecretsService._internal();

  Future<Secrets?> getSecrets() async {
    if (_secrets == null) {
      try {
        final String response =
            await rootBundle.loadString('assets/json/secrets.json');
        final data = await json.decode(response);
        _secrets = Secrets.fromJson(data);
      } catch (e) {
        return null;
      }
    }

    return _secrets;
  }
}
