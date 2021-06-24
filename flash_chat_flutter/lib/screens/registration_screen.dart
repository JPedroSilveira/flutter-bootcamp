import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/logo.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/rounded_input.dart';
import 'package:flash_chat/constants/hero_animation.dart';
import 'package:flash_chat/constants/route.dart';
import 'package:flash_chat/constants/text.dart';
import 'package:flash_chat/constants/text_style.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email = '';
  String _password = '';
  bool _emailAlreadyInUse = false;
  bool _invalidEmail = false;
  bool _weakPassword = false;
  bool _unknowError = false;
  bool _isLoading = false;

  void _cleanErrors() {
    _emailAlreadyInUse = false;
    _invalidEmail = false;
    _weakPassword = false;
    _unknowError = false;
  }

  void _handleRegister() async {
    _cleanErrors();
    setState(() => _isLoading = true);
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteConstants.chat,
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() => _emailAlreadyInUse = true);
      } else if (e.code == 'invalid-email') {
        setState(() => _invalidEmail = true);
      } else if (e.code == 'weak-password') {
        setState(() => _weakPassword = true);
      } else {
        setState(() => _unknowError = true);
      }
    } catch (e) {
      setState(() => _unknowError = true);
    }
    setState(() => _isLoading = true);
  }

  void _handleChangePassword(String password) {
    _password = password;
  }

  void _handleChangeEmail(String email) {
    _email = email;
  }

  Widget _renderError() {
    String? message;
    if (_emailAlreadyInUse)
      message = 'Email already in use.';
    else if (_invalidEmail)
      message = 'Invalid email.';
    else if (_unknowError)
      message = 'Unknow error.';
    else if (_weakPassword) message = 'Weak password';

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
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedInput(
              hint: TextConstants.passwordHint,
              onChanged: _handleChangePassword,
              obscureText: true,
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Hero(
                tag: HeroAnimationConstants.registerButton,
                child: RoundedButton(
                  onPressed: _handleRegister,
                  text: TextConstants.register,
                  color: Colors.blueAccent,
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
