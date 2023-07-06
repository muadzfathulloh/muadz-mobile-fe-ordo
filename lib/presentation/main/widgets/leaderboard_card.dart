import 'package:flutter/material.dart';
import 'package:muadz_mobilefeordo/core/values/colors.dart';

class CardLeaderboard extends StatelessWidget {
  const CardLeaderboard(
      {super.key,
      required this.index,
      required this.name,
      required this.asset,
      required this.date,
      required this.deal});
  final int index;
  final String name;
  final String asset;
  final String date;
  final String deal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 15,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '${index + 1}',
                  textAlign: TextAlign.center,
                  style: kPoppins.copyWith(
                      color: primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(width: 15),
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
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      date,
                      style: kPoppins.copyWith(
                          fontSize: 11,
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
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 2),
            Text(
              'Deals',
              style: kPoppins.copyWith(
                  fontSize: 10,
                  color: Colors.black38,
                  fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }
}
