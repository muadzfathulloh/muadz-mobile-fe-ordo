import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muadz_mobilefeordo/core/values/colors.dart';
import 'package:muadz_mobilefeordo/presentation/main/commision_view.dart';
import 'package:muadz_mobilefeordo/presentation/main/home_view.dart';
import 'package:muadz_mobilefeordo/presentation/main/lead_view.dart';
import 'package:muadz_mobilefeordo/presentation/main/profile_view.dart';

import '../controllers/main_controller.dart';
import '../global_widgets/bottom_bar.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainController>(
        init: MainController(),
        builder: (c) {
          return IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomeView(),
              LeadView(),
              CommisionView(),
              ProfileView(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.none,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
          height: Get.height * 0.07,
          decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: GetBuilder<MainController>(
            init: MainController(),
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomBar(
                    text: "Home",
                    iconEnable: 'home',
                    iconDisable: 'home2',
                    selected: controller.tabIndex == 0 ? true : false,
                    onPressed: () {
                      controller.changeTabIndex(0);
                    },
                  ),
                  BottomBar(
                    text: "Lead",
                    iconEnable: "lead",
                    iconDisable: "lead2",
                    selected: controller.tabIndex == 1 ? true : false,
                    onPressed: () {
                      controller.changeTabIndex(1);
                    },
                  ),
                  BottomBar(
                    text: "Commision",
                    iconEnable: "commision",
                    iconDisable: "commision2",
                    selected: controller.tabIndex == 2 ? true : false,
                    onPressed: () {
                      controller.changeTabIndex(2);
                    },
                  ),
                  BottomBar(
                    text: "Profile",
                    iconEnable: "profile",
                    iconDisable: "profile2",
                    selected: controller.tabIndex == 3 ? true : false,
                    onPressed: () {
                      controller.changeTabIndex(3);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
