import 'package:bmi_calculator/components/button/bottom_button.dart';
import 'package:bmi_calculator/components/card/card.dart';
import 'package:bmi_calculator/components/button/round_button.dart';
import 'package:bmi_calculator/components/input/inc_input.dart';
import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:bmi_calculator/constants/app_routes.dart';
import 'package:bmi_calculator/constants/app_text_styles.dart';
import 'package:bmi_calculator/pages/input/gender_cards.dart';
import 'package:bmi_calculator/pages/input/height_input.dart';
import 'package:bmi_calculator/service/CalculateService.dart';
import 'package:bmi_calculator/types/bmi_result.dart';
import 'package:bmi_calculator/types/gender.dart';
import 'package:bmi_calculator/types/result_args.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? _gender;
  int _height = 150;
  int _weight = 50;
  int _age = 30;

  void _calculate() {
    final BMIResult result = CalculateService.calculateBMI(
      weight: _weight.toDouble(),
      height: _height.toDouble(),
    );
    Navigator.pushNamed(
      context,
      AppRoutes.result,
      arguments: ResultArgs(result: result),
    );
  }

  void _setGender(Gender gender) {
    setState(() => _gender = _gender == gender ? null : gender);
  }

  void _handleChangeHeight(int newHeight) {
    setState(() => _height = newHeight);
  }

  void _handleIncreaseWeight() {
    setState(() => _weight++);
  }

  void _handleDecreaseWeight() {
    if (_weight > 0) setState(() => _weight--);
  }

  void _handleIncreaseAge() {
    setState(() => _age++);
  }

  void _handleDecreaseAge() {
    if (_age > 0) setState(() => _age--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: GenderCards(
              currentGender: _gender,
              onSelectFemale: () => _setGender(Gender.FEMALE),
              onSelectMale: () => _setGender(Gender.MALE),
            ),
          ),
          Expanded(
            flex: 2,
            child: HeightInput(
              height: _height,
              onChangeHeight: _handleChangeHeight,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: IncInput(
                    label: 'WEIGHT',
                    onDecrease: _handleDecreaseWeight,
                    onIncrease: _handleIncreaseWeight,
                    value: _weight,
                  ),
                ),
                Expanded(
                  child: IncInput(
                    label: 'AGE',
                    onDecrease: _handleDecreaseAge,
                    onIncrease: _handleIncreaseAge,
                    value: _age,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              text: 'CALCULATE',
              onPressed: _calculate,
            ),
          ),
        ],
      ),
    );
  }
}
