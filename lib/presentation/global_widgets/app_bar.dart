import 'package:flutter/material.dart';
import 'package:muadz_mobilefeordo/core/values/colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required String title,
    List<Widget>? actions,
  }) : super(
          centerTitle: true,
          backgroundColor: primaryColor,
          elevation: 0,
          title: Text(
            title,
            style: kPoppins.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          leadingWidth: 56,
          actions: actions,
        );
}
