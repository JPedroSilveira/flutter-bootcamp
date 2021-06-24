import 'package:flash_chat/constants/file.dart';
import 'package:flash_chat/constants/hero_animation.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: HeroAnimationConstants.appLogo,
      child: Container(
        height: height,
        child: Image.asset(FileConstants.logo),
      ),
    );
  }
}
