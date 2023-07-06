import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:muadz_mobilefeordo/core/values/colors.dart';
import 'package:muadz_mobilefeordo/presentation/global_widgets/app_bar.dart';
import 'package:muadz_mobilefeordo/presentation/main/widgets/chart_carousel.dart';
import 'package:muadz_mobilefeordo/presentation/main/widgets/home_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CustomAppBar(
        title: 'Dashboard',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/notification.svg'),
                const SizedBox(width: 10),
                Container(
                  width: 31,
                  height: 31,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                    image: const DecorationImage(
                        image: AssetImage('assets/image-1.png'),
                        fit: BoxFit.cover),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: Get.height * 05,
            child: const ChartCarousel(),
          ),
          SizedBox(height: Get.height, child: const HomeBottomSheet()),
        ],
      ),
    );
  }
}
