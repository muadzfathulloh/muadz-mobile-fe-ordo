import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
    ),
  );
}
