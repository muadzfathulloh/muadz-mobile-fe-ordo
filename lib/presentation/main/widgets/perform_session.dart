import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muadz_mobilefeordo/core/values/colors.dart';
import 'package:muadz_mobilefeordo/presentation/main/widgets/perform_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PerformSession extends StatefulWidget {
  const PerformSession({super.key});

  @override
  State<PerformSession> createState() => _PerformSessionState();
}

class _PerformSessionState extends State<PerformSession> {
  int? currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
      ],
      'percent': [
        3.5,
        -1.25,
        0,
        3.5,
        3.5,
        3.5,
      ],
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/chart_bar.svg'),
            const SizedBox(width: 6),
            Text(
              'Key Performance Indicator',
              style: kPoppins.copyWith(
                  color: textColor, fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 20),
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
                  if (info.visibleFraction == 1) {
                    if (index % 2 == 0) {
                      setState(() {
                        currentIndex = index;
                      });
                    }
                  }
                },
                child: Padding(
                  padding: index == 0
                      ? EdgeInsets.zero
                      : const EdgeInsets.only(left: 20),
                  child: CardPerform(
                    asset: 'assets/icons/${mapPerform['asset']![index]}.svg',
                    value: mapPerform['value']![index].toString(),
                    title: mapPerform['title']![index],
                    color: mapPerform['color']![index],
                    percent: mapPerform['percent']![index] > 0
                        ? '+${mapPerform['percent']![index].toString()}%'
                        : '${mapPerform['percent']![index].toString()}%',
                    style: kPoppins.copyWith(
                        fontSize: 9,
                        color: mapPerform['percent']![index] < 0
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
        DotsIndicator(
          dotsCount: 3,
          position: (currentIndex! / 2).ceil(),
          decorator: DotsDecorator(
            activeColor: purpleColor,
            color: Colors.black12,
            spacing: const EdgeInsets.all(3),
            size: const Size(45, 4),
            activeSize: const Size(45, 4),
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
