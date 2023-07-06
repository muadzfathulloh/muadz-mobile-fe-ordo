import 'package:flutter/material.dart';
import 'package:muadz_mobilefeordo/presentation/global_widgets/app_bar.dart';

class LeadView extends StatelessWidget {
  const LeadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Lead View',
      ),
      body: const Center(
        child: Text(
          'Lead View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
