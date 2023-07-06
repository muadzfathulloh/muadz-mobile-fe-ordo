import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muadz_mobilefeordo/core/values/colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar(
      {super.key,
      required this.text,
      required this.selected,
      required this.onPressed,
      required this.iconEnable,
      required this.iconDisable});
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
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selected
                ? SvgPicture.asset(
                    'assets/icons/$iconEnable.svg',
                    width: 18,
                    height: 20,
                  )
                : SvgPicture.asset(
                    'assets/icons/$iconDisable.svg',
                    width: 18,
                    height: 20,
                  ),
            const SizedBox(height: 5),
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
    );
  }
}
