import 'dart:io' show Platform;
import 'package:bitcoin_ticker/constants/coin_data.dart';
import 'package:bitcoin_ticker/constants/text_styles.dart';
import 'package:bitcoin_ticker/screen/price/card.dart';
import 'package:bitcoin_ticker/services/exchange.dart';
import 'package:bitcoin_ticker/types/exchange_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String _currency = currenciesList[0];
  ExchangeResult? _result;

  void _handleCurrencyChangeByValue(String? currency) {
    if (currency != null) {
      setState(() => _currency = currency);
    }
  }

  void _handleCurrencyChangeByIndex(int index) {
    setState(() => _currency = currenciesList[index]);
  }

  void _handleExchange() async {
    ExchangeResult result = await ExchangeService().exchange(_currency);
    setState(() {
      _result = result;
    });
  }

  Widget _renderAndroidPicker() {
    return DropdownButton(
      value: _currency,
      onChanged: _handleCurrencyChangeByValue,
      items: currenciesList.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _renderIOSPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: _handleCurrencyChangeByIndex,
      children: currenciesList.map((value) {
        return Text(value);
      }).toList(),
    );
  }

  Widget _renderPicker() {
    if (Platform.isAndroid) {
      return _renderAndroidPicker();
    }

    return _renderIOSPicker();
  }

  Widget _renderResult() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoList.map(
        (from) {
          return PriceCard(
            from: from,
            to: _currency,
            result: _result,
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _renderResult(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: _handleExchange,
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: Text(
                'CALCULATE',
                style: TextStyles.kDefault,
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: _renderPicker(),
          ),
        ],
      ),
    );
  }
}
