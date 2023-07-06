import 'package:dots_indicator/dots_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:muadz_mobilefeordo/core/values/colors.dart';
import 'package:muadz_mobilefeordo/presentation/main/widgets/pop_menu.dart';

class ChartCarousel extends StatefulWidget {
  const ChartCarousel({super.key});

  @override
  State<ChartCarousel> createState() => _ChartCarouselState();
}

class _ChartCarouselState extends State<ChartCarousel> {
  int? indexChart = 0;
  @override
  Widget build(BuildContext context) {
    Gradient gradientColor = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0XFF7864E6), Colors.transparent],
    );

    Map<String, List<FlSpot>> dummyChart = {
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
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
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const PopMenu()
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: PageView.builder(
            clipBehavior: Clip.none,
            itemCount: 3,
            onPageChanged: (value) {
              setState(() {
                indexChart = value;
              });
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
                      spots: dummyChart['dummy${index + 1}']!,
                      isCurved: true,
                      barWidth: 3,
                      color: Colors.white,
                      belowBarData:
                          BarAreaData(show: true, gradient: gradientColor),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        DotsIndicator(
          dotsCount: 3,
          position: indexChart ?? 1,
          decorator: DotsDecorator(
            activeColor: Colors.white,
            color: Colors.white24,
            spacing: const EdgeInsets.all(3),
            size: const Size(30, 5),
            activeSize: const Size(30, 5),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            shapes: [
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ],
            activeShapes: [
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ],
          ),
        ),
      ],
    );
  }
}
