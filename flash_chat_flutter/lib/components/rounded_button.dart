import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RoundedButton extends StatelessWidget {
  final void Function() onPressed;
  final Color? color;
  final String text;
  final bool loading;

  RoundedButton({
    required this.onPressed,
    required this.text,
    this.color,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: color ?? Colors.lightBlueAccent,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: loading ? () {} : onPressed,
        minWidth: 200.0,
        height: 42.0,
        child: loading
            ? const SpinKitDoubleBounce(
                color: Colors.white,
                size: 40.0,
              )
            : Text(
                text,
              ),
      ),
    );
  }
}
