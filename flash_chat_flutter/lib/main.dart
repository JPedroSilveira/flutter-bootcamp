import 'package:flash_chat/constants/route.dart';
import 'package:flash_chat/screens/firebase_loader.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: RouteConstants.firebaseLoader,
      routes: {
        RouteConstants.chat: (context) => ChatScreen(),
        RouteConstants.login: (context) => LoginScreen(),
        RouteConstants.registration: (context) => RegistrationScreen(),
        RouteConstants.welcome: (context) => WelcomeScreen(),
        RouteConstants.firebaseLoader: (context) => FirebaseLoader(),
      },
    );
  }
}
