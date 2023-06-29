import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muadz_mobilefeordo/app/data/colors.dart';
import 'package:muadz_mobilefeordo/app/modules/commision/views/commision_view.dart';
import 'package:muadz_mobilefeordo/app/modules/home/views/home_view.dart';
import 'package:muadz_mobilefeordo/app/modules/lead/views/lead_view.dart';
import 'package:muadz_mobilefeordo/app/modules/profile/views/profile_view.dart';
import 'package:muadz_mobilefeordo/app/widgets/bottom_bar.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (c) {
          return IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeView(),
              const LeadView(),
              const CommisionView(),
              const ProfileView(),
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
          child: GetBuilder<NavigationController>(
            init: NavigationController(),
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
