import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muadz_mobilefeordo/core/values/colors.dart';
import 'package:muadz_mobilefeordo/presentation/main/widgets/leaderboard_card.dart';

class LeaderBoardSession extends StatefulWidget {
  const LeaderBoardSession({super.key});

  @override
  State<LeaderBoardSession> createState() => _LeaderBoardSessionState();
}

class _LeaderBoardSessionState extends State<LeaderBoardSession> {
  @override
  Widget build(BuildContext context) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Leaderboards',
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
                      deal: mapLeaderBoard['deals']![index].toString(),
                      asset: 'assets/${mapLeaderBoard['asset']![index]}.png'),
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
    );
  }
}
