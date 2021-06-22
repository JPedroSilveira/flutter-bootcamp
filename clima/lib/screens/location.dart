import 'package:clima/constants/routes.dart';
import 'package:clima/model/weather_result.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/types/location_args.dart';
import 'package:clima/utils/context.dart';
import 'package:flutter/material.dart';
import 'package:clima/constants/text_style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LocationScreen extends StatefulWidget {
  late final WeatherResult _result;

  LocationScreen({
    Key? key,
    required BuildContext context,
  }) : super(key: key) {
    final LocationArguments args = ContextUtils.getArguments(context);
    _result = args.result;
  }

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late WeatherResult _result;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _result = widget._result;
  }

  void _resetLocation() async {
    setState(() => _isLoading = true);
    final WeatherResult result = await WeatherService().getLocationWeather();
    setState(() {
      _isLoading = false;
      _result = result;
    });
  }

  String _getMessage() {
    if (!_result.success) {
      return _result.getErrorMessage();
    }

    return _result.model!.getMessage();
  }

  void _redirectToCityScreen() {
    Navigator.pushNamed(context, Routes.city);
  }

  List<Widget> _renderTemperature() {
    if (_result.success) {
      return [
        Text(
          '${_result.model!.temperature}°C',
          style: TextStyles.kTempTextStyle,
        ),
        Text(
          '${_result.model!.getWeatherIcon()}',
          style: TextStyles.kConditionTextStyle,
        ),
      ];
    }
    return [
      Text(
        'Error',
        style: TextStyles.kTempTextStyle,
      )
    ];
  }

  Widget _renderMessage() {
    return Text(
      _getMessage(),
      textAlign: TextAlign.right,
      style: TextStyles.kMessageTextStyle,
    );
  }

  List<Widget> _renderButtons() {
    return [
      TextButton(
        onPressed: _resetLocation,
        child: Icon(
          Icons.near_me,
          size: 50.0,
        ),
      ),
      TextButton(
        onPressed: _redirectToCityScreen,
        child: Icon(
          Icons.location_city,
          size: 50.0,
        ),
      ),
    ];
  }

  Widget _renderScreen() {
    if (_isLoading) {
      return const SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _renderButtons(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Row(
            children: _renderTemperature(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: _renderMessage(),
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
            image: AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
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
