import 'package:flutter/material.dart';

class TextStyleConstants {
  static const TextStyle loader = TextStyle(
    color: Colors.black,
    fontSize: 32,
  );

  static const TextStyle loaderWithError = TextStyle(
    color: Colors.greenAccent,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle errorLabel = TextStyle(
    color: Colors.red,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const sendButtonTextStyle = TextStyle(
    color: Colors.lightBlueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

  static const messageText = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static const messageSender = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
