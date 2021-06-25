import 'package:flutter/material.dart';
import 'package:todoey/constant/border.dart';
import 'package:todoey/constant/elevation.dart';
import 'package:todoey/constant/size.dart';

class TaskIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: KElevation.menu,
      borderRadius: KBorder.menuRadius,
      child: Padding(
        padding: const EdgeInsets.all(
          KSize.menuIconPadding,
        ),
        child: Icon(
          Icons.list,
          size: KSize.menuIcon,
          color: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
