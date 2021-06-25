import 'package:flutter/material.dart';

class KTextStyle {
  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );
  static const TextStyle title = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 42,
  );
  static const TextStyle task = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const TextStyle checkedTask = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    decoration: TextDecoration.lineThrough,
  );
  static const TextStyle addTaskTitle = TextStyle(
    fontSize: 28,
    color: Colors.lightBlueAccent,
  );
  static const TextStyle addTaskInput = TextStyle(
    fontSize: 24,
  );
  static const TextStyle addTaskButton = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
}
