import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muadz_mobilefeordo/app/data/colors.dart';

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
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/calendar.svg'),
                    const SizedBox(width: 6),
                    Text(
                      date,
                      style: kPoppins.copyWith(
                          fontSize: 11,
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
                  color: textColor, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    ),
  );
}
