import 'package:dots_indicator/dots_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:muadz_mobilefeordo/app/data/colors.dart';
import 'package:muadz_mobilefeordo/app/modules/home/views/widgets/leaderboard_card.dart';
import 'package:muadz_mobilefeordo/app/modules/home/views/widgets/perform_card.dart';
import 'package:muadz_mobilefeordo/app/modules/home/views/widgets/recent_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
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
                          fit: BoxFit.cover)),
                )
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height * 05,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Revenue',
                                    style: kPoppins.copyWith(fontSize: 12),
                                  ),
                                  Text(
                                    'Rp257.500.000',
                                    style: kPoppins.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Theme(
                                data: Theme.of(context).copyWith(
                                  highlightColor: Colors.transparent,
                                ),
                                child: PopupMenuButton(
                                  icon: const Icon(Icons.more_horiz,
                                      color: Colors.white),
                                  initialValue: 1,
                                  position: PopupMenuPosition.under,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  itemBuilder: (BuildContext context) => [
                                    PopupMenuItem(
                                      height: 40,
                                      value: 1,
                                      child: Text(
                                        'Daily',
                                        style: kPoppins.copyWith(
                                            color: controller.state ==
                                                    FilterState.daily
                                                ? primaryColor
                                                : textColor),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      height: 40,
                                      value: 2,
                                      child: Text(
                                        'Weekly',
                                        style: kPoppins.copyWith(
                                            color: controller.state ==
                                                    FilterState.weekly
                                                ? primaryColor
                                                : textColor),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      height: 40,
                                      value: 3,
                                      child: Text(
                                        'Monthly',
                                        style: kPoppins.copyWith(
                                            color: controller.state ==
                                                    FilterState.monthly
                                                ? primaryColor
                                                : textColor),
                                      ),
                                    )
                                  ],
                                  onSelected: (value) {
                                    controller.selectFilter(value: value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  // padding: EdgeInsets.symmetric(vertical: 60),
                  height: 200,
                  child: PageView.builder(
                    clipBehavior: Clip.none,
                    itemCount: 3,
                    onPageChanged: (value) {
                      controller.onChart(value);
                    },
                    itemBuilder: (context, index) {
                      return LineChart(
                        LineChartData(
                          lineTouchData: const LineTouchData(
                            touchSpotThreshold: 20,
                            touchTooltipData: LineTouchTooltipData(
                              tooltipRoundedRadius: 8,
                              tooltipBgColor: Colors.black26,
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: const FlGridData(show: false),
                          titlesData: FlTitlesData(
                            show: true,
                            leftTitles: const AxisTitles(),
                            rightTitles: const AxisTitles(),
                            topTitles: const AxisTitles(),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                reservedSize: 60,
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  String? name = '';
                                  switch (value) {
                                    case 1:
                                      name = 'Mon';
                                      break;
                                    case 2:
                                      name = 'Tue';
                                      break;
                                    case 3:
                                      name = 'Wed';
                                      break;
                                    case 4:
                                      name = 'Thu';
                                      break;
                                    case 5:
                                      name = 'Fri';
                                      break;
                                    case 6:
                                      name = 'Sat';
                                      break;
                                    case 7:
                                      name = 'Sun';
                                      break;

                                    default:
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      name,
                                      style: kPoppins.copyWith(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              curveSmoothness: 0.3,
                              spots:
                                  controller.dummyChart['dummy${index + 1}']!,
                              isCurved: true,
                              barWidth: 3,
                              color: Colors.white,
                              belowBarData: BarAreaData(
                                  show: true,
                                  gradient: controller.gradientColor),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Obx(() => DotsIndicator(
                      dotsCount: 3,
                      position: controller.indexChart.value,
                      decorator: DotsDecorator(
                        activeColor: Colors.white,
                        color: Colors.white24,
                        spacing: const EdgeInsets.all(3),
                        size: const Size(30, 5),
                        activeSize: const Size(30, 5),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        shapes: [
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ],
                        activeShapes: [
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: Get.height,
            child: DraggableScrollableSheet(
              initialChildSize: 0.5,
              maxChildSize: 0.8,
              minChildSize: 0.5,
              builder: (context, scrollController) {
                return Container(
                  padding: const EdgeInsets.only(top: 45),
                  height: Get.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(36)),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/chart_bar.svg'),
                              const SizedBox(width: 6),
                              Text(
                                'Key Performance Indicator',
                                style: kPoppins.copyWith(
                                    color: textColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 95,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              clipBehavior: Clip.none,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return VisibilityDetector(
                                  key: Key(index.toString()),
                                  onVisibilityChanged: (VisibilityInfo info) {
                                    controller.onScroll(
                                        info.visibleFraction, index);
                                  },
                                  child: Padding(
                                    padding: index == 0
                                        ? EdgeInsets.zero
                                        : const EdgeInsets.only(left: 20),
                                    child: CardPerform(
                                      asset:
                                          'assets/icons/${controller.mapPerform['asset']![index]}.svg',
                                      value: controller
                                          .mapPerform['value']![index]
                                          .toString(),
                                      title: controller
                                          .mapPerform['title']![index],
                                      color: controller
                                          .mapPerform['color']![index],
                                      percent: controller.mapPerform[
                                                  'percent']![index] >
                                              0
                                          ? '+${controller.mapPerform['percent']![index].toString()}%'
                                          : '${controller.mapPerform['percent']![index].toString()}%',
                                      style: kPoppins.copyWith(
                                          fontSize: 9,
                                          color: controller.mapPerform[
                                                      'percent']![index] <
                                                  0
                                              ? Colors.red
                                              : textColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(() => DotsIndicator(
                                dotsCount: 3,
                                position: (controller.currentIndex / 2).ceil(),
                                decorator: DotsDecorator(
                                  activeColor: purpleColor,
                                  color: Colors.black12,
                                  spacing: const EdgeInsets.all(3),
                                  size: const Size(45, 4),
                                  activeSize: const Size(45, 4),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  shapes: [
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ],
                                  activeShapes: [
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ],
                                ),
                              )),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recent Lead',
                                style: kPoppins.copyWith(
                                    color: textColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 4, bottom: 4, left: 4, right: 1),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: purpleColor.withOpacity(0.1)),
                                child: SvgPicture.asset(
                                  'assets/icons/arrow-right.svg',
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            height: 210,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        boxShadow: index % 2 == 1
                                            ? [
                                                BoxShadow(
                                                  color: purpleColor
                                                      .withOpacity(0.12),
                                                  spreadRadius: 0,
                                                  blurRadius: 19,
                                                  offset: const Offset(0, -1),
                                                ),
                                              ]
                                            : [],
                                      ),
                                      child: CardRecent(
                                          assetIcon:
                                              'assets/icons/${controller.mapRecent['assetIcon']![index]}.svg',
                                          color: controller
                                              .mapRecent['color']![index],
                                          name: controller
                                              .mapRecent['name']![index],
                                          status: controller
                                              .mapRecent['status']![index],
                                          asset:
                                              'assets/${controller.mapRecent['asset']![index]}.png',
                                          date: controller
                                              .mapRecent['date']![index]),
                                    ),
                                    index != 2
                                        ? const SizedBox(
                                            height: 10,
                                          )
                                        : const SizedBox(),
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Leaderboards',
                                style: kPoppins.copyWith(
                                    color: textColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 4, bottom: 4, left: 4, right: 1),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: purpleColor.withOpacity(0.1)),
                                child: SvgPicture.asset(
                                  'assets/icons/arrow-right.svg',
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            height: 350,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    CardLeaderboard(
                                        index: index,
                                        name: controller
                                            .mapLeaderBoard['name']![index],
                                        date: controller
                                            .mapLeaderBoard['date']![index],
                                        deal: controller
                                            .mapLeaderBoard['deals']![index]
                                            .toString(),
                                        asset:
                                            'assets/${controller.mapLeaderBoard['asset']![index]}.png'),
                                    index != 4
                                        ? const Divider(
                                            height: 28,
                                          )
                                        : const SizedBox(),
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

enum FilterState { daily, weekly, monthly }
