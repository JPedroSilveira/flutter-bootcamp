import 'package:clima/constants/routes.dart';
import 'package:clima/constants/text_style.dart';
import 'package:clima/model/weather_result.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/types/location_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final WeatherResult result = await WeatherService().getLocationWeather();
    _redirectLocationScreen(result);
  }

  void _redirectLocationScreen(WeatherResult result) {
    Navigator.pushNamed(
      context,
      Routes.location,
      arguments: LocationArguments(
        result: result,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Loading...',
              style: TextStyles.kInfoTextStyle,
            ),
            const SpinKitDoubleBounce(
              color: Colors.white,
              size: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
