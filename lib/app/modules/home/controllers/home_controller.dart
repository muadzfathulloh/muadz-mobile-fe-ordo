import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muadz_mobilefeordo/app/data/colors.dart';
import 'package:muadz_mobilefeordo/app/modules/home/views/home_view.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  var currentIndex = 0.obs;
  var indexChart = 0.obs;

  FilterState? state = FilterState.daily;

  final Map<String, List<FlSpot>> dummyChart = {
    'dummy1': const [
      FlSpot(0, 245000),
      FlSpot(1, 252000),
      FlSpot(2, 255000),
      FlSpot(3, 240000),
      FlSpot(4, 250000),
      FlSpot(5, 260000),
      FlSpot(6, 255000),
      FlSpot(7, 245000),
      FlSpot(8, 245000),
    ],
    'dummy2': const [
      FlSpot(0, 245000),
      FlSpot(1, 252000),
      FlSpot(2, 255000),
      FlSpot(3, 240000),
      FlSpot(4, 250000),
      FlSpot(5, 260000),
      FlSpot(6, 255000),
      FlSpot(7, 245000),
      FlSpot(8, 245000),
    ],
    'dummy3': const [
      FlSpot(0, 245000),
      FlSpot(1, 252000),
      FlSpot(2, 255000),
      FlSpot(3, 240000),
      FlSpot(4, 250000),
      FlSpot(5, 260000),
      FlSpot(6, 255000),
      FlSpot(7, 245000),
      FlSpot(8, 245000),
    ],
  };

  final List<FlSpot> dummyData2 = const [
    FlSpot(0, 245000),
    FlSpot(1, 250000),
    FlSpot(2, 255000),
    FlSpot(3, 240000),
    FlSpot(4, 250000),
    FlSpot(5, 260000),
    FlSpot(6, 255000),
    FlSpot(7, 245000),
    FlSpot(8, 245000),
  ].obs;

  final List<FlSpot> dummyData3 = const [
    FlSpot(0, 245000),
    FlSpot(1, 250000),
    FlSpot(2, 255000),
    FlSpot(3, 240000),
    FlSpot(4, 250000),
    FlSpot(5, 260000),
    FlSpot(6, 255000),
    FlSpot(7, 245000),
    FlSpot(8, 245000),
  ].obs;

  final Map<String, List> mapPerform = {
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
    ],
    'percent': [
      3.5,
      -1.25,
      0,
      3.5,
      3.5,
      3.5,
    ],
  }.obs;

  final Map<String, List> mapRecent = {
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
  }.obs;

  final Map<String, List> mapLeaderBoard = {
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
  }.obs;

  final Gradient gradientColor = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0XFF7864E6), Colors.transparent],
  );

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onScroll(double info, dynamic index) {
    if (info == 1) {
      if (index % 2 == 0) {
        currentIndex.value = index;
      }
    }
  }

  void onChart(int index) {
    indexChart.value = index;
  }

  void selectFilter({required int value}) {
    switch (value) {
      case 1:
        state = FilterState.daily;
        break;
      case 2:
        state = FilterState.weekly;
        break;
      case 3:
        state = FilterState.monthly;
        break;
      default:
    }
  }
}
