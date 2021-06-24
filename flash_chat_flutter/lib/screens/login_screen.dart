import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/logo.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/rounded_input.dart';
import 'package:flash_chat/constants/hero_animation.dart';
import 'package:flash_chat/constants/route.dart';
import 'package:flash_chat/constants/text.dart';
import 'package:flash_chat/constants/text_style.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email = '';
  String _password = '';
  bool _invalidEmail = false;
  bool _userDisabled = false;
  bool _userNotFound = false;
  bool _wrongPassword = false;
  bool _unknowError = false;
  bool _isLoading = false;

  void _cleanErrors() {
    _invalidEmail = false;
    _userDisabled = false;
    _userNotFound = false;
    _wrongPassword = false;
    _unknowError = false;
  }

  void _handleLogin() async {
    _cleanErrors();
    setState(() => _isLoading = true);
    try {
      await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteConstants.chat,
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        setState(() => _invalidEmail = true);
      } else if (e.code == 'user-disabled') {
        setState(() => _userDisabled = true);
      } else if (e.code == 'user-not-found') {
        setState(() => _userNotFound = true);
      } else if (e.code == 'wrong-password') {
        setState(() => _wrongPassword = true);
      } else {
        setState(() => _unknowError = true);
      }
    } catch (e) {
      setState(() => _unknowError = true);
    }
    setState(() => _isLoading = false);
  }

  void _handleChangeEmail(String value) {
    _email = value;
  }

  void _handleChangePassword(String value) {
    _password = value;
  }

  Widget _renderError() {
    String? message;
    if (_invalidEmail)
      message = 'Invalid email.';
    else if (_userDisabled)
      message = 'Disabled user.';
    else if (_userNotFound)
      message = 'User not found.';
    else if (_wrongPassword)
      message = 'Wrong password.';
    else if (_unknowError) message = 'Unknow error.';

    final bool hasError = message != null;
    if (hasError) {
      return Text(
        message,
        style: TextStyleConstants.errorLabel,
      );
    }

    return Container();
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
            Flexible(
              child: Logo(
                height: 200.0,
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedInput(
              hint: TextConstants.emailHint,
              onChanged: _handleChangeEmail,
              textInputType: TextInputType.emailAddress,
              enabled: !_isLoading,
            ),
            const SizedBox(
              height: 8.0,
            ),
            RoundedInput(
              hint: TextConstants.passwordHint,
              onChanged: _handleChangePassword,
              obscureText: true,
              enabled: !_isLoading,
            ),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Hero(
                tag: HeroAnimationConstants.loginButton,
                child: RoundedButton(
                  onPressed: _handleLogin,
                  text: TextConstants.login,
                  loading: _isLoading,
                ),
              ),
            ),
            _renderError(),
          ],
        ),
      ),
    );
  }
}
