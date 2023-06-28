import 'package:flutter/material.dart';
import 'package:muadz_mobilefeordo/app/data/colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    required String title,
    List<Widget>? actions,
  }) : super(
            centerTitle: true,
            backgroundColor: primaryColor,
            elevation: 0,
            title: Text(
              title,
              style:
                  kPoppins.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            leadingWidth: 56,
            actions: actions);
}
