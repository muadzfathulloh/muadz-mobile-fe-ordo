import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muadz_mobilefeordo/app/widgets/app_bar.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile View',
      ),
      body: const Center(
        child: Text(
          'Profile View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
