import 'package:flutter/material.dart';
import 'package:muadz_mobilefeordo/presentation/global_widgets/app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
