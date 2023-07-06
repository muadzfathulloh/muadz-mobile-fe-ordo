import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muadz_mobilefeordo/core/values/colors.dart';

class CardPerform extends StatelessWidget {
  const CardPerform(
      {super.key,
      required this.value,
      required this.title,
      required this.asset,
      required this.percent,
      required this.style,
      required this.color});

  final String value;
  final String title;
  final String asset;
  final String percent;
  final TextStyle style;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: purpleColor.withOpacity(0.12),
            spreadRadius: 0,
            blurRadius: 19,
            offset: const Offset(0, 9),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  height: 20,
                  width: 20,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: color),
                  child: SvgPicture.asset(asset),
                ),
                const SizedBox(width: 5),
                Text(
                  title,
                  style: kPoppins.copyWith(
                      color: textColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: kPoppins.copyWith(
                color: textColor, fontSize: 27, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last month',
                style: kPoppins.copyWith(
                    fontSize: 9,
                    color: Colors.black38,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                percent,
                style: style,
              ),
            ],
          )
        ],
      ),
    );
  }
}
