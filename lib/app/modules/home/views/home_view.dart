import 'package:dots_indicator/dots_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muadz_mobilefeordo/app/data/colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FlSpot> dummyData1 = const [
      FlSpot(1, 175000),
      FlSpot(2, 225000),
      FlSpot(3, 125000),
      FlSpot(4, 250000),
      FlSpot(5, 150000),
      FlSpot(6, 200000),
      FlSpot(7, 175000),
    ];

    Map<String, List> mapPerform = {
      'value': [57, 28, 100, 150, 45, 13],
      'title': [
        'Total Lead',
        'Hot Lead',
        'Total Deals',
        'Grand Opening',
        'Cold Lead',
        'Failed Deal',
      ],
      'color': const [
        Color(0XFFBEA4F3),
        Color(0XFFEB73A0),
        Color(0XFF6BF53A),
        Color(0XFF75DB73),
        Color(0XFF287EFF),
        Color(0XFFFF5959),
      ],
      'asset': [
        'store',
        'fire',
        'check',
        'flag',
        'cold',
        'cancel',
      ]
    };

    Map<String, List> mapRecent = {
      'name': [
        'Shinta Alexandra',
        'Vita Arsalansia',
        'Meriko Yolanda',
        'Higuain Morelan',
        'Jhonatan Zegwin',
      ],
      'asset': [
        'image-2',
        'image-4',
        'image-5',
        'image-6',
        'image-3',
      ],
      'date': [
        '31 January 2023',
        '15 January 2023',
        '17 January 2023',
        '22 January 2023',
        '23 January 2023',
      ],
      'status': [
        'New Lead',
        'Hot Lead',
        'Cold Lead',
        'Total Deals',
        'Grand Opening',
        'Failed Deal',
      ],
      'color': const [
        purpleColor,
        Color(0XFFEB73A0),
        Color(0XFFEDAD60),
        Color(0XFF75DB73),
        Color(0XFF287EFF),
        Color(0XFFFF5959),
      ],
      'assetIcon': [
        'star',
        'fire',
        'cold',
        'check',
        'flag',
        'cancel',
      ]
    };

    Map<String, List> mapLeaderBoard = {
      'name': [
        'Shinta Alexandra',
        'Jhonatan Zegwin',
        'Vita Arsalansia',
        'Meriko Yolanda',
        'Higuain Morelan'
      ],
      'asset': ['image-2', 'image-3', 'image-4', 'image-5', 'image-6'],
      'date': [
        '31 January 2023',
        '23 January 2023',
        '15 January 2023',
        '17 January 2023',
        '22 January 2023'
      ],
      'deals': [45, 41, 34, 30, 25],
    };

    Gradient gradientColor = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0XFF7864E6), Colors.transparent]);
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w500),
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
                  width: 25,
                  height: 25,
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
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                                    style: kPoppins.copyWith(),
                                  ),
                                  Text(
                                    'Rp257.500.000',
                                    style: kPoppins.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              PopupMenuButton(
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
                                          color: primaryColor),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    height: 40,
                                    value: 2,
                                    child: Text(
                                      'Weekly',
                                      style:
                                          kPoppins.copyWith(color: textColor),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    height: 40,
                                    value: 3,
                                    child: Text(
                                      'Monthly',
                                      style:
                                          kPoppins.copyWith(color: textColor),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: LineChart(
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
                            reservedSize: 40,
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
                          spots: dummyData1,
                          isCurved: true,
                          barWidth: 3,
                          color: Colors.white,
                          belowBarData:
                              BarAreaData(show: true, gradient: gradientColor),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                DotsIndicator(
                  dotsCount: 3,
                  position: 1,
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
                ),
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
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 110,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              clipBehavior: Clip.none,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: index == 0
                                        ? EdgeInsets.zero
                                        : const EdgeInsets.only(left: 20),
                                    child: CardPerform(
                                        asset:
                                            'assets/icons/${mapPerform['asset']![index]}.svg',
                                        value: mapPerform['value']![index]
                                            .toString(),
                                        title: mapPerform['title']![index],
                                        color: mapPerform['color']![index]));
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          DotsIndicator(
                            dotsCount: 3,
                            position: 1,
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
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recent Lead',
                                style: kPoppins.copyWith(
                                    color: textColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
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
                                                  color: textColor
                                                      .withOpacity(0.1),
                                                  spreadRadius: 3,
                                                  blurRadius: 50,
                                                  offset: const Offset(0, 0),
                                                ),
                                              ]
                                            : [],
                                      ),
                                      child: CardRecent(
                                          assetIcon:
                                              'assets/icons/${mapRecent['assetIcon']![index]}.svg',
                                          color: mapRecent['color']![index],
                                          name: mapRecent['name']![index],
                                          status: mapRecent['status']![index],
                                          asset:
                                              'assets/${mapRecent['asset']![index]}.png',
                                          date: mapRecent['date']![index]),
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
                                    fontWeight: FontWeight.w600),
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
                                        name: mapLeaderBoard['name']![index],
                                        date: mapLeaderBoard['date']![index],
                                        deal: mapLeaderBoard['deals']![index]
                                            .toString(),
                                        asset:
                                            'assets/${mapLeaderBoard['asset']![index]}.png'),
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

  Widget CardPerform(
      {required String value,
      required String title,
      required String asset,
      required Color color}) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: textColor.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2.5),
                height: 20,
                width: 20,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                child: SvgPicture.asset(asset),
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: kPoppins.copyWith(color: textColor, fontSize: 12),
              ),
            ],
          ),
          Text(
            value,
            style: kPoppins.copyWith(
                color: textColor, fontSize: 27, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last month',
                style: kPoppins.copyWith(
                    fontSize: 12,
                    color: Colors.black38,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                '+3.5%',
                style: kPoppins.copyWith(
                    color: textColor, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget CardRecent(
      {required String name,
      required String asset,
      required String assetIcon,
      required String date,
      required String status,
      required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.white),
                  image: DecorationImage(
                      image: AssetImage(asset), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: kPoppins.copyWith(
                        color: textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/calendar.svg'),
                      const SizedBox(width: 6),
                      Text(
                        date,
                        style: kPoppins.copyWith(
                            fontSize: 12,
                            color: Colors.black38,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(assetIcon),
                    const SizedBox(width: 6),
                    Text(
                      status,
                      style: kPoppins.copyWith(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Rp.13.000.000',
                style: kPoppins.copyWith(
                    color: textColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget CardLeaderboard({
    required int index,
    required String name,
    required String asset,
    required String date,
    required String deal,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '${index + 1}',
              textAlign: TextAlign.center,
              style: kPoppins.copyWith(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 25),
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondaryColor.withOpacity(0.6),
                    image: DecorationImage(
                        image: AssetImage(asset), fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: kPoppins.copyWith(
                          color: textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      date,
                      style: kPoppins.copyWith(
                          fontSize: 12,
                          color: Colors.black38,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text(
              deal,
              style: kPoppins.copyWith(
                  color: primaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 3),
            Text(
              'Deals',
              style: kPoppins.copyWith(
                  fontSize: 12,
                  color: Colors.black38,
                  fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }
}

enum FilterState { daily, weekly, monthly }
