import 'package:bmi_calculator/components/button/button_card.dart';
import 'package:bmi_calculator/types/gender.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderCards extends StatelessWidget {
  final Gender? currentGender;
  final void Function() onSelectMale;
  final void Function() onSelectFemale;

  GenderCards({
    required this.currentGender,
    required this.onSelectMale,
    required this.onSelectFemale,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ButtonCard(
            active: currentGender == Gender.FEMALE,
            onPressed: onSelectFemale,
            iconData: FontAwesomeIcons.venus,
            label: 'FEMALE',
          ),
        ),
        Expanded(
          child: ButtonCard(
            active: currentGender == Gender.MALE,
            onPressed: onSelectMale,
            iconData: FontAwesomeIcons.mars,
            label: 'MALE',
          ),
        ),
      ],
    );
  }
}
