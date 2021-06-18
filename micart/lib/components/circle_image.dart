import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  CircleImage({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(image),
      radius: 75,
    );
  }
}
