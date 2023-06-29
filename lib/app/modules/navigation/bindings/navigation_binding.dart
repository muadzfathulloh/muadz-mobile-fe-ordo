import 'package:get/get.dart';
import 'package:muadz_mobilefeordo/app/modules/home/controllers/home_controller.dart';

import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );

    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
