import 'package:flutter/material.dart';
import 'package:muadz_mobilefeordo/presentation/global_widgets/app_bar.dart';

class CommisionView extends StatelessWidget {
  const CommisionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Commision View',
      ),
      body: const Center(
        child: Text(
          'Commision View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
