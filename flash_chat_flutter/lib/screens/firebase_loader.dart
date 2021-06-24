import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/constants/route.dart';
import 'package:flash_chat/constants/text_style.dart';
import 'package:flash_chat/screens/chat/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class FirebaseLoader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirebaseLoaderState();
}

class _FirebaseLoaderState extends State<FirebaseLoader> {
  bool _isLoading = true;
  bool _withError = false;

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      _handleSuccessfullyLoaded();
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() => _withError = true);
    }
  }

  void _handleSuccessfullyLoaded() {
    Navigator.popAndPushNamed(context, RouteConstants.welcome);
  }

  Widget _renderError() {
    return const Text(
      'Error loading app. \n Close and try again.',
      style: TextStyleConstants.loaderWithError,
      textAlign: TextAlign.center,
    );
  }

  Widget _renderLoading() {
    return const Text(
      'Loading...',
      style: TextStyleConstants.loader,
    );
  }

  Widget _renderRedirecting() {
    return const Text(
      'Redirecting...',
      style: TextStyleConstants.loader,
    );
  }

  Widget _renderBody() {
    if (_isLoading) {
      return _renderLoading();
    }
    if (_withError) {
      return _renderError();
    }
    return _renderRedirecting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _withError ? Colors.redAccent : Colors.white,
      body: Center(
        child: _renderBody(),
      ),
    );
  }
}
