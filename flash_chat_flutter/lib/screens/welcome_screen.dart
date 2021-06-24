import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/logo.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants/animation.dart';
import 'package:flash_chat/constants/file.dart';
import 'package:flash_chat/constants/hero_animation.dart';
import 'package:flash_chat/constants/route.dart';
import 'package:flash_chat/constants/text.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _buttonAnimationController;
  late final Animation _buttonAnimation;
  late final AnimationController _titleAnimationController;
  late final Animation _titleAnimation;
  late final AnimationController _logoAnimationController;
  late final Animation _logoAnimation;
  double _logoSize = AnimationConstants.logoInitialSize;
  double _logoAngle = 0.0;
  bool _shouldRenderTitle = false;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  @override
  void dispose() {
    _disposeAnimations();
    super.dispose();
  }

  void _initAnimations() {
    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: AnimationConstants.welcomeDuration,
      ),
    );

    _buttonAnimationController.forward();

    _buttonAnimationController.addListener(() {
      setState(() => {});
    });

    _buttonAnimation = CurvedAnimation(
      parent: _buttonAnimationController,
      curve: Curves.easeInQuad,
    );

    _logoAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: AnimationConstants.logoDuration,
      ),
    );

    _logoAnimationController.addListener(() {
      final double newLogoAngle = _logoAnimation.value * 6.28319;
      setState(() {
        _logoAngle = newLogoAngle;
      });
    });

    _logoAnimationController.addStatusListener((status) async {
      await Future.delayed(
          Duration(milliseconds: AnimationConstants.logoDelay));
      if (status == AnimationStatus.completed) {
        _logoAnimationController.reverse(from: 1);
      } else if (status == AnimationStatus.dismissed) {
        _logoAnimationController.forward();
      }
    });

    _logoAnimation = CurvedAnimation(
      parent: _logoAnimationController,
      curve: Curves.easeIn,
    );

    _titleAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: AnimationConstants.welcomeDuration,
      ),
    );

    _titleAnimationController.reverse(from: 1);

    _titleAnimationController.addListener(() {
      final double logoNewSize = AnimationConstants.logoFinalSize +
          _titleAnimation.value *
              (AnimationConstants.logoInitialSize -
                  AnimationConstants.logoFinalSize);
      setState(() {
        _logoSize = logoNewSize;
      });
    });

    _titleAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _logoAnimationController.forward();
        _shouldRenderTitle = true;
      }
    });

    _titleAnimation = CurvedAnimation(
      parent: _titleAnimationController,
      curve: Curves.easeIn,
    );
  }

  void _disposeAnimations() {
    _buttonAnimationController.dispose();
    _titleAnimationController.dispose();
    _logoAnimationController.dispose();
  }

  void _redirectToRegistration() {
    Navigator.pushNamed(
      context,
      RouteConstants.registration,
    );
  }

  void _redirectToLogin() {
    Navigator.pushNamed(
      context,
      RouteConstants.login,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Transform.rotate(
                  angle: _logoAngle,
                  child: Logo(
                    height: _logoSize,
                  ),
                ),
                if (_shouldRenderTitle)
                  AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        TextConstants.appTitle,
                        textStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                        speed: Duration(
                          milliseconds: AnimationConstants.textDuration,
                        ),
                      ),
                    ],
                  )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Opacity(
                opacity: _buttonAnimation.value,
                child: Hero(
                  tag: HeroAnimationConstants.loginButton,
                  child: RoundedButton(
                    onPressed: _redirectToLogin,
                    text: TextConstants.login,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Opacity(
                opacity: _buttonAnimation.value,
                child: Hero(
                  tag: HeroAnimationConstants.registerButton,
                  child: RoundedButton(
                    onPressed: _redirectToRegistration,
                    text: TextConstants.register,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
