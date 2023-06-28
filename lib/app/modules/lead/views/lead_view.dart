import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muadz_mobilefeordo/app/widgets/app_bar.dart';

import '../controllers/lead_controller.dart';

class LeadView extends GetView<LeadController> {
  const LeadView({Key? key}) : super(key: key);
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
