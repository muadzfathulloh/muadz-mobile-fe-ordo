import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:muadz_mobilefeordo/app/data/colors.dart';

class BottomBar extends StatelessWidget {
  BottomBar(
      {Key? key,
      required this.text,
      required this.selected,
      required this.onPressed,
      required this.iconEnable,
      required this.iconDisable})
      : super(key: key);
  final String text;
  final String iconEnable;
  final String iconDisable;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          width: Get.width * 0.18,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              selected
                  ? SvgPicture.asset(
                      'assets/icons/${iconEnable}.svg',
                      width: 26,
                      height: 26,
                    )
                  : SvgPicture.asset(
                      'assets/icons/${iconDisable}.svg',
                      width: 24,
                      height: 24,
                    ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kPoppins.copyWith(
                      fontWeight: selected ? FontWeight.bold : FontWeight.w400,
                      color: selected ? Colors.white : Colors.grey.shade300,
                      fontSize: 11),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
