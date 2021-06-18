import 'package:flutter/material.dart';
import 'package:micard/enum/colors.dart';
import 'package:micard/enum/spacing_size.dart';
import 'package:micard/pages/home/contacts.dart';
import 'package:micard/pages/home/profile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.value,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Profile(),
            SizedBox(height: SpacingSize.medium.value),
            Contacts(),
          ],
        ),
      ),
    );
  }
}
