import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkUtis {
  final Uri uri;

  NetworkUtis.fromUri({required this.uri});

  Future<_NetworkResponse> getData() async {
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return _NetworkResponse(
        json: json.decode(response.body),
        success: true,
      );
    }

    return _NetworkResponse(
      success: false,
    );
  }
}

class _NetworkResponse {
  final bool success;
  final dynamic json;

  _NetworkResponse({
    required this.success,
    this.json,
  });
}
