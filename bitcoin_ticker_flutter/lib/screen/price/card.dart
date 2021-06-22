import 'package:bitcoin_ticker/constants/text_styles.dart';
import 'package:bitcoin_ticker/types/exchange_result.dart';
import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  final ExchangeResult? result;
  final String from;
  final String to;

  const PriceCard({
    Key? key,
    this.result,
    required this.from,
    required this.to,
  }) : super(key: key);

  Widget _renderResult() {
    String value = "?";
    if (result != null && result!.success) {
      value = result!.response[from]!.rate.toStringAsFixed(2);
    }

    return Text(
      '1 $from = $value $to',
      textAlign: TextAlign.center,
      style: TextStyles.kDefault,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: _renderResult(),
        ),
      ),
    );
  }
}
