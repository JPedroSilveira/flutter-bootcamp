import 'package:flutter/material.dart';
import 'package:todoey/constant/size.dart';

class KBorder {
  static const BorderRadius menuRadius = BorderRadius.all(
    Radius.circular(KSize.menuIcon + KSize.menuIconPadding),
  );
  static const BorderRadius taskListRadius = BorderRadius.only(
    topLeft: Radius.circular(28),
    topRight: Radius.circular(28),
  );
  static const BorderRadius addModelRadius = BorderRadius.vertical(
    top: Radius.circular(28.0),
  );
}
