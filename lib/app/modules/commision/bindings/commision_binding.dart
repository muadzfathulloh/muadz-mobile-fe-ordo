import 'package:get/get.dart';

import '../controllers/commision_controller.dart';

class CommisionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommisionController>(
      () => CommisionController(),
    );
  }
}
