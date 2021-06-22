import 'package:flutter/material.dart';

class ContextUtils {
  static T getArguments<T>(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments as T;
  }
}
