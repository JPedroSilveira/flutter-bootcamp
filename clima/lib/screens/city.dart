import 'package:clima/constants/routes.dart';
import 'package:clima/constants/text_field_decoration.dart';
import 'package:clima/model/weather_result.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/types/location_args.dart';
import 'package:flutter/material.dart';
import 'package:clima/constants/text_style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final cityController = TextEditingController();
  bool _isLoading = false;
  String? errorMessage;

  void _handleGetWeather() async {
    setState(() => _isLoading = true);
    final WeatherResult result =
        await WeatherService().getWeatherByCity(cityController.text);
    if (result.success) {
      setState(() {
        errorMessage = null;
        _isLoading = false;
      });
      _redirectLocationScreen(result);
    } else {
      setState(() {
        errorMessage = result.getErrorMessage();
        _isLoading = false;
      });
    }
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

  void _cancelOperation() {
    Navigator.pop(context);
  }

  Widget _renderScreen() {
    if (_isLoading) {
      return const SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      );
    }

    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: TextButton(
            onPressed: _cancelOperation,
            child: Icon(
              Icons.arrow_back_ios,
              size: 50.0,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: TextFieldDecoration.kDefaultInputDecoration,
            controller: cityController,
          ),
        ),
        TextButton(
          onPressed: _handleGetWeather,
          child: Text(
            'Get Weather',
            style: TextStyles.kButtonTextStyle,
          ),
        ),
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              errorMessage!,
              style: TextStyles.kWarningTextStyle,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: _renderScreen(),
        ),
      ),
    );
  }
}
