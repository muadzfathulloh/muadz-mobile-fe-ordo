import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muadz_mobilefeordo/core/values/colors.dart';
import 'package:muadz_mobilefeordo/presentation/main/widgets/recent_card.dart';

class RecentSession extends StatefulWidget {
  const RecentSession({super.key});

  @override
  State<RecentSession> createState() => _RecentSessionState();
}

class _RecentSessionState extends State<RecentSession> {
  @override
  Widget build(BuildContext context) {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Lead',
              style: kPoppins.copyWith(
                  color: textColor, fontSize: 13, fontWeight: FontWeight.w500),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 1),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: purpleColor.withOpacity(0.1)),
              child: SvgPicture.asset(
                'assets/icons/arrow-right.svg',
                fit: BoxFit.fitHeight,
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
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
                                color: purpleColor.withOpacity(0.12),
                                spreadRadius: 0,
                                blurRadius: 19,
                                offset: const Offset(0, -1),
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
                        asset: 'assets/${mapRecent['asset']![index]}.png',
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
      ],
    );
  }
}
