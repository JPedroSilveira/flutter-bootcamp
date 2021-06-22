import 'package:clima/constants/routes.dart';
import 'package:clima/screens/city.dart';
import 'package:clima/screens/location.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: Routes.loading,
      routes: {
        Routes.loading: (context) => LoadingScreen(),
        Routes.location: (context) => LocationScreen(context: context),
        Routes.city: (context) => CityScreen()
      },
    );
  }
}
