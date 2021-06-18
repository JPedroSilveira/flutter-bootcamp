import 'package:flutter/material.dart';
import 'package:micard/components/card/expansible_card.dart';
import 'package:micard/enum/colors.dart';
import 'package:micard/enum/font_family.dart';
import 'package:micard/enum/font_size.dart';
import 'package:micard/service/contacts.dart';

class Contacts extends StatelessWidget {
  Widget renderContactItem(IconData iconData, String value) {
    return ListTile(
      leading: Icon(
        iconData,
        color: AppColors.primary_text.value,
      ),
      title: Text(
        value,
        style: TextStyle(
          fontSize: FontSize.large.value,
          fontFamily: FontFamily.regular.value,
          color: AppColors.primary_text.value,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansibleCard(
      header: Text(
        'CONTACTS',
        style: TextStyle(
          fontSize: FontSize.large.value,
          fontFamily: FontFamily.regular.value,
          color: AppColors.primary_text.value,
        ),
      ),
      body: Column(
        children: [
          renderContactItem(Icons.email, ContactsService().getEmail()),
          renderContactItem(Icons.phone, ContactsService().getNumber()),
        ],
      ),
    );
  }
}
