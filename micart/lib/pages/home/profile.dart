import 'package:flutter/material.dart';
import 'package:micard/components/circle_image.dart';
import 'package:micard/enum/colors.dart';
import 'package:micard/enum/font_family.dart';
import 'package:micard/enum/font_size.dart';
import 'package:micard/enum/spacing_size.dart';
import 'package:micard/service/profile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleImage(image: ProfileService().getAvatar()),
        SizedBox(height: SpacingSize.medium.value),
        Text(
          ProfileService().getName(),
          style: TextStyle(
            fontSize: FontSize.xxlarge.value,
            fontFamily: FontFamily.handwriting.value,
            color: AppColors.text.value,
          ),
        ),
        SizedBox(height: SpacingSize.small.value),
        Text(
          ProfileService().getProfession(),
          style: TextStyle(
            fontSize: FontSize.xlarge.value,
            fontFamily: FontFamily.regular.value,
            color: AppColors.text.value,
          ),
        ),
      ],
    );
  }
}
