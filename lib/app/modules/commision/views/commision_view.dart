import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muadz_mobilefeordo/app/widgets/app_bar.dart';

import '../controllers/commision_controller.dart';

class CommisionView extends GetView<CommisionController> {
  const CommisionView({Key? key}) : super(key: key);
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
